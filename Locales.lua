local addonName, addonTable = ...
local L = {}

local locale = GetLocale()

if locale == "esES" then
    L.ALL       = "Todos"
    L.Armors    = "Armadura"
    L.Weapons   = "Armas"
    L.Types     = "Tipos"
    L.Jewelry   = "Joyería"
    L.Other     = "Otros"

    L.Cloth   = "Tela"
    L.Leather = "Cuero"
    L.Mail    = "Malla"
    L.Plate   = "Placas"

    L.Head    = "Cabeza"
    L.Shoulder= "Hombros"
    L.Chest   = "Pecho"
    L.Waist   = "Cintura"
    L.Legs    = "Piernas"
    L.Feet    = "Pies"
    L.Wrist   = "Muñecas"
    L.Hands   = "Manos"

    L.Amulets  = "Cuello"
    L.Rings    = "Anillos"
    L.Trinkets = "Abalorios"

    L.Relic      = "Reliquias"
    L.Cloaks     = "Capa"
    L.OffHand    = "Segunda Mano"
    L.Shirt      = "Camisas"
    L.Tabard     = "Tabardos"

    L.OneHanded       = "Una Mano"
    L.TwoHanded       = "Dos Manos"
    L.Ranged          = "A Distancia"
    L.OtherWeapons    = "Otros"

    L.MainHand        = "Mano Derecha"
    L.OffHand         = "Mano Izquierda"
    L.FistWeapons     = "Armas de Puño"
    L.OneHanded       = "Una Mano"
    L.Shield          = "Escudos"
    L.TwoHanded       = "Dos Manos"
    L.FishingPoles    = "Cañas de Pescar"


elseif locale == "deDE" then
    L.ALL       = "Alle"
    L.Armors    = "Rüstung"
    L.Weapons   = "Waffen"
    L.Types     = "Typen"
    L.Jewelry   = "Schmuck"
    L.Other     = "Andere"

    L.Cloth   = "Stoff"
    L.Leather = "Leder"
    L.Mail    = "Kette"
    L.Plate   = "Platte"

    L.Head     = "Kopf"
    L.Shoulder = "Schulter"
    L.Chest    = "Brust"
    L.Waist    = "Taille"
    L.Legs     = "Beine"
    L.Feet     = "Füße"
    L.Wrist    = "Handgelenke"
    L.Hands    = "Hände"

    L.Amulets  = "Hals"
    L.Rings    = "Ringe"
    L.Trinkets = "Schmuckstücke"

    L.Relic      = "Relikte"
    L.Cloaks     = "Umhänge"
    L.OffHand    = "Nebenhand"
    L.Shirt      = "Hemden"
    L.Tabard     = "Wappenröcke"

    L.OneHanded       = "Einhändig"
    L.TwoHanded       = "Zweihändig"
    L.Ranged          = "Distanz"
    L.OtherWeapons    = "Andere"

    L.MainHand        = "Haupthand"
    L.OffHand         = "Nebenhand"
    L.FistWeapons     = "Faustwaffen"
    L.OneHanded       = "Einhändig"
    L.Shield          = "Schilde"
    L.TwoHanded       = "Zweihändig"
    L.FishingPoles    = "Angelruten"


elseif locale == "frFR" then
    L.ALL       = "Tous"
    L.Armors    = "Armures"
    L.Weapons   = "Armes"
    L.Types     = "Types"
    L.Jewelry   = "Bijoux"
    L.Other     = "Autres"

    L.Cloth   = "Tissu"
    L.Leather = "Cuir"
    L.Mail    = "Maille"
    L.Plate   = "Plaque"

    L.Head     = "Tête"
    L.Shoulder = "Épaules"
    L.Chest    = "Torse"
    L.Waist    = "Taille"
    L.Legs     = "Jambes"
    L.Feet     = "Pieds"
    L.Wrist    = "Poignets"
    L.Hands    = "Mains"

    L.Amulets  = "Cou"
    L.Rings    = "Anneaux"
    L.Trinkets = "Bijoux d'âme"

    L.Relic      = "Reliques"
    L.Cloaks     = "Capes"
    L.OffHand    = "Main gauche"
    L.Shirt      = "Chemises"
    L.Tabard     = "Tabards"

    L.OneHanded       = "Une main"
    L.TwoHanded       = "Deux mains"
    L.Ranged          = "À distance"
    L.OtherWeapons    = "Autres"

    L.MainHand        = "Main droite"
    L.OffHand         = "Main gauche"
    L.FistWeapons     = "Armes de poing"
    L.OneHanded       = "Une main"
    L.Shield          = "Boucliers"
    L.TwoHanded       = "Deux mains"
    L.FishingPoles    = "Canne à pêche"


elseif locale == "itIT" then
    L.ALL       = "Tutti"
    L.Armors    = "Armature"
    L.Weapons   = "Armi"
    L.Types     = "Tipi"
    L.Jewelry   = "Gioielli"
    L.Other     = "Altri"

    L.Cloth   = "Stoffa"
    L.Leather = "Cuoio"
    L.Mail    = "Maglia"
    L.Plate   = "Piastre"

    L.Head     = "Testa"
    L.Shoulder = "Spalle"
    L.Chest    = "Torso"
    L.Waist    = "Vita"
    L.Legs     = "Gambe"
    L.Feet     = "Piedi"
    L.Wrist    = "Polsi"
    L.Hands    = "Mani"

    L.Amulets  = "Collo"
    L.Rings    = "Anelli"
    L.Trinkets = "Monili"

    L.Relic      = "Reliquie"
    L.Cloaks     = "Mantelli"
    L.OffHand    = "Mano Secondaria"
    L.Shirt      = "Camicie"
    L.Tabard     = "Tabard"

    L.OneHanded       = "Una Mano"
    L.TwoHanded       = "Due Mani"
    L.Ranged          = "A Distanza"
    L.OtherWeapons    = "Altre"

    L.MainHand        = "Mano Principale"
    L.OffHand         = "Mano Secondaria"
    L.FistWeapons     = "Armi da Mischia"
    L.OneHanded       = "Una Mano"
    L.Shield          = "Scudi"
    L.TwoHanded       = "Due Mani"
    L.FishingPoles    = "Canne da Pesca"


elseif locale == "enUS" then
    L.ALL       = "All"
    L.Armors    = "Armor"
    L.Weapons   = "Weapons"
    L.Types     = "Types"
    L.Jewelry   = "Jewelry"
    L.Other     = "Other"

    L.Cloth   = "Cloth"
    L.Leather = "Leather"
    L.Mail    = "Mail"
    L.Plate   = "Plate"

    L.Head     = "Head"
    L.Shoulder = "Shoulder"
    L.Chest    = "Chest"
    L.Waist    = "Waist"
    L.Legs     = "Legs"
    L.Feet     = "Feet"
    L.Wrist    = "Wrist"
    L.Hands    = "Hands"

    L.Amulets  = "Neck"
    L.Rings    = "Rings"
    L.Trinkets = "Trinkets"

    L.Relic      = "Relics"
    L.Cloaks     = "Cloaks"
    L.OffHand    = "Off-hand"
    L.Shirt      = "Shirts"
    L.Tabard     = "Tabards"

    L.OneHanded       = "One-Handed"
    L.TwoHanded       = "Two-Handed"
    L.Ranged          = "Ranged"
    L.OtherWeapons    = "Other"

    L.MainHand        = "Main Hand"
    L.OffHand         = "Off Hand"
    L.FistWeapons     = "Fist Weapons"
    L.OneHanded       = "One-Handed"
    L.Shield          = "Shields"
    L.TwoHanded       = "Two-Handed"
    L.FishingPoles    = "Fishing Poles"


elseif locale == "ruRU" then
    L.ALL       = "Все"
    L.Armors    = "Броня"
    L.Weapons   = "Оружие"
    L.Types     = "Типы"
    L.Jewelry   = "Украшения"
    L.Other     = "Другое"

    L.Cloth   = "Ткань"
    L.Leather = "Кожа"
    L.Mail    = "Кольчуга"
    L.Plate   = "Латы"

    L.Head     = "Голова"
    L.Shoulder = "Плечи"
    L.Chest    = "Грудь"
    L.Waist    = "Пояс"
    L.Legs     = "Ноги"
    L.Feet     = "Ступни"
    L.Wrist    = "Запястья"
    L.Hands    = "Кисти рук"

    L.Amulets  = "Шея"
    L.Rings    = "Кольца"
    L.Trinkets = "Аксессуары"

    L.Relic      = "Реликвии"
    L.Cloaks     = "Плащи"
    L.OffHand    = "Левая рука"
    L.Shirt      = "Рубашки"
    L.Tabard     = "Табарды"

    L.OneHanded       = "Одноручное"
    L.TwoHanded       = "Двуручное"
    L.Ranged          = "Дальний бой"
    L.OtherWeapons    = "Другое"

    L.MainHand        = "Правая рука"
    L.OffHand         = "Левая рука"
    L.FistWeapons     = "Кистевое оружие"
    L.OneHanded       = "Одноручное"
    L.Shield          = "Щиты"
    L.TwoHanded       = "Двуручное"
    L.FishingPoles    = "Удочки"


elseif locale == "koKR" then
    L.ALL       = "모두"
    L.Armors    = "방어구"
    L.Weapons   = "무기"
    L.Types     = "종류"
    L.Jewelry   = "장신구"
    L.Other     = "기타"

    L.Cloth   = "천"
    L.Leather = "가죽"
    L.Mail    = "사슬"
    L.Plate   = "판금"

    L.Head     = "머리"
    L.Shoulder = "어깨"
    L.Chest    = "가슴"
    L.Waist    = "허리"
    L.Legs     = "다리"
    L.Feet     = "발"
    L.Wrist    = "손목"
    L.Hands    = "손"

    L.Amulets  = "목"
    L.Rings    = "반지"
    L.Trinkets = "장신구"

    L.Relic      = "유물"
    L.Cloaks     = "망토"
    L.OffHand    = "보조장비"
    L.Shirt      = "셔츠"
    L.Tabard     = "휘장"

    L.OneHanded       = "한손 무기"
    L.TwoHanded       = "양손 무기"
    L.Ranged          = "원거리 무기"
    L.OtherWeapons    = "기타"

    L.MainHand        = "주장비"
    L.OffHand         = "보조장비"
    L.FistWeapons     = "장착 무기"
    L.OneHanded       = "한손 무기"
    L.Shield          = "방패"
    L.TwoHanded       = "양손 무기"
    L.FishingPoles    = "낚싯대"


elseif locale == "zhCN" then
    L.ALL       = "全部"
    L.Armors    = "护甲"
    L.Weapons   = "武器"
    L.Types     = "类型"
    L.Jewelry   = "首饰"
    L.Other     = "其他"

    L.Cloth   = "布甲"
    L.Leather = "皮甲"
    L.Mail    = "锁甲"
    L.Plate   = "板甲"

    L.Head     = "头部"
    L.Shoulder = "肩部"
    L.Chest    = "胸部"
    L.Waist    = "腰部"
    L.Legs     = "腿部"
    L.Feet     = "脚"
    L.Wrist    = "手腕"
    L.Hands    = "手"

    L.Amulets  = "项链"
    L.Rings    = "戒指"
    L.Trinkets = "饰品"

    L.Relic      = "圣物"
    L.Cloaks     = "披风"
    L.OffHand    = "副手"
    L.Shirt      = "衬衣"
    L.Tabard     = "战袍"

    L.OneHanded       = "单手"
    L.TwoHanded       = "双手"
    L.Ranged          = "远程"
    L.OtherWeapons    = "其他"

    L.MainHand        = "主手"
    L.OffHand         = "副手"
    L.FistWeapons     = "拳套"
    L.OneHanded       = "单手"
    L.Shield          = "盾牌"
    L.TwoHanded       = "双手"
    L.FishingPoles    = "钓鱼竿"


elseif locale == "zhTW" then
    L.ALL       = "全部"
    L.Armors    = "護甲"
    L.Weapons   = "武器"
    L.Types     = "類型"
    L.Jewelry   = "飾品"
    L.Other     = "其他"

    L.Cloth   = "布甲"
    L.Leather = "皮甲"
    L.Mail    = "鎖甲"
    L.Plate   = "鎧甲"

    L.Head     = "頭部"
    L.Shoulder = "肩部"
    L.Chest    = "胸部"
    L.Waist    = "腰部"
    L.Legs     = "腿部"
    L.Feet     = "腳"
    L.Wrist    = "手腕"
    L.Hands    = "手"

    L.Amulets  = "項鍊"
    L.Rings    = "戒指"
    L.Trinkets = "飾品"

    L.Relic      = "聖物"
    L.Cloaks     = "披風"
    L.OffHand    = "副手"
    L.Shirt      = "襯衫"
    L.Tabard     = "戰袍"
    L.OneHanded       = "單手"
    L.TwoHanded       = "雙手"
    L.Ranged          = "遠程"
    L.OtherWeapons    = "其他"

    L.MainHand        = "主手"
    L.OffHand         = "副手"
    L.FistWeapons     = "拳套"
    L.OneHanded       = "單手"
    L.Shield          = "盾牌"
    L.TwoHanded       = "雙手"
    L.FishingPoles    = "釣魚竿"

end

addonTable.L = L
