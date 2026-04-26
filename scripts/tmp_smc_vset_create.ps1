# SMC vset (Śródmieście — kent merkezi, q201/q202/q203 ana hikâye bölgesi) — 44 CSV TR çevirilerini yaz.

$data = [ordered]@{}

$data["smc_vset_bar_bartender_m_03.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"0EC942624CBEABC996EFA3B5ACE6CB5B","smc_vset_bar_bartender_m_03","<dl>Galancie</>, tylko bez <dl>poruty</> mi tu.","<dl>Beyefendi</>, sadece <dl>rezalet</> çıkarma burada.",""
"023B0F844DE8C57A8EED88A79751409B","smc_vset_bar_bartender_m_03","<dl>Balsamu</> szanownemu panu?","<dl>İlacımdan</> ister mi saygıdeğer beyefendi?",""
"65CC3E63470F38C57E06699BB3FF7156","smc_vset_bar_bartender_m_03","<dl>Ecie-pecie</> ma? Bo inaczej nie pije.","<dl>Özel cinsi</> var mı? Yoksa içmem.",""
'@

$data["smc_vset_bar_patron_m_01.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"D19A112D4136496307B0B7874F1D7E7B","smc_vset_bar_patron_m_01","Jeszcze bym coś chlapnął.","Bir tek daha çekerim.",""
"C685F2124407C2AA846AA997B11D49A0","smc_vset_bar_patron_m_01","Alkohol mi robi <i>kuku na muniu</>.","Alkol kafamı <i>çatlatıyor</>.",""
"572F779D48058D82F7F45F83085A5291","smc_vset_bar_patron_m_01","Gdzie to ja chciałem iść? A, na siwuchę.","Nereye gidecektim ben? Ah, ham votka almaya.",""
'@

$data["smc_vset_bar_patron_m_02.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"C196262046C6A8B8663473A2567D9309","smc_vset_bar_patron_m_02","Wódeczka, wódeczka, moja kochaneczka.","Vodkacığım, vodkacığım, biricik sevgilim.",""
"833A37C544EE2C4ED33AD0AD1CA2A62E","smc_vset_bar_patron_m_02","Jak nie wypiję, to coś nie w sosie jestem.","İçmesem keyfim yerine gelmiyor.",""
"063ED15045DB4C0084ED8190E8C213BE","smc_vset_bar_patron_m_02","A kto by tam dni liczył. Napijmy się.","Kim sayar günleri ki. Bir tek atalım.",""
'@

$data["smc_vset_bar_patron_m_03.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"2921125A4051DC8C3330F891D76BC8F3","smc_vset_bar_patron_m_03","Taka ulica barowa, że nigdzie porządnego piwa nie ma.","Bara onca cadde var, ama doğru dürüst bira yok hiçbir yerde.",""
"19264D8E4B7D34ED9464938EBA9D0FBC","smc_vset_bar_patron_m_03","Dziwnie tu. Gdzie ja zaszedłem?","Tuhaf bir yer. Nereye düştüm ben?",""
"6B12F7BE4C848709D2A77D8AFEBB5344","smc_vset_bar_patron_m_03","Trzeba było słuchać matuli. Na wsi zostać.","Anneciğimi dinlemeliydim. Köyde kalmalıydım.",""
'@

$data["smc_vset_bar_patron_m_04.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"0B1CFD48438CCDEEB482B1A3D9A2470D","smc_vset_bar_patron_m_04","A dajcie wy mi wszyscy spokój.","Hepiniz beni rahat bırakın.",""
"DD23378E4D9650755AF6509258EA7172","smc_vset_bar_patron_m_04","Z <dl>kacapami</> nie piję.","<dl>Moskoflarla</> içmem.",""
"A612FBED438CDEE03D25C3BAF46F28F8","smc_vset_bar_patron_m_04","To miasto na psy schodzi, o.","Bu şehir köpeklere kalmak üzere, hadi.",""
'@

$data["smc_vset_commoner_f_01.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"1AA0EA8D45A0DA0FF2DA16BF564797F7","smc_vset_commoner_f_01","Teraz to i byle kto tu przyjeżdża.","Şimdi her isteyen geliyor buralara.",""
"644CC9A4438A5BC6DAB06FB0C80E7DB2","smc_vset_commoner_f_01","Tłoczno się w tym mieście robi. I duszno.","Bu şehir kalabalıklaşıyor. Hava da ağır.",""
"1C59A3E249279F23BAEFF5913BA07294","smc_vset_commoner_f_01","Chyba kupię domek na wsi.","Galiba kıra bir evcik alacağım.",""
'@

$data["smc_vset_commoner_f_02.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"F1EF402F4C43340D45F10B81A440C88C","smc_vset_commoner_f_02","Nie mam czasu!","Vaktim yok!",""
"05B499364F5370461E022EBC8ED57529","smc_vset_commoner_f_02","Mam męża, odejdź.","Kocam var, çekil.",""
"49A31FD848B8AFDC8BAD3785CC62099A","smc_vset_commoner_f_02","I po co mi te dzieci są...","Bu çocuklar başıma neye geldi…",""
'@

$data["smc_vset_commoner_f_03.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"796F88CB456E79D39CC8A78710DBAE9E","smc_vset_commoner_f_03","Trzewiczki ubrudziłam.","Pabuçlarım kirlendi.",""
"E3182CE144623FB575932D91103CAB0E","smc_vset_commoner_f_03","Ach i po cóż te roboty, pył tylko wszędzie!","Of bu tamiratlar ne lazım sanki, her yer toza bulanıyor!",""
"44CF8CD640C0E3047CB35E82AC1487BA","smc_vset_commoner_f_03","Porządnego chodnika to tu nigdzie nie ma.","Hiçbir yerde doğru dürüst kaldırım yok.",""
'@

$data["smc_vset_commoner_f_04.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"A85F39DF4831A9D21FBFDCA317FCE53E","smc_vset_commoner_f_04","Inaczej sobie wyobrażałam miasto.","Şehri başka türlü hayal ediyordum.",""
"D8A914144BA200383137898FFF7CAFA2","smc_vset_commoner_f_04","Tyle się tu dzieje, ale każdy w swoje zapatrzony.","Bunca şey oluyor, ama herkes kendi derdiyle meşgul.",""
"B408FAFC4509F9075D65C0A34E2EB07C","smc_vset_commoner_f_04","Kiedyś to było, teraz to nie ma...","Eskiden vardı, şimdi yok…",""
'@

$data["smc_vset_commoner_m_01.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"E05ED530467673069B97888DB1DD1C05","smc_vset_commoner_m_01","Uszanowanie.","Saygılarımla.",""
"DFDBD4F040C9E8205E1BA58C10D7107F","smc_vset_commoner_m_01","Zaraz mi tramwaj ucieknie.","Az sonra tramvayı kaçıracağım.",""
"C48238D6418F8670491D8492A336F457","smc_vset_commoner_m_01","Chyba się zgubiłem.","Galiba kayboldum.",""
'@

$data["smc_vset_commoner_m_02.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"9F1BF60E4BF26560BE3124AA6ADF3DE4","smc_vset_commoner_m_02","Tyle spraw, tylko czasu nie ma.","Bunca iş var, vakit yok ama.",""
"E69B732F43427471C461099179B6E3BC","smc_vset_commoner_m_02","<dl>Dryndziarze</> zdziercy, tyle chcieć za kurs.","<dl>Faytoncular</> kazıkçı, bir gidiş için onca para isteyemezler.",""
"640F65D0479B0D5CAFDF16B9AE8DB5B0","smc_vset_commoner_m_02","Co to ja chciałem?","Ne istiyordum ben?",""
'@

$data["smc_vset_commoner_m_03.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"5F83400D4012E90C0E80E79407AEAC3C","smc_vset_commoner_m_03","Ciągle te remonty. Przejść się normalnie nie da.","Bu tamiratlar bitmiyor. Doğru dürüst geçilmiyor.",""
"D669D3D9453DF95DBDA584B9F19C4D2E","smc_vset_commoner_m_03","Ciekawe, co żonka zrobiła na obiad...?","Acaba hatun öğle yemeğine ne pişirdi…?",""
"25B142D848D8DDC3216D15BC7569A472","smc_vset_commoner_m_03","Tak, tak.","Evet, evet.",""
'@

$data["smc_vset_commoner_m_04.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"6D5DFC1C42843BE2D86E28BBE4843341","smc_vset_commoner_m_04","Niezłą fuchę złapałem.","Fena olmayan bir iş kaptım.",""
"8BAD82984A4CCDEAAB3B4F9C00B16598","smc_vset_commoner_m_04","A powodzi się, powodzi.","İşler iyi gidiyor, iyi gidiyor.",""
"B2BF1CDF480B989865C03587E30AB890","smc_vset_commoner_m_04","Masz szmal, to się chwal.","Mangırın varsa caka sat.",""
'@

$data["smc_vset_commoner_poor_f_01.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"7F0851FB4784AE426B555BADD9E4D770","smc_vset_commoner_poor_f_01","W domu wszyscy głodni...","Evdekilerin hepsi aç…",""
"E290C5E74AC49CE0716346BBD1347643","smc_vset_commoner_poor_f_01","Starego już tydzień nie ma, jak po papierosy poszedł.","Yaşlı bir hafta önce sigaraya gitti diye çıktı, geri dönmedi.",""
"06FD86CD4F27F0EB1093098B688329A1","smc_vset_commoner_poor_f_01","Co ja za to mogę kupić?","Bununla ne alabilirim ki?",""
'@

$data["smc_vset_commoner_poor_f_02.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"ABA898E8409CB9A67B239CA1BEF53E73","smc_vset_commoner_poor_f_02","Innym to się powodzi.","Başkalarının işleri yolunda.",""
"B51F624549A1AEE4DA68798C57DB95CA","smc_vset_commoner_poor_f_02","Nawet <dl>Różyc</> drogi ostatnio, a i tak strach się tam pokazywać.","<dl>Różyc</> bile son zamanlarda pahalı, üstüne üstlük orada görünmek korkulu.",""
"14D15D754BCCC86138C3B1B8997DCA52","smc_vset_commoner_poor_f_02","Mąż ostatnio czytać się nauczył!","Kocam yakınlarda okumayı öğrendi!",""
'@

$data["smc_vset_commoner_poor_f_03.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"F3E7D49B47BE4675C852A49D0155AA45","smc_vset_commoner_poor_f_03","Buty to mi się już rozpadają...","Ayakkabılarım çoktan dağılmış vaziyette…",""
"5E770BF64B10D7A8713AFA90F74BA117","smc_vset_commoner_poor_f_03","Pan coś konkretnego szuka?","Beyefendi belirli bir şey mi arıyor?",""
"241A0504476C9472DF3B729E0DFD92E3","smc_vset_commoner_poor_f_03","Nogi mnie już bolą...","Bacaklarım sızlıyor artık…",""
'@

$data["smc_vset_commoner_poor_f_04.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"DDBCA8B54D5DD7C8E26C079715369A1A","smc_vset_commoner_poor_f_04","Może dworcowych śledzi coś zostało?","Belki istasyon ringalarından kalan vardır?",""
"4CCDC9E14AF5AB85609E6EB738A45946","smc_vset_commoner_poor_f_04","Pod Imperialnym wczoraj mnie kopnął jeden taki.","Dün Imperial''in önünde bir herif tekme attı bana.",""
"77D62AE94D5204898626E0B8057F9DFF","smc_vset_commoner_poor_f_04","Stary znowu Mojkom wisi.","İhtiyar yine Mojki''ye borçlu.",""
'@

$data["smc_vset_commoner_poor_m_01.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"EA21A9764FAC05CADE345F9142ED274C","smc_vset_commoner_poor_m_01","Panie, choć kopiejką pan poratuj...","Beyefendi, hiç değilse bir kapikle yardım edin…",""
"10B4E29A4A3713FD245E72A45B6C95E6","smc_vset_commoner_poor_m_01","Bieda panie, oj bieda!","Sefalet beyefendi, of sefalet!",""
"6406EF2C4231EBEFB44BC98191CC8943","smc_vset_commoner_poor_m_01","Drugi palec mi utną, ale pączka bym zjadł.","İkinci parmağımı kessinler de bir paskalya çöreği yiyebileyim.",""
'@

$data["smc_vset_commoner_poor_m_02.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"BA410EC34810DA9E587F90B64249A675","smc_vset_commoner_poor_m_02","Gdybym to ja tylko czytać umił...","Bir okumayı bilseydim ben…",""
"F122ADF34661A6EB925B8389E2F1E592","smc_vset_commoner_poor_m_02","W tym kraju nie ma pracy dla ludzi z moim wykształceniem.","Bu memlekette benim eğitimimdekilere iş yok.",""
"8B0B5FA14D55C7A9956444B0C987EDA7","smc_vset_commoner_poor_m_02","Czego się gapisz?","Ne bakıyorsun?",""
'@

$data["smc_vset_commoner_poor_m_03.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"20CDF4C547B04284B51A6182D07A7FF7","smc_vset_commoner_poor_m_03","Znowu przepiłem pół wypłaty...","Yine maaşımın yarısını içip bitirdim…",""
"4DC0E4B943F4B1D75E7717B2EFA962A6","smc_vset_commoner_poor_m_03","Rozwadniają piwo w Londyńskim, bandyci!","Londyński''de birayı sulandırıyorlar, eşkıyalar!",""
"3B1CB6334BB7EB24488452B3EBD8F27E","smc_vset_commoner_poor_m_03","<dl>Goudy</> bym chlapnął.","<dl>Goudy</>''den bir yudum çekerdim.",""
'@

$data["smc_vset_commoner_poor_m_04.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"6B0F21914EF535B5E2658C9304802EED","smc_vset_commoner_poor_m_04","Kawaler, widzę, nietutejszy.","Bey delikanlı, gördüğüm kadarıyla buralı değilsin.",""
"532A45C44FB9444ADA36F29621108604","smc_vset_commoner_poor_m_04","Jakby kto z Mojek pytał, to mnie nie widziałeś.","Mojki''den biri sorarsa, beni görmedin.",""
"56CD862042071388F9B9998FE27E5C3C","smc_vset_commoner_poor_m_04","Wczorajszem Kurjerem bym sobie buty poobtykał.","Dünkü Kurye gazetesini ayakkabımın içine sıkıştırırdım.",""
'@

$data["smc_vset_commoner_poor_m_05.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"936FA7874514BF02056C979511041074","smc_vset_commoner_poor_m_05","Przepraszam, którędy do Cytadeli?","Affedersiniz, Sitadel''e ne taraftan gidilir?",""
"67AD8E2B47ECD1208EBF3A9C14A43C6B","smc_vset_commoner_poor_m_05","Jak ja w tym mieście jeden syfon znajdę?","Bu şehirde bir sifonu nasıl bulurum ben?",""
"73F1FB234340837A5A142F87DF21D70C","smc_vset_commoner_poor_m_05","Co to jest ""pańska skórka""?","Bu ""pańska skórka"" da nedir?",""
'@

$data["smc_vset_goon_m_01.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"60C79DB8452B488FE92B56883208E5A5","smc_vset_goon_m_01","Ja jej dam pozowanie. <dl>Obraźnika</> zasranego obiję!","Ona poz vermeyi göstereyim ben. Şu allahın belası <dl>ressamı</> bir döveyim!",""
"7CA38A98468D7A5FA9ABF28CDBC64552","smc_vset_goon_m_01","<dl>Sałaty</> ciągle mało.","<dl>Mangır</> hâlâ az.",""
"F552669E4D5B4189283BA1AE5F6877E8","smc_vset_goon_m_01","O, ale <dl>syrenianka</> szykowna.","Vay, ne şık <dl>denizkızı</>.",""
'@

$data["smc_vset_goon_m_02.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"DE9375EA4E63F3D82EFD299ED093C12A","smc_vset_goon_m_02","A w <dl>baśkę</> by nie chciał?","<dl>Kafana</> bir tane yemek ister misin?",""
"95C36FD84B3A9F08A1A853ACE99DF638","smc_vset_goon_m_02","<dl>Stodoła i komora</> w tym Imperialnym ostatnio.","Imperial''de son zamanlarda <dl>al gülüm ver gülüm</>.",""
"2C367EE4410092AEE15AA1A0447C83BA","smc_vset_goon_m_02","Ja roboty nie mogę znaleźć, a <dl>szprotki na kominy chodzą</>.","Ben iş bulamıyorum, oysa <dl>üç kuruşluklar zirvede dolaşıyor</>.",""
'@

$data["smc_vset_goon_m_03.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"8331972649DCA8A416BC18A961298197","smc_vset_goon_m_03","Żaden <dl>antek fuszery</> nie odwala.","Hiçbir <dl>delikanlı baştan savma iş</> yapmaz.",""
"F67DE2F64061402F95EFBFA219499870","smc_vset_goon_m_03","Zaraz cię na <dl>podwiązki</> odwiozą, się jeszcze raz <dl>lampić</> będziesz.","Bir daha <dl>böğüreceksen</> az sonra seni <dl>jartiyere bağlarlar</>.",""
"DA3563904D46D0BE75CE498A39899900","smc_vset_goon_m_03","Byle do świąt i będzie <dl>wersal</>. <dl>Fart</> się musi odwrócić.","Bayrama dek bir dur, sonra <dl>saray</> hayatı. <dl>Şans</> dönmek zorunda.",""
'@

$data["smc_vset_goon_m_04.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"5D0343504889ECF494FB1CA89E9A8821","smc_vset_goon_m_04","Szef dziś jakiś łaskaw i <i>sztymunek</> trzymamy!","Patron bugün cömertçe davranıyor, <i>uyumumuzu</> koruyoruz!",""
"93B07E1D49780C49DE37C3AF50750164","smc_vset_goon_m_04","Kto to wczoraj wygrał derby?","Dün derbiyi kim kazandı?",""
"455B9CAB4E0A00117B719082017171A2","smc_vset_goon_m_04","Zaraz kogoś na <dl>fleki</> wezmę.","Az sonra birini <dl>tabana çekmeye</> geçeceğim.",""
'@

$data["smc_vset_policeman_m_01.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"C4CD132D4B92362AC7FC0E9632989092","smc_vset_policeman_m_01","Zaraz połowa września, a z łapówek mi nic nie zostało.","Eylül yarılanmak üzere, oysa rüşvetlerden hiç bir şey kalmadı.",""
"E03812804B67196C5F453392F4C97998","smc_vset_policeman_m_01","Trzeba będzie jakiegoś <dl>jelenia przyfilować</>.","Bir <dl>geyik kollamak</> lazım.",""
"EF0C485245A5781C2952C58789326460","smc_vset_policeman_m_01","Nawet na wesoły ""Dom Cioci Jadzi"" mnie nie stać...","Şen ""Jadzia Teyzenin Evi""ne bile gücüm yetmiyor…",""
'@

$data["smc_vset_policeman_m_02.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"0E6EB2A34BD9CD8E9508038644A595DC","smc_vset_policeman_m_02","Może donieść naczelnikowi o tym łapówkarzu?","Şu rüşvetçiyi amir beye ihbar mı etsem?",""
"2D9DE3384E214F9A1FC388AB401AABDF","smc_vset_policeman_m_02","Może znowu jakąś prowokację urządzić?","Yine bir tezgâh kursam mı acaba?",""
"21FDD17F4AFAE63BBE09A7AC59816CB7","smc_vset_policeman_m_02","Nie sterczeć, maszerować.","Dikilme, yürü.",""
'@

$data["smc_vset_policeman_m_03.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"CE008F58492470D2D572DFBB417EF55B","smc_vset_policeman_m_03","Tyle godzin bez snu... Chyba że ten ostatni kasiarz mi się tylko przyśnił?","Saatlerdir uyumadım… Yoksa şu son kasa hırsızı sadece rüyam mıydı?",""
"6ED21BDE400C4D432BB56B876051D52D","smc_vset_policeman_m_03","Plecy mi siadają, kolana strzykają, w karku rwie...","Sırtım çöküyor, dizlerim çatırdıyor, ensem zonkluyor…",""
"30BEC341442E8D0F667697B0DD9903BC","smc_vset_policeman_m_03","Jestem za stary na to gówno.","Bu boktan iş için fazla yaşlıyım.",""
'@

$data["smc_vset_policeman_m_04.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"A23F3FDB47928E4B31D5B8BA4BE5308E","smc_vset_policeman_m_04","Wczoraj w Alejach to staruszkę spod kopyt wyrwałem.","Dün Aleje''de yaşlı bir kadını atların ayakları altından çekip kurtardım.",""
"E4415E004A8AD41A2321839BB04B4722","smc_vset_policeman_m_04","Jak się wykażę, to mnie naczelnik doceni.","Kendimi gösterirsem amir bey takdir eder.",""
"F2E7EB5148458EFB8CCA9A944042883F","smc_vset_policeman_m_04","Trzeba tylko wcześnie wstawać i nie jadać na mieście.","Tek lazım olan, erken kalkmak ve şehirde yemek yememek.",""
'@

$data["smc_vset_rich_party_f_01.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"F0211D4F45E8CA15211416AA33664E93","smc_vset_rich_party_f_01","Ostatnio z tamtym tańczyłam.","Geçen sefer onunla dans ettim.",""
"D5130BCB40DE15731FE00C96794785EA","smc_vset_rich_party_f_01","Zacni ci kawalerowie tu.","Burada ne ağırbaşlı bey delikanlılar var.",""
"2737B12A44512E9BABD8DE86846DD78D","smc_vset_rich_party_f_01","Ach, żebym tak wpadła któremuś w oko.","Ah, birinin gözüne girebilseydim.",""
'@

$data["smc_vset_rich_party_f_02.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"99055D1B46DACE2A9B52C68CCEFDA2B0","smc_vset_rich_party_f_02","Pączuszki przy dworcu pyszne, ale dbam o linię.","İstasyondaki paskalya çörekleri nefis, ama ben hattıma dikkat ediyorum.",""
"5ACC646F456226A0D306179125A1D915","smc_vset_rich_party_f_02","Ona tak ostatnio przytyła, że aż miło popatrzeć.","Son zamanlarda öyle bir kilo aldı ki bakması bile zevk.",""
"C5C66FFF44845225262CCCB99ED1FC98","smc_vset_rich_party_f_02","A żeby jej oko zbielało, jak mnie zobaczy.","Beni görsün de bir gözü belerip kalsın.",""
'@

$data["smc_vset_rich_party_f_03.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"91404A004E7B37A7FDA423ABB0E54300","smc_vset_rich_party_f_03","Tę suknię uszyła dla mnie sama Polewska.","Bu elbiseyi bizzat Polewska bana dikti.",""
"B9A1E7C14B959DAA26632BB20C5F0A68","smc_vset_rich_party_f_03","Te zdobienia to paryski szyk. Nie były tanie.","Bu süslemeler Paris şıklığı. Pahalıydılar doğrusu.",""
"58B8495D4655B82E377313BFBF4329B1","smc_vset_rich_party_f_03","Poza tą jedną, wszystkie suknie sprowadzam z Paryża.","Bunun dışında bütün elbiselerimi Paris''ten getirtiyorum.",""
'@

$data["smc_vset_rich_party_f_04.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"488C6BA84791457B28A4EE9D2DE8F029","smc_vset_rich_party_f_04","Pantofle mnie piją. Służąca zapomniała prawideł.","İskarpinlerim ayağımı sıkıyor. Hizmetçi kalıpları unutmuş.",""
"11C3EF214485FF48C5AC3394DC7FFEF7","smc_vset_rich_party_f_04","Gdzie mój wachlarz?","Yelpazem nerede?",""
"A10EDAA140FB21A5325ED0994B993E06","smc_vset_rich_party_f_04","Chyba zemdleję.","Galiba bayılacağım.",""
'@

$data["smc_vset_rich_party_f_05.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"BDB4DBBD40C95BAAD92FF784656C4782","smc_vset_rich_party_f_05","Kogo jak kogo, ale pana tu jeszcze nie widziałam.","Kim kimdir, ama beyefendiyi burada hiç görmemiştim.",""
"9DDC29C14E66CEB540D767B3EB8BA876","smc_vset_rich_party_f_05","Skałonówna ma tu ponoć dzisiaj być. Znowu się zadzieje.","Söylenene göre Skałon kızı bugün burada olacakmış. Yine olaylar olacak.",""
"79263F854259A38C4CBE15A3D5CC7426","smc_vset_rich_party_f_05","Jakbyśmy mało mieli skandali na salonach...","Sanki salonlarda az skandal yaşamışız gibi…",""
'@

$data["smc_vset_rich_party_m_01.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"F4DCDB024AE55C440F3A8BBF06C1E90A","smc_vset_rich_party_m_01","Ale potem panie proszą panów.","Ama sonra hanımlar beyleri davet edecek.",""
"DEDB0AB44DFC5FDD876141BC7AF93406","smc_vset_rich_party_m_01","Czy tu będą może jakieś tańce? Potupałbym.","Burada dans olacak mı acaba? Bir tepinirdim.",""
"12A9AEEB437893EB2E6E7B8967973E75","smc_vset_rich_party_m_01","Nowe buty, muszą się rozbić.","Yeni ayakkabılar, oturması lazım.",""
'@

$data["smc_vset_rich_party_m_02.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"A00F06A24855A03E7CDEBAA4EF8FAD64","smc_vset_rich_party_m_02","Na giełdzie niewesoło. Kryzys idzie.","Borsada keyifsiz. Kriz geliyor.",""
"4A36A94247471602705BA69D49EE445F","smc_vset_rich_party_m_02","...i ja mu wtedy mówię, żeby nie zwlekał, tylko inwestował.","…o vakit ben de ona dedim ki, ertelemesin, hemen yatırım yapsın.",""
"603B239A4EF16058D0C5258B502B8E7A","smc_vset_rich_party_m_02","Dobra inwestycja? Obecnie? Złoto.","İyi yatırım mı? Şu sıralar mı? Altın.",""
'@

$data["smc_vset_rich_party_m_03.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"8AA1A4E7459DDE37C3FDBB8B50CA6246","smc_vset_rich_party_m_03","Żona bawi się w damskim gronie.","Karım hanımlar arasında eğleniyor.",""
"D396B8FC42279FC82449B2854F06C473","smc_vset_rich_party_m_03","Zaraz udajemy się z dziećmi na wieś, do majątku.","Az sonra çocuklarla beraber kıra, çiftliğimize gidiyoruz.",""
"287C7ABB45134117E2E662894F6188F8","smc_vset_rich_party_m_03","Mam w majątku nowego ogara. Ściga zwierzynę jak zły.","Çiftliğimde yeni bir tazı var. Avı şeytan gibi kovalıyor.",""
'@

$data["smc_vset_rich_party_m_04.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"7F7E9E4A4A3A2F62049C3D8451171F18","smc_vset_rich_party_m_04","Co by tu dodać? Lepiej nic nie powiem.","Ne diyeyim ki? Hiçbir şey söylememem en iyisi.",""
"54EEDA344D7D1E22901EFB82432AA007","smc_vset_rich_party_m_04","Nie robię interesów z nieznajomymi.","Tanımadığım kişilerle iş yapmam.",""
"539F626945DC928C156299BA71DD0901","smc_vset_rich_party_m_04","Coraz mniej mnie bawią te spędy.","Bu davetler beni gittikçe daha az eğlendiriyor.",""
'@

$data["smc_vset_rich_party_m_05.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"FE4983B14080C64622E32EB83496FFBD","smc_vset_rich_party_m_05","Chyba się przesłyszałem.","Galiba yanlış duydum.",""
"E1B8359B411F72AAB1F581815AAB5D13","smc_vset_rich_party_m_05","Ładną sumkę przyjąłem ostatnio na derbach.","Geçenlerde derbide hatırı sayılır bir kazanç toparladım.",""
"DE6C6BAF47D0FD5E9ED51190F61AD3FC","smc_vset_rich_party_m_05","Jak być w życiu szczęśliwym? No jak?","Hayatta nasıl mutlu olunur? Söyle nasıl?",""
'@

$data["smc_vset_worker_m_01.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"ECAFC3DC4A355724DE67B2AC27590970","smc_vset_worker_m_01","Zmiany to coś końca nie widać...","Vardiyaların sonu gelmek bilmiyor…",""
"D51AE4554D0F52EA35D3FEBB87CAF1F3","smc_vset_worker_m_01","Ale <dl>fuchę</> złapałem w fabryce. Z dziećmi, ale zawsze.","Fabrikada bir <dl>ufak iş</> kaptım. Çocukların yanında, fakat yetiyor.",""
"F47DA979417A7C80B829549BC968DB91","smc_vset_worker_m_01","Nowy majster fuszery nie zdzierży.","Yeni ustabaşı baştan savmacılığa katlanmaz.",""
'@

$data["smc_vset_worker_m_02.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"3E3F6E31406822A91371ABB77BF88CA4","smc_vset_worker_m_02","Kiedy ten strajk ma być?","Bu grev ne zaman patlayacak?",""
"D49B402A409DD0E6E0E3FA87ADBF31FC","smc_vset_worker_m_02","W ""Mecie, Secie"" mi ostatnio <dl>kacap</> do wódki napluł!","""Mecie, Secie""''de geçenlerde bir <dl>moskof</> votkama tükürdü!",""
"3655A3AE49AD632032C4DBB96B8D63D1","smc_vset_worker_m_02","<i>Wyklęty powstań, ludu ziemi...</>","<i>Kalk ayağa lanetlenmiş, dünyanın yoksulları…</>",""
'@

$data["smc_vset_worker_m_03.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"79C22D3B4B79978E1C3C0BA8032A2BBB","smc_vset_worker_m_03","Jak strajkować będą, to i robota dla mnie się może znajdzie.","Onlar grev yaparsa belki bana da iş çıkar.",""
"41D08BAA486955D3A89FA19C1EDFAB83","smc_vset_worker_m_03","Godnością dzieci nie nakarmię.","Çocuklarımı gururla doyuramam.",""
"62EC20444D6B1ABD55EA9BA16CE3FE06","smc_vset_worker_m_03","Mama mówiła, że jak dają, to trzeba wziąć...","Annem derdi ki, verirlerse alacaksın…",""
'@

$data["smc_vset_worker_m_04.csv"] = @'
"Hash","NodeName","PL","TR","Notes"
"41D7B1084CCCD0842FEB7D9BE5F69D0F","smc_vset_worker_m_04","Cały dzień rury na gówno kładę...","Bütün gün bok için boru döşüyorum…",""
"841478E24E1B722537EFCB968A969FCC","smc_vset_worker_m_04","Ta kanalizacja to jakiś żydowski podstęp musi być.","Bu kanalizasyon iyi bir Yahudi tezgâhı olmalı.",""
"F504D09C45537EC77B7770A510E8A713","smc_vset_worker_m_04","A po szychcie chodziliśmy na kremówki...","Vardiyadan sonra kremalı pasta yemeye giderdik…",""
'@

$total = 0
foreach ($key in $data.Keys) {
    $outPath = Join-Path "translation" $key
    Set-Content -Path $outPath -Value $data[$key] -Encoding UTF8
    $lineCount = ($data[$key] -split "`n").Count - 1
    $total += $lineCount
}
Write-Host "Yazıldı: $($data.Count) dosya, $total satır (header dahil)"
