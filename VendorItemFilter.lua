local addonName, addonTable = ...
VendorItemFilter = {}
VendorItemFilter.currentFilter = "ALL"
local L = addonTable.L

local function SaveFilter(filterKey)
    VendorItemFilterDB = VendorItemFilterDB or {}
    VendorItemFilterDB.lastFilter = filterKey
end

local function LoadFilter()
    VendorItemFilterDB = VendorItemFilterDB or {}
    return VendorItemFilterDB.lastFilter or "ALL"
end

-- CATEGORÍAS ARMADURA
VendorItemFilter.ArmorSlots = {
    Cloth   = { text=L.Cloth,   slots={"HEAD","SHOULDER","CHEST","WAIST","LEGS","FEET","WRIST","HANDS"} },
    Leather = { text=L.Leather, slots={"HEAD","SHOULDER","CHEST","WAIST","LEGS","FEET","WRIST","HANDS"} },
    Mail    = { text=L.Mail,    slots={"HEAD","SHOULDER","CHEST","WAIST","LEGS","FEET","WRIST","HANDS"} },
    Plate   = { text=L.Plate,   slots={"HEAD","SHOULDER","CHEST","WAIST","LEGS","FEET","WRIST","HANDS"} },
}

local ArmorSlotText = {
    HEAD=L.Head, SHOULDER=L.Shoulder, CHEST=L.Chest, WAIST=L.Waist,
    LEGS=L.Legs, FEET=L.Feet, WRIST=L.Wrist, HANDS=L.Hands,
}

VendorItemFilter.ArmorJewelry = {
    Amulet  = { text=L.Amulets,  equipLoc={"INVTYPE_NECK"} },
    Ring    = { text=L.Rings,    equipLoc={"INVTYPE_FINGER"} },
    Trinket = { text=L.Trinkets, equipLoc={"INVTYPE_TRINKET"} },
}

VendorItemFilter.ArmorOther = {
    Cloak   = { text=L.Cloaks,   equipLoc={"INVTYPE_CLOAK"} },
    Relic   = { text=L.Relic,    isHeirloom=true },
    Shield  = { text=L.Shield,   equipLoc={"INVTYPE_SHIELD"} },
    OffHand = { text=L.OffHand,  equipLoc={"INVTYPE_HOLDABLE","INVTYPE_WEAPONOFFHAND"} },
    Shirt   = { text=L.Shirt,    equipLoc={"INVTYPE_BODY"} },
    Tabard  = { text=L.Tabard,   equipLoc={"INVTYPE_TABARD"} },
}

-- CATEGORÍAS ARMAS
VendorItemFilter.WeaponCategories = {
    OneHanded = {
        text = L.OneHanded,
        subs = {
            Generic  = { text=L.OneHanded,   equipLoc={"INVTYPE_WEAPON"} },
            MainHand = { text=L.MainHand,    equipLoc={"INVTYPE_WEAPONMAINHAND"} },
            OffHand  = { text=L.OffHand,     equipLoc={"INVTYPE_WEAPONOFFHAND"} },
            Fist     = { text=L.FistWeapons, equipLoc={"INVTYPE_WEAPON"} },
            Shield   = { text=L.Shield,      equipLoc={"INVTYPE_SHIELD"} },
        }
    },
    TwoHanded = {
        text = L.TwoHanded,
        subs = {
            TwoHand = { text=L.TwoHanded, equipLoc={"INVTYPE_2HWEAPON"} },
        }
    },
    Ranged = {
        text = L.Ranged,
        subs = {
            Ranged = { text=L.Ranged, equipLoc={
                "INVTYPE_RANGED",
                "INVTYPE_RANGEDRIGHT",
                "INVTYPE_THROWN"
            }},
        }
    },
    Other = {
        text = L.OtherWeapons,
        subs = {
            Fishing = { text=L.FishingPoles, equipLoc={"INVTYPE_FISHINGPOLE"} },
        }
    }
}

-- FUNCIONES DE FILTRO
local function ShouldShowItem(link)
    if not link or VendorItemFilter.currentFilter=="ALL" then return true end
    local _, _, _, _, _, itemType, itemSubType, _, itemEquipLoc = GetItemInfo(link)
    local f = VendorItemFilter.currentFilter

    if f:find("_") then
        local typ, slot = f:match("^(%a+)_(%a+)$")
        if typ and slot and VendorItemFilter.ArmorSlots[typ] then
            return itemSubType==VendorItemFilter.ArmorSlots[typ].text
                   and (itemEquipLoc:upper()=="INVTYPE_"..slot:upper())
        end
    end
    for typ,data in pairs(VendorItemFilter.ArmorSlots) do
        if f==typ then return itemSubType==data.text end
    end
    for cat,v in pairs(VendorItemFilter.ArmorJewelry) do
        if f==cat then return itemEquipLoc==v.equipLoc[1] end
    end
    for cat,v in pairs(VendorItemFilter.ArmorOther) do
        if f==cat then
            if v.isHeirloom then
                local _, _, quality = GetItemInfo(link)
                if not quality then return false end
                return quality == 7
            end
            if type(v.equipLoc)=="table" then
                return tContains(v.equipLoc,itemEquipLoc)
            else
                return itemEquipLoc==v.equipLoc
            end
        end
    end

    -- ARMAS
    for mainCat,data in pairs(VendorItemFilter.WeaponCategories) do
        if f==mainCat then
            for _,sub in pairs(data.subs) do
                if tContains(sub.equipLoc,itemEquipLoc) then return true end
            end
            return false
        elseif data.subs and data.subs[f] then
            local sub = data.subs[f]
            if tContains(sub.equipLoc,itemEquipLoc) then return true end
            return false
        end
    end
    return true
end

-- APLICAR FILTRO
function VendorItemFilter:ApplyFilter()
    local numItems = GetMerchantNumItems()
    for i=1,MERCHANT_ITEMS_PER_PAGE do
        local index = ((MerchantFrame.page-1)*MERCHANT_ITEMS_PER_PAGE)+i
        local itemButton=_G["MerchantItem"..i]
        if index<=numItems then
            local link = GetMerchantItemLink(index)
            if link and not ShouldShowItem(link) then
                itemButton:Hide()
            else
                itemButton:Show()
            end
        else
            itemButton:Hide()
        end
    end
end

-- CREAR DROPDOWN
local function CreateDropdown()
    if VendorItemFilterDropdown then return end
    local dropdown = CreateFrame("Frame", "VendorItemFilterDropdown", MerchantFrame, "UIDropDownMenuTemplate")
    dropdown:SetPoint("TOPLEFT", MerchantFrame, "TOPLEFT", 60, -30)
    UIDropDownMenu_SetWidth(dropdown, 180)
    UIDropDownMenu_SetText(dropdown, L.ALL)
end

-- CAMBIAR FILTRO
function VendorItemFilter:SetFilter(filterKey)
    self.currentFilter = filterKey or "ALL"
    SaveFilter(self.currentFilter)  -- Guardamos el último filtro

    local displayText = L.ALL
    if filterKey and filterKey:find("_") then
        local typ, slot = filterKey:match("^(%a+)_(%a+)$")
        if typ and slot and VendorItemFilter.ArmorSlots[typ] then
            displayText = VendorItemFilter.ArmorSlots[typ].text .. " - " .. (ArmorSlotText[slot] or slot)
        end
    elseif VendorItemFilter.ArmorSlots[filterKey] then
        displayText = VendorItemFilter.ArmorSlots[filterKey].text
    elseif VendorItemFilter.ArmorJewelry[filterKey] then
        displayText = VendorItemFilter.ArmorJewelry[filterKey].text
    elseif VendorItemFilter.ArmorOther[filterKey] then
        displayText = VendorItemFilter.ArmorOther[filterKey].text
    else
        for cat,data in pairs(VendorItemFilter.WeaponCategories) do
            if filterKey == cat then
                displayText = data.text
            elseif data.subs[filterKey] then
                displayText = data.subs[filterKey].text
            end
        end
    end

    UIDropDownMenu_SetText(VendorItemFilterDropdown, displayText)
    self:ApplyFilter()
end

-- INICIAR DROPDOWN
function VendorItemFilter:InitDropdown()
    local function OnClick(selfArg) VendorItemFilter:SetFilter(selfArg.value) end

    UIDropDownMenu_Initialize(VendorItemFilterDropdown,function(selfArg,level,menuList)
        local info = UIDropDownMenu_CreateInfo()
        if level==1 then
            info.text,info.value,info.func=L.ALL,"ALL",OnClick
            UIDropDownMenu_AddButton(info,level)

            info.text,info.hasArrow,info.menuList,info.notCheckable=L.Armors,true,"ARMOR",true
            UIDropDownMenu_AddButton(info,level)

            info.text,info.hasArrow,info.menuList,info.notCheckable=L.Weapons,true,"WEAPONS",true
            UIDropDownMenu_AddButton(info,level)

        elseif menuList=="ARMOR" then
            local ainfo=UIDropDownMenu_CreateInfo()
            ainfo.text=L.Types
            ainfo.hasArrow=true
            ainfo.menuList="ARMOR_TYPES"
            ainfo.notCheckable=true
            UIDropDownMenu_AddButton(ainfo,level)

            local jinfo=UIDropDownMenu_CreateInfo()
            jinfo.text=L.Jewelry
            jinfo.hasArrow=true
            jinfo.menuList="ARMOR_JEWELRY"
            jinfo.notCheckable=true
            UIDropDownMenu_AddButton(jinfo,level)

            local oinfo=UIDropDownMenu_CreateInfo()
            oinfo.text=L.Other
            oinfo.hasArrow=true
            oinfo.menuList="ARMOR_OTHER"
            oinfo.notCheckable=true
            UIDropDownMenu_AddButton(oinfo,level)

        elseif menuList=="ARMOR_TYPES" then
            for typ,data in pairs(VendorItemFilter.ArmorSlots) do
                local ainfo=UIDropDownMenu_CreateInfo()
                ainfo.text=data.text
                ainfo.hasArrow=true
                ainfo.menuList=typ
                ainfo.notCheckable=true
                ainfo.func=function(self) VendorItemFilter:SetFilter(typ) end
                UIDropDownMenu_AddButton(ainfo,level)
            end
        elseif VendorItemFilter.ArmorSlots[menuList] then
            for _,slot in ipairs(VendorItemFilter.ArmorSlots[menuList].slots) do
                local sinfo=UIDropDownMenu_CreateInfo()
                sinfo.text=ArmorSlotText[slot] or slot
                sinfo.value=menuList.."_"..slot
                sinfo.func=OnClick
                UIDropDownMenu_AddButton(sinfo,level)
            end
        elseif menuList=="ARMOR_JEWELRY" then
            for cat,v in pairs(VendorItemFilter.ArmorJewelry) do
                local jinfo=UIDropDownMenu_CreateInfo()
                jinfo.text=v.text
                jinfo.value=cat
                jinfo.func=OnClick
                UIDropDownMenu_AddButton(jinfo,level)
            end
        elseif menuList=="ARMOR_OTHER" then
            for cat,v in pairs(VendorItemFilter.ArmorOther) do
                local oinfo=UIDropDownMenu_CreateInfo()
                oinfo.text=v.text
                oinfo.value=cat
                oinfo.func=OnClick
                UIDropDownMenu_AddButton(oinfo,level)
            end
        elseif menuList=="WEAPONS" then
            for cat,data in pairs(VendorItemFilter.WeaponCategories) do
                local winfo=UIDropDownMenu_CreateInfo()
                winfo.text=data.text
                winfo.hasArrow=true
                winfo.menuList=cat
                winfo.notCheckable=true
                winfo.func=function(self) VendorItemFilter:SetFilter(cat) end
                UIDropDownMenu_AddButton(winfo,level)
            end
        elseif VendorItemFilter.WeaponCategories[menuList] then
            for sub,subdata in pairs(VendorItemFilter.WeaponCategories[menuList].subs) do
                local sinfo=UIDropDownMenu_CreateInfo()
                sinfo.text=subdata.text
                sinfo.value=sub
                sinfo.func=OnClick
                UIDropDownMenu_AddButton(sinfo,level)
            end
        end
    end)

    UIDropDownMenu_SetWidth(VendorItemFilterDropdown,180)
    UIDropDownMenu_SetText(VendorItemFilterDropdown,L.ALL)
end

-- EVENTOS
local f=CreateFrame("Frame")
f:RegisterEvent("MERCHANT_SHOW")
f:SetScript("OnEvent", function(self,event)
    if event=="MERCHANT_SHOW" then
        CreateDropdown()
        VendorItemFilter:InitDropdown()
        local lastFilter = LoadFilter()
        VendorItemFilter:SetFilter(lastFilter)
    end
end)

hooksecurefunc("MerchantFrame_Update",function() VendorItemFilter:ApplyFilter() end)
hooksecurefunc("MerchantFrame_UpdateMerchantInfo",function() VendorItemFilter:ApplyFilter() end)
