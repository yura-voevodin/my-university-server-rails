# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

if University.sumdu.nil?
  University.create(
    short_name: "СумДУ",
    full_name: "Сумський державний університет",  
    url: "sumdu",
    website: 'https://sumdu.edu.ua/uk',
    uid: 1
    )
end

if University.kpi.nil?
  University.create(
    short_name: "КПІ",
    full_name: 'Національний технічний університет України "Київський політехнічний інститут імені Ігоря Сікорського"',
    url: "kpi",
    website: 'https://kpi.ua',
    uid: 2
    )
end

if University.khnue.nil?
  University.create(
    short_name: "ХНЕУ",
    full_name: 'Харківський національний економічний університет',  
    url: "khnue",
    website: 'https://www.hneu.edu.ua',
    uid: 3
    )
end

if University.nau.nil?
  University.create(
    short_name: "НАУ",
    full_name: 'Національний авіаційний університет', 
    url: "nau",
    website: '',
    uid: 4
    )
end

if University.pnu.nil?
  University.create(
    short_name: "ПНУ",
    full_name: 'Прикарпатський національний університет імені Василя Стефаника', 
    url: "pnu",
    website: 'https://pnu.edu.ua',
    uid: 5
    )
end

if University.znau.nil?
  University.create(
    short_name: "ПНУ",
    full_name: 'Поліський національний університет', 
    url: 'polissya-national-university',
    website: 'http://znau.edu.ua',
    uid: 6
    )
end

if University.nuft.nil?
  University.create(
    short_name: "НУХТ",
    full_name: 'Національний університет харчових технологій', 
    url: "nuft",
    website: 'https://nuft.edu.ua',
    uid: 7
    )
end

if University.sspu.nil?
  University.create(
    short_name: "СумДПУ",
    full_name: 'Сумський державний педагогічний університет імені А.С.Макаренка',
    url: "sspu",
    website: 'https://sspu.edu.ua',
    uid: 8
    )
end

if University.gpnu.nil?
  University.create(
    short_name: "ГНПУ",
    full_name: 'Глухівський національний педагогічний університет імені Олександра Довженка',
    url: "gpnu",
    website: 'http://new.gnpu.edu.ua/uk',
    uid: 9
    )
end

if University.lnu.nil?
  University.create(
    short_name: "ЛНУ",
    full_name: 'Львівський національний університет імені Івана Франка',
    url: "lnu",
    website: 'https://lnu.edu.ua',
    uid: 10
    )
end

if University.nuwm.nil?
  University.create(
    short_name: "НУВГП",
    full_name: 'Національний університет водного господарства та природокористування',
    url: "nuwm",
    website: 'https://nuwm.edu.ua',
    uid: 11
    )
end

if University.ubs.nil?
  University.create(
    short_name: "УБС",
    full_name: 'Університет банківської справи',
    url: "ubs",
    website: 'https://ubs.edu.ua',
    uid: 12
    )
end

if University.ldubgd.nil?
  University.create(
    short_name: "ЛДУ БЖД",
    full_name: 'Львівський державний університет безпеки життєдіяльності',
    url: "ldubgd",
    website: 'https://ldubgd.edu.ua',
    uid: 13
    )
end

if University.nung.nil?
  University.create(
    short_name: "ІФНТУНГ",
    full_name: 'Івано-Франківський національний технічний університет нафти і газу',
    url: "nung",
    website: 'https://nung.edu.ua',
    uid: 14
    )
end

# Buildings for SumDU
sumdu_buildings = [
  { name: "АК", description: "" },
  { name: "АН", description: "" },
  { name: "БІЦ", description: "" },
  { name: "Г", description: "Головний" },
  { name: "ГТ4", description: "" },
  { name: "ГТ5", description: "" },
  { name: "ГТ6", description: "" },
  { name: "ЕТ", description: "Електронних технологій" },
  { name: "К1", description: "" },
  { name: "К2", description: "" },
  { name: "К3", description: "" },
  { name: "конАК", description: "" },
  { name: "КУКл", description: "" },
  { name: "ЛА", description: "" },
  { name: "ЛБ", description: "" },
  { name: "М", description: "" },
  { name: "Н", description: "Новий" },
  { name: "С", description: "" },
  { name: "СП", description: "" },
  { name: "ССМ", description: "" },
  { name: "Т", description: "" },
  { name: "ТЗ", description: "" },
  { name: "Ц", description: "Центральний" },
  { name: "кл.кафПА", description: "" },
  { name: "кл.кафХІР", description: "Кафедра хірургії" },
  { name: "клЛДВЦ", description: "" },
  { name: "клМДКЛ", description: "" },
  { name: "клМДКЛп2", description: "" },
  { name: "клМКЛ", description: "" },
  { name: "клМКПБ", description: "" },
  { name: "клМКСП", description: "" },
  { name: "клОДКЛ", description: "" },
  { name: "клОДРЗН", description: "" },
  { name: "клОКГВВ", description: "" },
  { name: "клОКЛ", description: "" },
  { name: "клОКЛФД", description: "" },
  { name: "клОКЛп", description: "" },
  { name: "клОКЛхір", description: "" },
  { name: "клОКПТД", description: "" },
  { name: "клОКПЦ", description: "" },
  { name: "клОКСП", description: "" },
  { name: "клОКСПд", description: "" },
  { name: "клЦРКЛ", description: "Центральна клінічна лікарня" },
  { name: "конНК2", description: "" },
  { name: "клОКПТДст", description: "" },
  { name: "клОНДдис", description: "" },
  { name: "клОНДнар", description: "" },
  { name: "клПрСТОМ", description: "" },
  { name: "клСОІКЛ", description: "" },
  { name: "клСОКД", description: "" },
  { name: "клСОКОД", description: "" },
  { name: "клЦЗору", description: "Цент Зору" },
  { name: "клОДКЛст", description: "" },
  { name: "клОДЦ", description: "" },
  { name: "клМЦелед", description: 'Медичний центр "Еледія"' },
  { name: "клМП", description: "" },
]
sumdu_buildings.each do |item|
  building = Building.find_by(university: University.sumdu, name: item[:name])
  building = Building.new unless building
  building.university = University.sumdu
  building.name = item[:name]
  building.description = item[:description]
  building.save
end

# Add visible name
Discipline.all.each do |discipline|
  if discipline.visible_name == ""
    discipline.visible_name = discipline.name.downcase
    discipline.save
  end
end

# Names of disciplines to improve
impoved_names = [
  { name: "Інвестиційна діяльність в банк", visible_name: "інвестиційна діяльність в банківській сфері" },
  { name: "теор.нечіт.сист.прийняття ріш.", visible_name: "теорія нечітких систем прийняття рішень" },
  { name: "психотерапія та соціотерапія в", visible_name: "психотерапія та соціотерапія" },
  { name: "осн.проект.інтел.систем - КР", visible_name: "основи проектування інтелектуальних систем - курсова робота" },
  { name: "наук.осн.виб.мат.і прогр.зміцн", visible_name: "наукова основа вибіркової математики і програмного зміцнення" },
  { name: "внутрішньогосп К", visible_name: "внутрішньогосп" },
  { name: "Чисельні мет.в мех.", visible_name: "чисельні методи в механіці" },
  { name: "Цифрові автомат.", visible_name: "цифрові автоматати" },
  { name: "Хірургічна стомат.", visible_name: "хірургічна стоматологія" },
  { name: "Хірург. хв. з дидяч. хірург.", visible_name: "хірургічні хвороби з дитячої хірургії" },
  { name: "Фінанс. менеджм.", visible_name: "фінансовий менеджмент" },
  { name: "Фін.діял.суб'єктів підприємн.", visible_name: "фінансова діяльність суб'єктів підприємництва" },
  { name: "Фін. контролінг", visible_name: "фінансовий контролінг" },
  { name: "Фін. діяльність суб. господар.", visible_name: "фінансова діяльність суб. господарств" },
  { name: "Фін. глобалізація", visible_name: "фінансова глобалізація" },
  { name: "Фізична реабіл., спорт. мед", visible_name: "фізична реабілітація, спортивна медицина" },
  { name: "Фізика елек. процесів", visible_name: "фізика електричних процесів" },
  { name: "Фіз. складних сит.", visible_name: "фізика складних систем" },
  { name: "Фіз. люд.", visible_name: "фізіологія людини" },
  { name: "Функ. програм.", visible_name: "функіональне програмування" },
  { name: "Функц. електроніка", visible_name: "функціональна електроніка" },
  { name: "Фунд. осн. нанотехнологій", visible_name: "фундаментальні основи нанотехнологій" },
  { name: "Формуван. проектн. команди", visible_name: "формування проектної команди" },
  { name: "Управління інновац. розвитком", visible_name: "управління інноваційним розвитком" },
  { name: "Управління інвест.", visible_name: "управління інвестиціями" },
  { name: "Управлін. інформ. безпек.", visible_name: "управління інформаційною безпекою" },
  { name: "Управлін. проект. інформатизац", visible_name: "управління проектною інформатизацією" },
  { name: "Управл. іміджем", visible_name: "управління імеджем" },
  { name: "Управл. орган. розвитком", visible_name: "управління організаційним розвитком" },
  { name: "Управл. облік", visible_name: "управління обліку" },
  { name: "Управл. банк. ризиками", visible_name: " управління банківськими ризиками" },
  { name: "Управ. змістом робіт", visible_name: "управління змістом робіт" },
  { name: "Управл. інформац. зв.", visible_name: "управління інформаційними звязками" },
  { name: "Управл. роз. соц.-екон. сист.", visible_name: "управління розвитком социально-економічної системи" },
  { name: "Управл. потенц. підприєм.", visible_name: "управління потенціалом підприємства" },
  { name: "Управл. конфл. та змінами в ор", visible_name: "управління конфликтами та змінами в організаціях" },
  { name: "Управ. труд. рес.", visible_name: "управління трудовими ресурсами" },
  { name: "Упр. екон. потенц. підпр.", visible_name: "управління економомічним потенціалом підприємства" },
  { name: "Укр. у світовій політ.", visible_name: "україна у світовій політиці" },
  { name: "Укр. мова ЗМІ", visible_name: "украінська мова ЗМІ" },
  { name: "Травматол. і ортопедія", visible_name: "травматологія і ортопедія" },
  { name: "Тов. інновац. політика", visible_name: "товарна інноваційна політика" },
  { name: "Технологія створення інформац.", visible_name: "технологія створення інформації" },
  { name: "Технологічні основи електрон.", visible_name: "технологічні основи електроніки" },
  { name: "Техн.виробн.та обр. матер", visible_name: "технології виробництва та обробки матеріалів" },
  { name: "Техн. утил. та вид. відх", visible_name: "технологія утилізації та види відходів" },
  { name: "Техн. термодинаміка", visible_name: "технічна термодинаміка" },
  { name: "Техн. основи машинобудув.", visible_name: "технологічні основи машинобудування" },
  { name: "Техн. машинобуд. виробн.", visible_name: "технології машинобудувального виробництва" },
  { name: "Техн. комп. проект.", visible_name: "технології комп'ютерного проєктування" },
  { name: "Техн. захисту інформац.", visible_name: "технології захисту інформації" },
  { name: "Терапевтична стомат.", visible_name: "терапевтична стоматологія" },
  { name: "Теорія інформац. і обр. сигн.", visible_name: "теорія інформації і обробка сигналів" },
  { name: "Теорія функц. дійсн. змінної", visible_name: "теорія функцій дійсної змінної" },
  { name: "Теорія систем та сист. аналіз", visible_name: "теорія систем та системний аналіз" },
  { name: "Теорія орган.", visible_name: "теорія організації" },
  { name: "Теорія ймовірн. та мат.статист", visible_name: "теорія ймовірностей та математична статистика" },
  { name: "Теорія алгор. та мат.логіка", visible_name: "теорія алгоритмів та математична логіка" },
  { name: "Теорет.осн.електротехніки", visible_name: "теоретичні основи електротехніки" },
  { name: "Теор.основи теплотехніки", visible_name: "теоретичні основи теплотехніки" },
  { name: "Теор. інф. та кодування", visible_name: "теорія інформації та кодування" },
  { name: "Теор. і метод. плавання", visible_name: "теорія і методика плавання" },
  { name: "Теор. і метод. легкої атлет.", visible_name: "теорія і методика легкої атлетики" },
  { name: "Теор. і метод. гімнастики", visible_name: "теорія і методика гімнастики" },
  { name: "Теор. і мет. фіз. вихов.", visible_name: "теорія і методика фізичного виховання" },
  { name: "Теор. і мет. спорт. ігор.", visible_name: "теорія і методика спортивних ігор" },
  { name: "Теор. і мет. лижн. видів спорт", visible_name: "теорія і методика лижних видів спорту" },
  { name: "Теор. і мет. журн. творч. - КР", visible_name: "теорія і методика журналістської творчості - КР" },
  { name: "Теор. турбокомпресорів", visible_name: "теорія турбокомпресорів" },
  { name: "Теор. та прикл. метрологія", visible_name: "теоретична та прикладна метрологія" },
  { name: "Теор. електрозв.", visible_name: "теорія електрозварювання" },
  { name: "Телеком. сист. передачі даних", visible_name: "телекомунікаційні системи передачі даних" },
  { name: "Телек. та інформац. мережі", visible_name: "телекомунікаційні та інформаційні мережі" },
  { name: "Суч. методи генетичної діагнос", visible_name: "сучасні методи генетичної діагностики" },
  { name: "Стратег. маркетинг", visible_name: "стратегія маркетингу" },
  { name: "Створення і удоск. техн. сист.", visible_name: "створення і удосконалення технічних систем" },
  { name: "Справи з особл. властивост.", visible_name: "справи з особливими властивостями" },
  { name: "Спорт. фізіологія", visible_name: "спортивна фізиологія" },
  { name: "Спорт. метролог.", visible_name: "спортивна метрологія" },
  { name: "Спорт. мед.", visible_name: "спортивна медицина" },
  { name: "Спеціаліз. мови програм.", visible_name: "спеціалізовані мови програмування" },
  { name: "Соціальні інновації. Моніторин", visible_name: "моніторинг соціальних інновацій" },
  { name: "Соціал. страхування", visible_name: "соціальне страхування" },
  { name: "Соціал. психологія", visible_name: "соціальна психологія" },
  { name: "Системи моб зв.", visible_name: "системи мобільного зв'язку" },
  { name: "Системи автоматизов. підгот.", visible_name: "системи автоматизованої підготовки" },
  { name: "Сист. та мет. прийняття рішен", visible_name: "система та методика прийняття рішеннь" },
  { name: "Сист. передачі даних", visible_name: "системи передачі даних" },
  { name: "Сист. відобр. інформ.", visible_name: "системи відображення інформації" },
  { name: "Сист. виробн. та розп. енергії", visible_name: "системи виробництва та розподілу еннергії" },
  { name: "Сист. аналіз та теорія прийн.", visible_name: "системний аналіз та теорія прийняття рішеннь" },
  { name: "Сист. анал. проц. та сист. зах", visible_name: "системи аналізу процесів та системи захисту" },
  { name: "Рівняння математ. фізики", visible_name: "рівняння математичноі фізики" },
  { name: "Розр. і констр. насосів", visible_name: "розробка ы конструювання насосів" },
  { name: "Розр. та прийн. управл. рішень", visible_name: "розробка та прийняття управлінських рішеннь" },
  { name: "Розм. аналіз техн.процесів", visible_name: "розмірний аналіз технологічних процесів" },
  { name: "Ринок фін. послуг", visible_name: "ринок фінансових послуг" },
  { name: "Ризик у менеджм.", visible_name: "ризик у менеджменті" },
  { name: "Реінж. бізн.-процесів підпр.", visible_name: "реінжиніринг бізнес - процесів підприємств" },
  { name: "Ремонт та випробув. верстат.", visible_name: "ремонт та випробування верстатів" },
  { name: "Публ. адм.", visible_name: "публічне адміністрування" },
  { name: "Проц.та апарати природоох. тех", visible_name: "процесси та апарати природоохоронних технологій" },
  { name: "Проц. та апарати хім. виробниц", visible_name: "процеси та апарати хімічних виробництв" },
  { name: "Профіл. стомат. захвор.", visible_name: "профілактика стоматологічних захворювань" },
  { name: "Проф. спорт", visible_name: "професіональний спорт" },
  { name: "Проектування сист.електропост", visible_name: " проектування системи електропостачання" },
  { name: "Проектне фінансув.", visible_name: "проєктне фінансування" },
  { name: "Проект.холод. установок", visible_name: "проектування холодильних установок" },
  { name: "Проект. турбомаш.", visible_name: "проектування турбомашин" },
  { name: "Програмув. та алгоритм. мови", visible_name: "Програмування та алгоритмічні мови" },
  { name: "Програм. моб. прист. телекомун", visible_name: "програмування мобільних пристріїв телекомунікації" },
  { name: "Прогр. систем збору і анал. да", visible_name: "програмування систем збору і аналізу даних" },
  { name: "Прогноз. соц-економ.процесів", visible_name: "прогноз соціально економічних процесів" },
  { name: "Прес-служби та інф.агенства", visible_name: "прес - служби та інформаціонні агенства" },
  { name: "Практичний курс англ. мови", visible_name: "практичний курс англійскої мови" },
  { name: "Практич. методи електрон. мік", visible_name: "практичні методи електронної мікроскопії" },
  { name: "Практ.перекл.з осн.(англ)мови", visible_name: "практика перекладу з англійскої мови" },
  { name: "Практ. перекл. з нім. мови", visible_name: "практика перекладу з німецької мови" },
  { name: "Практ. лік. (4 курс)", visible_name: "практика лікування(4 курс)" },
  { name: "Потенціал і розв. підприємнст", visible_name: "потенціал і розвиток підприємств" },
  { name: "Порош.та композиц. матер.", visible_name: "порошкові та композиційні матеріали" },
  { name: "Поведінка спожив.", visible_name: "поведінка споживачів" },
  { name: "Плануван. діяльн. підприємства", visible_name: "планування діяльності підприємства" },
  { name: "Перекл.ютекстів з цив.права", visible_name: "переклад текстів з цивільного права" },
  { name: "Ох. праці та безп. життєд.", visible_name: "охорона праці та безпеки життєдіяльності" },
  { name: "Основи фін. обліку", visible_name: "основи фінансового обліку" },
  { name: "Основи редаг. перекладів", visible_name: "основи редагування перекладів" },
  { name: "Основи наукових дослідж.", visible_name: "основи наукових досліджень" },
  { name: "Основи наук.-досл. роб.", visible_name: "основа науково-дослідних робіт" },
  { name: "Основи комп. дизайну", visible_name: "основи комп'ютерного дизайну" },
  { name: "Основи адмін. менед", visible_name: "основи адміністративного менеджменту" },
  { name: "Осн. фізичн. реабілітації", visible_name: "основи фізичної реабілітації" },
  { name: "Осн. теор. і мет. спортпідг.", visible_name: "основна теорія, і методика спортивної підготовки" },
  { name: "Осн. теор. сист. і сист. анал.", visible_name: "основна теорія систем і системного аналізу" },
  { name: "Осн. телеб. та радіомовл.", visible_name: "основи телебачення та радіомовлення" },
  { name: "Осн. становлення сучасного інж", visible_name: "основи становлення сучасного інженера" },
  { name: "Осн. синхрон. перекладу", visible_name: "основи синхронизації перекладу" },
  { name: "Осн. наноелектроніки", visible_name: "основи наноелектроніки" },
  { name: "Осн. мікроелектр.", visible_name: "основи мікроелектроніки" },
  { name: "Осн. енерг. менеджменту", visible_name: "основи енергетичного менеджменту" },
  { name: "Осн. електроприводу", visible_name: "основи електроприводу" },
  { name: "Осн. бірж. діяльності", visible_name: "основи біржової діяльності" },
  { name: "Ортопед. стоматологія", visible_name: "ортопедична стоматологія" },
  { name: "Організація та тех. випроб.", visible_name: "організація та технічне випробування" },
  { name: "Організац. виробництва", visible_name: "організація виробництва" },
  { name: "Організ. повед.", visible_name: "організація поведінки" },
  { name: "Орган. та обр. ел. інформ.", visible_name: "організація та обробка електронної інформації" },
  { name: "Орган. роботи прес-служби", visible_name: "організація роботи прес - служби" },
  { name: "Орган. праці в менеджменті", visible_name: "організація праці в менеджменті" },
  { name: "Орган. баз даних та знань", visible_name: "організація баз даних та знань" },
  { name: "Оброб. зобр. та стеганогр.", visible_name: "обробка забражень та стеганографія" },
  { name: "Обр. зобр. та мультимедіа", visible_name: "обробка зображень та мультимедіа" },
  { name: "Обгр.господ.рішень і оцін. риз", visible_name: "обгрунтування господарських рішень і оцінка ризиків" },
  { name: "Об.- орієнт. прогр. на мові", visible_name: "об'єктно - орієнтоване програмування" },
  { name: "Мікропроцесорні прст. і сист", visible_name: "мікропроцесорні пристрії і системи" },
  { name: "Мікропроцесорна техн.", visible_name: "мікропроцесорна техніка" },
  { name: "Міжнародні екон. відносини", visible_name: "міжнародні економічні відносини" },
  { name: "Міжнар. фін. звітність", visible_name: "міднародна фінансова звітність" },
  { name: "Міжнар. маркетинг", visible_name: "міжнародний маркетинг" },
  { name: "Міжн. мен.", visible_name: "міжнародний менеджмент" },
  { name: "Монт.. експл. та рем. хім. обл", visible_name: "монтаж, експлуатація та ремонт хімічного обладнання" },
  { name: "Монт., нал.та випроб.електроо", visible_name: "монтаж, налагодження та випробування електрообладнання" },
  { name: "Моделюван. синерге. систем", visible_name: "моделювання синергетичних систем" },
  { name: "Модел. і прогноз. стану довкіл", visible_name: "моделювання і прогноз стану довкілля" },
  { name: "Модел. та прогноз. екон. проц", visible_name: "моделювання та прогноз економічних процесів" },
  { name: "Модел. нейронних мереж", visible_name: "моделювання нейронних систем" },
  { name: "Мод. бізнес-проц.", visible_name: "моделювання бізнес - процесів" },
  { name: "Мова навч. (укр., рос.)", visible_name: "мова навчання(укр,рос)" },
  { name: "Мех. рідини і газу", visible_name: "механіка рідини і газу" },
  { name: "Методи теор.ігор при прийн.ріш", visible_name: "методи теорії ігор при прийнятті рішень" },
  { name: "Методи прийняття управ.рішень", visible_name: "методи прийняття управлінських рішень" },
  { name: "Методи матем. фізики", visible_name: "методи математичної фізики" },
  { name: "Метод. і орган. наук. досл.", visible_name: "методика і організація наукових досліджень" },
  { name: "Метод. наук. досліджень", visible_name: "методика наукових досліджень" },
  { name: "Метод. викладан. іноземн.", visible_name: "методика викладання іноземної мови" },
  { name: "Металообр. обладнання", visible_name: "металообробче обладнання" },
  { name: "Мет. вимір. парам. навкол.сере", visible_name: "методика вимірювання параметрів навколишнього середовища" },
  { name: "Мет. анал. мед-біолог. інформ.", visible_name: "методика аналізу медично - біологічної інформації" },
  { name: "Мет та сист. штучного інтел.", visible_name: "методики та системи штучного інтелекту" },
  { name: "Менеджм. орган.", visible_name: "менеджмент організацій" },
  { name: "Мед. психологія", visible_name: "медична психологія" },
  { name: "Мед. захист військ", visible_name: "медичний захист військ" },
  { name: "машинне та аппаратне хімічне виробництво", visible_name: "" },
  { name: "Матер. і компон. електроніки", visible_name: "матеріали і компоненти електроніки" },
  { name: "Математ. методи в економіці", visible_name: "математичні методи в економіці" },
  { name: "Мат. методи досл. опер.", visible_name: "математичні методи дослідження операцій" },
  { name: "Маркетингова товарна політ.", visible_name: "маркетингова товарна політика" },
  { name: "Маркетингова пол. розпод.", visible_name: "маркетингова політика розподілу" },
  { name: "Маркетинг. комунік.", visible_name: "маркетингова комунікація" },
  { name: "Маркет. менеджм.", visible_name: "маркетинговий менеджмент" },
  { name: "Марк. інновацій", visible_name: "маркетинг інновацій" },
  { name: "Марк. пром. підприєм.", visible_name: "маркетинг промислових підприємств" },
  { name: "Марк. гідро - і пневмомаш.", visible_name: "маркетинг гідро і пневмомашин" },
  { name: "Макрофін. бюджетування", visible_name: "маркофінансове бюджетування" },
  { name: "Лат. мова та мед. термінолог.", visible_name: "латинська мова та медицинська термінологія" },
  { name: "Кріогенна техн.", visible_name: "кріогенна техніка" },
  { name: "Крос-платф. програм.", visible_name: "крос - платформенні програми" },
  { name: "Котельні устан. промисл. підпр", visible_name: "котельні установки промислових підприємств" },
  { name: "Корпор. інформац. сист.", visible_name: "корпоративні інформаційні системи" },
  { name: "Контр.-вимір.прилади", visible_name: "контрольно - вимірювальні прилади" },
  { name: "Контр. якості та безп. телек.", visible_name: "контроль якості та безпеки телекомунікації" },
  { name: "Комп. тех. в сит. електропост.", visible_name: "комп'ютерна техніка в системі електропостачання" },
  { name: "Комп. сист.автомат.підг. вироб", visible_name: "комп'ютерні системи автоматичної підготовки виробництва" },
  { name: "Комп. модел. процесів і сист.", visible_name: "комп'ютерне моделювання процесів і систем" },
  { name: "Комп. методи оптим. в мех.", visible_name: "комп'ютерні методи оптимізації в механізмах" },
  { name: "Комп. дизайн реклами", visible_name: "комп'ютерний дизайн реклами" },
  { name: "Комп. графіка ІІ", visible_name: "комп'ютерна графіка||" },
  { name: "Клінічні аспекти імунопроф.", visible_name: "клінічні аспекти імунопрофілактики" },
  { name: "Клінічна імунолог. та алергол.", visible_name: "клінічна імунологія та аллергологія" },
  { name: "Зовнішньоекон.діяльність", visible_name: "зовнішньоекономічна діяльність" },
  { name: "Загал. прак-ка (сім. медицин)", visible_name: "загальна практика сімейної медицини" },
  { name: "Енергозб. в холод. устан.", visible_name: "енергозбереження в холодильних установках" },
  { name: "Електротехн. установки", visible_name: "електротехнічні установки" },
  { name: "Електротехн. матеріали", visible_name: "електротехнічні матеріали" },
  { name: "Електротех. мат. у медиц.", visible_name: "електротехнічні матеріали у медицині" },
  { name: "Електропост. пром. підприєм.", visible_name: "електропостачання промислових підпроємств" },
  { name: "Електроніка і мікросхемотехн.", visible_name: "електротехніка і мікросхемотехніка" },
  { name: "Ел. системи та мережі", visible_name: "електронні системи та мережі" },
  { name: "Екстрена та нев. мед. допомог", visible_name: "екстренна та невідкладна медична допомога" },
  { name: "Економіка.виробн.електроен", visible_name: "економіка виробництва електроенергії" },
  { name: "Економ. підприємництва", visible_name: "економіка підприємництва" },
  { name: "Економ охорони здоров.", visible_name: "економіка охорони здоров'я" },
  { name: "Екон. підприємства", visible_name: "економіка підпроємства" },
  { name: "Екон. природокорист.", visible_name: "економіка природокористання" },
  { name: "Ек. та орган. інновац. діяльн", visible_name: "економіка та організація інноваційної діяльності" },
  { name: "Документування госп. операцій", visible_name: "документування господарських операцій" },
  { name: "Догляд за хвор. (практика)", visible_name: "догляд за хворими практика" },
  { name: "Деталі машин (осн.конструюв)", visible_name: "деталі машин (основи конструювання)" },
  { name: "Держ. та регіон. управл.", visible_name: "державне та регіональне управління" },
  { name: "Глобал пробл. ек. та енерг.", visible_name: "глобальні проблеми екології та енергетики" },
  { name: "Військова токсикол. і радіол.", visible_name: "війскова токсикологія і радіологія" },
  { name: "Візуал. та оброб. мед.дан.", visible_name: "візуалізація та обробка медичних даних" },
  { name: "Візуал. мови програм.", visible_name: "візуальні мови програмування" },
  { name: "Відновлюван. джерела ел.ен", visible_name: "відновлювальні джерела електроенергії" },
  { name: "Викон. проект. дій", visible_name: "виконання проектих дій" },
  { name: "Веб-техн. та веб-дизайн", visible_name: "веб технології та веб дизайн" },
  { name: "Вакуумна та плазмова електрон.", visible_name: "вакуумна та плазмова електроніка" },
  { name: "Біолг. та біоорганічна хімія", visible_name: "біологічна та біоорганічна хімія" },
  { name: "Бух. облік", visible_name: "бухгалтерський облік" },
  { name: "Банків. операції", visible_name: "банківські операції" },
  { name: "Бази даних та інформац. сист.", visible_name: "бази даних та інформаційні системи" },
  { name: "Архіт. комп. систем", visible_name: "архітектури комп'ютерних систем" },
  { name: "Антикризове управл.", visible_name: "антикризове управління" },
  { name: "Анестезіол.та інтенс. терапія", visible_name: "анастезіологія та інтенсивна терапія" },
  { name: "Алгоритми і структ. даних", visible_name: "алгоритми і структури даних" },
  { name: "Історія укр. журналістики", visible_name: "історія української журналістики" },
  { name: "Інфрастр. фін. ринку", visible_name: "Інфраструктура фінансового ринку" },
  { name: "Інформац. техн", visible_name: "інформаційні технології" },
  { name: "Інформац. економіка", visible_name: "інформаційна економіка" },
  { name: "Інформ. сист. і техн. в управл", visible_name: "інформаційні системи і технології управління" },
  { name: "Інформ. політ. та безпека", visible_name: "інформаційна політика та безпека" },
  { name: "Інф. сист. і техн. в упр. орг.", visible_name: "інформаційні системи і технології в управлінні організаціями" },
  { name: "Інф. сист. в управл. проектами", visible_name: "інформаційні системи управління проектами" },
  { name: "Іноз. мова (поглиблений курс)", visible_name: "іноземна мова(поглиблений курс)" },
  { name: "Ін. мова проф. спілкув.", visible_name: "іноземна мова професійного спілкування" },
  { name: "Ін. мова за проф. спрям.", visible_name: "іноземна мова за професійним спрямуванням" },
  { name: "Web-програм. та Web-дизайн", visible_name: "web-програмування та web-дизайн" }
]

Discipline.all.each do |discipline|

  impoved_names.each do |impoved_name|

    if discipline.name == impoved_name[:name]

      discipline.visible_name = impoved_name[:visible_name]
      discipline.save

      p ''
      p "#{discipline.name} -> #{discipline.visible_name}"

    end
  end
end
