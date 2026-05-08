import '../../domain/entities/book.dart';

final List<Book> mockBooks = [
  Book(
    id: '1',
    title: 'Dədə Qorqud',
    author: 'Naməlum',
    category: 'Klassik',
    price: 12.99,
    condition: 'Yeni',
    imageUrl: 'https://covers.openlibrary.org/b/id/8091016-L.jpg',
    description:
    '“Kitabi-Dədə Qorqud” Azərbaycan və türk xalq ədəbiyyatının ən qədim dastanlarından biridir. Kitabda Oğuz türklərinin qəhrəmanlıq ruhu, ailə dəyərləri, dostluq və vətən sevgisi təsvir olunur. Hər boyda fərqli hadisələr və qəhrəmanlıq nümunələri yer alır.',
    publisher: 'Şərq-Qərb',
    year: '2020',
  ),

  Book(
    id: '2',
    title: 'Ali və Nino',
    author: 'Kurban Said',
    category: 'Roman',
    price: 15.99,
    condition: 'İşlənmiş',
    imageUrl: 'https://covers.openlibrary.org/b/id/8739161-L.jpg',
    description:
    'Şərq və Qərb mədəniyyətləri arasında qalan iki gəncin sevgi hekayəsini izah edən məşhur Azərbaycan romanıdır. Əsərdə Bakı şəhərinin qədim dövrü, milli dəyərlər və fərqli dünyagörüşləri təsirli şəkildə təqdim olunur.',
    publisher: 'Qanun',
    year: '2019',
  ),

  Book(
    id: '3',
    title: 'Əliqulu Qəmküsar',
    author: 'Mirzə Cəlil',
    category: 'Hekayə',
    price: 8.99,
    condition: 'Yeni',
    imageUrl: 'https://covers.openlibrary.org/b/id/10527843-L.jpg',
    description:
    'Mirzə Cəlilin satirik və düşündürücü hekayələrindən ibarət kitabdır. Əsərdə cəmiyyətin problemləri, insanların davranışları və dövrün sosial vəziyyəti ustalıqla tənqid olunur.',
    publisher: 'Elm',
    year: '2021',
  ),

  Book(
    id: '4',
    title: 'Ölülər',
    author: 'Mirzə Cəlil',
    category: 'Dram',
    price: 10.99,
    condition: 'Yeni',
    imageUrl: 'https://covers.openlibrary.org/b/id/9255566-L.jpg',
    description:
    'Azərbaycan dramaturgiyasının ən məşhur əsərlərindən biridir. “Ölülər” cəmiyyətdəki savadsızlığı, fanatizmi və xurafatı kəskin satira ilə tənqid edən tragikomik dramdır.',
    publisher: 'Elm',
    year: '2018',
  ),

  Book(
    id: '5',
    title: 'Dumanlı Təbriz',
    author: 'Məmməd Səid Ordubadi',
    category: 'Roman',
    price: 14.99,
    condition: 'İşlənmiş',
    imageUrl: 'https://covers.openlibrary.org/b/id/8231432-L.jpg',
    description:
    'Tarixi hadisələr əsasında yazılmış bu roman Cənubi Azərbaycanın ictimai və siyasi həyatını əks etdirir. Əsərdə xalqın azadlıq uğrunda mübarizəsi geniş şəkildə təsvir olunur.',
    publisher: 'Azərnəşr',
    year: '2017',
  ),

  Book(
    id: '6',
    title: 'Hophopnamə',
    author: 'Sabir',
    category: 'Şeir',
    price: 9.99,
    condition: 'Yeni',
    imageUrl: 'https://covers.openlibrary.org/b/id/7887482-L.jpg',
    description:
    'Sabirin satirik şeirlərindən ibarət məşhur əsərdir. Şair burada cəmiyyətin problemlərini, insanların cahilliyini və sosial ədalətsizliyi yumor və satira ilə təqdim edir.',
    publisher: 'Şərq-Qərb',
    year: '2022',
  ),

  Book(
    id: '7',
    title: 'Anamın Kitabı',
    author: 'Cəlil Məmmədquluzadə',
    category: 'Dram',
    price: 11.99,
    condition: 'İşlənmiş',
    imageUrl: 'https://covers.openlibrary.org/b/id/8974532-L.jpg',
    description:
    'Milli kimlik, ailə münasibətləri və cəmiyyət problemlərini əks etdirən klassik dram əsəridir. Müxtəlif düşüncəli insanların bir ailə daxilində toqquşması təsvir olunur.',
    publisher: 'Elm',
    year: '2019',
  ),

  Book(
    id: '8',
    title: 'Müsibəti Fəxrəddin',
    author: 'Rəşid bəy Əfəndiyev',
    category: 'Roman',
    price: 13.99,
    condition: 'Yeni',
    imageUrl: 'https://covers.openlibrary.org/b/id/9318874-L.jpg',
    description:
    'Maarifçilik ideyalarını və cəmiyyət problemlərini ön plana çıxaran təsirli Azərbaycan romanıdır. Əsərdə insanların həyat mübarizəsi və çətin seçimləri təsvir olunur.',
    publisher: 'Qanun',
    year: '2020',
  ),

  Book(
    id: '9',
    title: 'Aldanmış Kəvakib',
    author: 'Mirzə Fətəli Axundzadə',
    category: 'Hekayə',
    price: 7.99,
    condition: 'İşlənmiş',
    imageUrl: 'https://covers.openlibrary.org/b/id/8074254-L.jpg',
    description:
    'Mirzə Fətəli Axundzadənin məşhur əsərlərindən biri olan bu kitab insan münasibətlərini və cəmiyyətin nöqsanlarını maraqlı süjet xətti ilə təqdim edir.',
    publisher: 'Azərnəşr',
    year: '2016',
  ),

  Book(
    id: '10',
    title: 'Səməd Vurğun Seçilmiş Əsərləri',
    author: 'Səməd Vurğun',
    category: 'Şeir',
    price: 16.99,
    condition: 'Yeni',
    imageUrl: 'https://covers.openlibrary.org/b/id/9780689-L.jpg',
    description:
    'Xalq şairi Səməd Vurğunun ən məşhur şeirləri və poemalarının toplandığı kitabdır. Əsərlərdə vətən sevgisi, insanlıq və həyat fəlsəfəsi ön plana çıxır.',
    publisher: 'Şərq-Qərb',
    year: '2023',
  ),

  Book(
    id: '11',
    title: 'Sapiens',
    author: 'Yuval Noah Harari',
    category: 'Elmi',
    price: 22.99,
    condition: 'Yeni',
    imageUrl: 'https://covers.openlibrary.org/b/id/8739941-L.jpg',
    description:
    'Bəşəriyyətin yaranışından müasir dövrə qədər keçdiyi inkişaf yolunu izah edən məşhur elmi kitabdır. İnsanların necə inkişaf etdiyi və cəmiyyətlərin necə formalaşdığı sadə dillə təqdim olunur.',
    publisher: 'Harper',
    year: '2021',
  ),

  Book(
    id: '12',
    title: 'Atomik Vərdişlər',
    author: 'James Clear',
    category: 'Qeyri-bədii',
    price: 18.99,
    condition: 'Yeni',
    imageUrl: 'https://covers.openlibrary.org/b/id/10410790-L.jpg',
    description:
    'Kiçik vərdişlərin uzun müddətdə böyük nəticələr verdiyini izah edən motivasiya və şəxsi inkişaf kitabıdır. Gündəlik həyat üçün praktik məsləhətlər təqdim olunur.',
    publisher: 'Collins',
    year: '2022',
  ),

  Book(
    id: '13',
    title: 'Kiçik Şahzadə',
    author: 'Antoine de Saint-Exupéry',
    category: 'Uşaq',
    price: 9.99,
    condition: 'Yeni',
    imageUrl: 'https://covers.openlibrary.org/b/id/8406786-L.jpg',
    description:
    'Dostluq, sevgi və insan münasibətləri haqqında dərin mesajlar verən məşhur uşaq romanıdır. Sadə görünən hekayə böyük fəlsəfi mənalar daşıyır.',
    publisher: 'Qanun',
    year: '2019',
  ),

  Book(
    id: '14',
    title: 'Harry Potter və Fəlsəfə Daşı',
    author: 'J.K. Rowling',
    category: 'Uşaq',
    price: 19.99,
    condition: 'Yeni',
    imageUrl: 'https://covers.openlibrary.org/b/id/10110415-L.jpg',
    description:
    'Harry Potterin sehrli Hogwarts məktəbində başlayan macərasını izah edən məşhur fantastik romanın ilk hissəsidir.',
    publisher: 'Bloomsbury',
    year: '2020',
  ),

  Book(
    id: '15',
    title: 'Zamanın Qısa Tarixi',
    author: 'Stephen Hawking',
    category: 'Elmi',
    price: 20.99,
    condition: 'Yeni',
    imageUrl: 'https://covers.openlibrary.org/b/id/8084956-L.jpg',
    description:
    'Kainat, qara dəliklər və zaman anlayışını sadə və anlaşıqlı dildə izah edən məşhur elmi kitabdır.',
    publisher: 'Bantam',
    year: '2021',
  ),

  Book(
    id: '16',
    title: '1984',
    author: 'George Orwell',
    category: 'Roman',
    price: 14.99,
    condition: 'İşlənmiş',
    imageUrl: 'https://covers.openlibrary.org/b/id/8575708-L.jpg',
    description:
    'Totalitar idarəetmə və insan azadlığının məhdudlaşdırılması haqqında yazılmış məşhur distopik romandır.',
    publisher: 'Secker',
    year: '2018',
  ),

  Book(
    id: '17',
    title: 'Cinayət və Cəza',
    author: 'Fyodor Dostoyevski',
    category: 'Klassik',
    price: 17.99,
    condition: 'Yeni',
    imageUrl: 'https://covers.openlibrary.org/b/id/8091037-L.jpg',
    description:
    'Cinayət, vicdan əzabı və insan psixologiyasını dərindən araşdıran dünya ədəbiyyatının şah əsərlərindən biridir.',
    publisher: 'Penguin',
    year: '2020',
  ),

  Book(
    id: '18',
    title: 'Düşün və Var Ol',
    author: 'Napoleon Hill',
    category: 'Qeyri-bədii',
    price: 13.99,
    condition: 'Yaxşı',
    imageUrl: 'https://covers.openlibrary.org/b/id/9255hydroxy-L.jpg',
    description:
    'Uğur qazanmaq və məqsədlərə çatmaq üçün düşüncə tərzinin vacibliyini izah edən motivasiya kitabıdır.',
    publisher: 'Litera',
    year: '2019',
  ),

  Book(
    id: '19',
    title: 'Məhəbbət və Ölüm',
    author: 'İlyas Əfəndiyev',
    category: 'Dram',
    price: 11.99,
    condition: 'Yeni',
    imageUrl: 'https://covers.openlibrary.org/b/id/9318800-L.jpg',
    description:
    'Sevgi, insan münasibətləri və həyatın çətinliklərini təsirli şəkildə təqdim edən Azərbaycan dram əsəridir.',
    publisher: 'Elm',
    year: '2021',
  ),

  Book(
    id: '20',
    title: 'Şirvanlı Qız',
    author: 'Süleyman Sani Axundov',
    category: 'Hekayə',
    price: 8.99,
    condition: 'İşlənmiş',
    imageUrl: 'https://covers.openlibrary.org/b/id/8406750-L.jpg',
    description:
    'Azərbaycan həyatını və insan münasibətlərini əks etdirən maraqlı və düşündürücü hekayələrdən ibarətdir.',
    publisher: 'Azərnəşr',
    year: '2017',
  ),
];