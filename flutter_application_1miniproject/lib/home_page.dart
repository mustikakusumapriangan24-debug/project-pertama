import 'package:flutter/material.dart';
import 'detail_page.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = "Makanan";


  final List<Map<String, String>> makanan = [
    {"title": "Colenak", "image": "assets/images/colenak.jpg"},
    {"title": "Batagor", "image": "assets/images/batagor.jpg"},
    {"title": "Karedok", "image": "assets/images/karedok.jpg"},
    {"title": "Lotek", "image": "assets/images/lotek.jpg"},
    {"title": "Nasi Timbel", "image": "assets/images/nasiTimbel.jpg"},
    {"title": "Soto Bandung", "image": "assets/images/sotoBandung.jpg"},
    {"title": "Sate Maranggi", "image": "assets/images/sate.jpg"},
    {"title": "Nasi Tutug Oncom", "image": "assets/images/nasiOncom.jpg"},
    {"title": "Seblak", "image": "assets/images/seblak.jpg"},
    {"title": "Cireng", "image": "assets/images/cireng.jpg"},
    {"title": "Asinan Bogor", "image": "assets/images/asinan.jpg"},
    {"title": "Chocodot", "image": "assets/images/chocodot.jpg"},
    {"title": "Ubi Cilembu", "image": "assets/images/cilembu.jpg"},
    {"title": "Combro", "image": "assets/images/combro.jpg"},
    {"title": "Cuanki", "image": "assets/images/cuanki.jpg"},
    {"title": "Dodol garut", "image": "assets/images/dodol.jpg"},
    {"title": "Dorokdok", "image": "assets/images/dorokdok.jpg"},
    {"title": "Empal Gentong", "image": "assets/images/empalgentong.jpg"},
    {"title": "Geco", "image": "assets/images/geco.jpg"},
    {"title": "Gemblong", "image": "assets/images/gemblong.jpg"},
    {"title": "Ketan", "image": "assets/images/ketan.jpg"},
    {"title": "Nasi Liwet", "image": "assets/images/liwet.jpg"},
    {"title": "Lontong Kari", "image": "assets/images/lontongkari.jpg"},
    {"title": "Mie Kocok", "image": "assets/images/miekocok.jpg"},
    {"title": "Misro", "image": "assets/images/misro.jpg"},
    {"title": "Nasi Jamblang", "image": "assets/images/nasijamblang.jpg"},
    {"title": "Opak", "image": "assets/images/opak.jpg"},
    {"title": "Peuyeum", "image": "assets/images/peuyeum.jpg"},
    {"title": "Rengginang", "image": "assets/images/rengginang.jpg"},
    {"title": "Sate", "image": "assets/images/sate.jpg"},
    {"title": "Surabi", "image": "assets/images/surabi.jpg"},
    {"title": "Tahu Gejrot", "image": "assets/images/tahuGejrot.jpg"},
    {"title": "Tahu Sumedang", "image": "assets/images/tahuSumedang.jpg"},

  ];

  final List<Map<String, String>> minuman = [
    {"title": "Bajigur", "image": "assets/images/bajigur.jpg"},
    {"title": "Bandrek", "image": "assets/images/bandrek.jpg"},
    {"title": "Es Goyobod", "image": "assets/images/goyobod.jpg"},
    {"title": "Es Cendol", "image": "assets/images/cendol.jpg"},
    {"title": "Es Doger", "image": "assets/images/doger.jpg"},
    {"title": "Es Pala", "image": "assets/images/pala.jpg"},
    {"title": "Es Oyen ", "image": "assets/images/oyen.jpg"},
    {"title": "Es Cincau", "image": "assets/images/cincau.jpg"},
    {"title": "Bir Kotjok", "image": "assets/images/kotjok.jpg"},
    {"title": "Es Ciming", "image": "assets/images/ciming.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
  
    final List<Map<String, String>> currentData =
        selectedCategory == "Makanan" ? makanan : minuman;

    return Scaffold(
      appBar: AppBar(
        title: const Text("LuxeBite"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Rekomendasi Kuliner Jawa Barat",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  buildCategoryButton("Makanan"),
                  const SizedBox(width: 12),
                  buildCategoryButton("Minuman"),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.85,
                children: currentData
                    .map((item) => FoodCard(
                          title: item["title"]!,
                          imagePath: item["image"]!,
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  
  Widget buildCategoryButton(String name) {
    final bool active = selectedCategory == name;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = name;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: active ? Colors.orange : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          name,
          style: TextStyle(
            color: active ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}


class FoodCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const FoodCard({super.key, required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              title: title,
              imagePath: imagePath,
              description: getDescription(title),
              rating: 4.5,


              
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(12),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                imagePath,
                width: 250,
                height: 250,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Icon(Icons.broken_image));
                },
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}


String getDescription(String title) {
  switch (title) {
    case "Colenak":
  return '''
Colenak adalah makanan tradisional khas Sunda yang berasal dari Bandung, Jawa Barat. Makanan ini terbuat dari peuyeum atau tape singkong yang dibakar hingga permukaannya sedikit garing dan harum. Setelah dibakar, peuyeum disajikan bersama saus kinca yang dibuat dari gula merah dan santan. Perpaduan rasa manis, gurih, dan sedikit asam dari proses fermentasi singkong membuat colenak memiliki cita rasa yang khas dan digemari banyak orang.

Nama colenak berasal dari istilah dalam bahasa Sunda yaitu dicocol enak. Istilah ini menggambarkan cara menikmati hidangan ini, yaitu dengan mencocolkan peuyeum ke dalam saus kinca atau menyiramnya di atas peuyeum. Colenak mulai dikenal sekitar tahun 1930an di Bandung dan awalnya dijual oleh pedagang kaki lima. Hingga sekarang, colenak tetap menjadi bagian penting dari kuliner Sunda dan sering muncul dalam berbagai acara budaya.

Resep Colenak

Bahan utama:
- Peuyeum atau tape singkong

Bahan saus kinca:
- Gula merah
- Santan
- Daun pandan
- Sedikit garam

Cara membuat:
1. Bakar peuyeum hingga bagian luarnya kecokelatan dan harum.
2. Masak gula merah bersama santan, daun pandan, dan garam di atas api kecil hingga mengental.
3. Sajikan peuyeum dengan saus kinca selagi hangat.

Colenak merupakan contoh kuliner sederhana namun kaya rasa yang diwariskan secara turun temurun di Jawa Barat.
''';

    case "Batagor":
  return '''
Batagor adalah salah satu makanan khas Bandung yang sangat populer di Jawa Barat. Nama batagor merupakan singkatan dari bakso tahu goreng. Makanan ini dibuat dari adonan ikan yang dimasukkan ke dalam tahu, kulit pangsit, atau siomay, lalu digoreng hingga renyah. Cita rasanya gurih, renyah di luar, dan lembut di dalam, serta menjadi semakin nikmat ketika disajikan dengan saus kacang.

Batagor mulai dikenal pada tahun 1970an sebagai hasil modifikasi dari siomay khas Tiongkok yang biasanya dikukus. Karena masyarakat Bandung lebih menyukai makanan yang digoreng, pedagang mulai menggoreng siomay dan tahu yang telah diisi adonan ikan. Sejak saat itu, batagor berkembang menjadi salah satu ikon kuliner Bandung dan dikenal luas di seluruh Indonesia.

Resep Batagor

Bahan utama:
- Tahu putih
- Kulit pangsit (opsional)
- Daging ikan tenggiri giling
- Tepung tapioka
- Telur
- Daun bawang
- Bumbu halus seperti bawang putih, garam, dan merica

Bahan saus kacang:
- Kacang tanah goreng
- Gula merah
- Cabai
- Bawang putih
- Garam
- Air
- Jeruk limau untuk aroma

Cara membuat:
1. Campurkan ikan giling, tepung tapioka, telur, dan bumbu halus hingga menjadi adonan.
2. Belah tahu, kemudian isi dengan adonan ikan. Untuk variasi, isi juga kulit pangsit dan bentuk seperti siomay.
3. Goreng batagor dalam minyak panas hingga kecokelatan dan renyah.
4. Haluskan kacang tanah, cabai, dan bumbu lainnya, lalu masak hingga mengental untuk membuat saus.
5. Sajikan batagor dengan siraman saus kacang dan perasan jeruk limau.

Batagor kini menjadi salah satu kuliner favorit masyarakat karena mudah ditemukan, rasanya gurih, dan cocok dinikmati kapan saja.
''';

    case "Karedok":
  return '''
Karedok adalah salah satu makanan khas Sunda yang terdiri dari sayuran mentah yang disiram dengan bumbu kacang. Karedok memiliki rasa segar, gurih, dan sedikit pedas dengan aroma khas kacang dan kencur. Makanan ini mirip dengan gado-gado, tetapi semua sayurnya disajikan mentah sehingga terasa lebih renyah dan segar.

Karedok berasal dari masyarakat Sunda yang sejak dulu terbiasa memanfaatkan sayuran segar sebagai bahan makanan. Pada masa lampau, sayuran seperti kacang panjang, timun, kol, taoge, dan terong hijau mudah ditemukan di kebun warga. Karena itu, karedok menjadi salah satu kuliner tradisional yang mudah dibuat dan digemari banyak orang. Hingga kini, karedok tetap menjadi makanan favorit yang sering muncul di rumah makan Sunda dan acara tradisional Jawa Barat.

Resep Karedok

Sayuran utama:
- Kacang panjang
- Timun
- Taoge
- Kol
- Daun kemangi
- Terong hijau muda
- Wortel (opsional)

Bahan bumbu kacang:
- Kacang tanah goreng
- Cabai rawit
- Kencur
- Bawang putih
- Gula merah
- Garam
- Air
- Air asam atau jeruk limau untuk aroma

Cara membuat:
1. Siapkan dan potong sayuran mentah sesuai selera.
2. Haluskan kacang, cabai, kencur, bawang putih, dan bumbu lainnya.
3. Tambahkan sedikit air hingga bumbu menjadi saus kacang yang agak kental.
4. Masukkan sayuran mentah ke dalam bumbu lalu aduk hingga merata.
5. Sajikan dengan tambahan kerupuk untuk menambah tekstur.

Karedok merupakan makanan sehat, segar, dan kaya serat yang menggambarkan kesederhanaan namun kelezatan kuliner Sunda.
''';

    case "Lotek":
  return '''
Lotek adalah makanan khas Sunda yang terdiri dari sayuran rebus yang disiram dengan bumbu kacang. Lotek sering disamakan dengan gado-gado, tetapi bumbu kacangnya lebih kental, lebih manis, dan biasanya mengandung kencur yang memberikan aroma khas. Sayuran dalam lotek direbus terlebih dahulu sehingga teksturnya lebih lembut dibanding karedok yang memakai sayuran mentah.

Lotek sudah lama menjadi hidangan sehari-hari masyarakat Sunda, terutama di daerah Bandung dan sekitarnya. Pada masa dahulu, lotek dibuat sebagai cara memanfaatkan sayuran kebun yang melimpah dan mudah didapat. Perpaduan rasa gurih, manis, dan segar dari sayuran membuat lotek menjadi pilihan makanan sehat dan mengenyangkan hingga sekarang.

Resep Lotek

Sayuran utama:
- Kangkung
- Bayam
- Kacang panjang
- Tauge
- Kol
- Kentang rebus
- Timun dan tomat sebagai pelengkap

Bahan bumbu kacang:
- Kacang tanah goreng
- Gula merah
- Cabai rawit atau cabai merah
- Bawang putih
- Kencur
- Garam
- Air hangat
- Air asam atau jeruk limau untuk aroma

Cara membuat:
1. Rebus semua sayuran hingga matang, lalu tiriskan.
2. Haluskan kacang tanah bersama cabai, bawang putih, kencur, dan bumbu lainnya.
3. Tambahkan air hangat perlahan hingga bumbu menjadi saus kacang yang kental.
4. Masukkan sayuran rebus ke dalam bumbu lalu aduk hingga rata.
5. Sajikan dengan lontong atau nasi serta kerupuk sebagai pelengkap.

Lotek merupakan makanan yang sederhana namun kaya rasa, menjadi salah satu ciri khas kuliner Sunda yang sehat dan digemari banyak orang.
''';

    case "Nasi Timbel":
  return '''
Nasi Timbel adalah hidangan khas Sunda yang terdiri dari nasi hangat yang dibungkus menggunakan daun pisang. Ketika dibungkus dalam keadaan panas, aroma daun pisang meresap ke dalam nasi dan menghasilkan wangi yang khas serta memberikan cita rasa yang lembut. Hidangan ini biasanya disajikan dengan berbagai lauk khas Sunda.

Nasi timbel berasal dari kebiasaan masyarakat Sunda zaman dahulu yang sering membungkus nasi dengan daun pisang untuk dibawa bekerja di sawah atau ladang. Selain menjaga nasi tetap hangat, daun pisang juga membuat nasi tidak cepat basi. Nasi timbel kemudian berkembang menjadi hidangan tradisional yang disajikan di rumah makan Sunda dan acara keluarga.

Resep Nasi Timbel

Bahan utama:
- Nasi putih hangat
- Daun pisang untuk membungkus

Lauk pendamping yang umum:
- Ayam goreng atau ikan goreng
- Tahu dan tempe goreng
- Sambal terasi
- Lalapan segar seperti timun, kemangi, dan kol
- Ikan asin atau pepes

Cara membuat:
1. Siapkan daun pisang dan panaskan sebentar di atas api agar lebih lentur.
2. Letakkan nasi hangat di atas daun pisang.
3. Gulung atau lipat daun pisang hingga nasi terbungkus rapat.
4. Sajikan nasi timbel bersama lauk pauk khas Sunda.

Nasi timbel terkenal karena kesederhanaannya, namun tetap memberikan cita rasa yang khas dan penuh aroma tradisional Sunda.
''';

    case "Soto Bandung":
  return '''
Soto Bandung adalah hidangan khas Sunda yang dikenal dengan kuahnya yang bening, segar, dan ringan. Berbeda dari kebanyakan soto lain yang kaya rempah, Soto Bandung menggunakan bumbu yang lebih sederhana sehingga rasa alami dari kaldu sapi lebih menonjol. Ciri khas lainnya adalah penggunaan lobak dan kacang kedelai goreng yang memberikan sensasi gurih dan renyah ketika disantap.

Soto Bandung diperkirakan muncul pada awal abad ke-20 di Kota Bandung, ketika masyarakat Sunda mulai mengadaptasi hidangan soto dari daerah lain. Karena selera masyarakat Sunda cenderung menyukai makanan berkuah ringan dan tidak terlalu berbumbu tajam, muncullah versi soto dengan kuah bening serta tambahan lobak sebagai pembeda. Seiring waktu, Soto Bandung menjadi salah satu ikon kuliner Bandung dan banyak ditemukan di rumah makan khas Sunda.

Resep Soto Bandung

Bahan utama:
- 500 gram daging sapi
- 1 buah lobak, iris tipis
- 2 liter air
- Garam dan gula secukupnya
- Kacang kedelai goreng untuk taburan

Bumbu halus:
- 4 siung bawang putih
- 6 siung bawang merah
- 1 sendok teh merica

Bumbu pelengkap:
- 2 batang serai
- 3 lembar daun salam
- 3 cm jahe, digeprek

Cara membuat:
1. Rebus daging sapi hingga empuk, lalu potong-potong.
2. Tumis bumbu halus bersama serai, jahe, dan daun salam hingga harum.
3. Masukkan tumisan ke dalam rebusan daging.
4. Tambahkan irisan lobak, garam, dan sedikit gula. Masak hingga lobak lunak.
5. Sajikan Soto Bandung dengan taburan kacang kedelai goreng.

Soto Bandung memiliki cita rasa yang ringan namun tetap gurih, menjadikannya sajian khas Sunda yang digemari karena kesegarannya.
''';

    case "Sate Maranggi":
  return '''
Sate Maranggi adalah salah satu kuliner khas dari Purwakarta, Jawa Barat, yang dikenal dengan cita rasa dagingnya yang gurih, manis, dan sedikit pedas. Berbeda dengan sate pada umumnya yang menggunakan bumbu kacang atau kecap setelah dibakar, Sate Maranggi justru dibumbui sejak sebelum dibakar sehingga rasanya meresap hingga ke dalam. Ciri khas lainnya adalah penggunaan daging sapi atau kambing yang dipotong agak besar untuk mendapatkan tekstur juicy dan empuk.

Secara sejarah, Sate Maranggi dipercaya merupakan hasil akulturasi budaya antara masyarakat Sunda dan pendatang dari Tiongkok serta Timur Tengah pada masa lampau. Teknik marinasi dengan bumbu fermentasi seperti cuka lahang diduga berasal dari pengaruh kuliner Tionghoa. Seiring waktu, hidangan ini berkembang menjadi kuliner lokal yang populer dan menjadi ikon Purwakarta, bahkan sering menjadi hidangan utama dalam berbagai acara dan festival kuliner.

Resep Sate Maranggi

Bahan utama:
- 500 gram daging sapi atau kambing, potong dadu
- Tusuk sate secukupnya

Bahan marinasi:
- 5 siung bawang putih
- 7 siung bawang merah
- 3 butir kemiri
- 1 ruas jahe
- 1 ruas lengkuas
- 3 sendok makan kecap manis
- 2 sendok makan kecap asin
- 1 sendok makan cuka lahang (opsional)
- 1 sendok makan ketumbar bubuk
- Garam dan gula secukupnya

Sambal dan pendamping:
- Sambal tomat atau sambal kecap
- Acar mentimun dan bawang merah
- Lalapan seperti tomat, kemangi, dan timun

Cara membuat:
1. Haluskan bawang putih, bawang merah, kemiri, jahe, dan lengkuas.
2. Campurkan bumbu halus dengan kecap manis, kecap asin, ketumbar, cuka lahang, garam, dan gula.
3. Lumuri daging dengan bumbu marinasi dan diamkan minimal 1 jam agar meresap.
4. Tusuk daging ke tusuk sate, lalu bakar sambil sesekali diolesi sisa bumbu.
5. Sajikan sate dengan sambal tomat, acar, dan lalapan segar.

Sate Maranggi terkenal dengan rasa dagingnya yang meresap hingga ke dalam serta aroma bakaran yang khas, menjadikannya salah satu sate paling populer dari Jawa Barat.
''';

    case "Nasi Tutug Oncom":
  return '''
Nasi Tutug Oncom adalah hidangan khas Sunda yang berasal dari daerah Tasikmalaya. Hidangan ini terdiri dari nasi hangat yang dicampur dengan oncom yang telah ditumis bersama bumbu. Perpaduan nasi dan oncom menghasilkan aroma smokey yang khas serta rasa gurih, pedas, dan sedikit fermentasi yang menjadi ciri khas masakan Sunda.

Secara sejarah, Nasi Tutug Oncom muncul sebagai makanan rakyat pada masa lalu, terutama ketika bahan makanan sulit didapat. Oncom yang terbuat dari hasil fermentasi kacang-kacangan menjadi pilihan karena murah, bergizi, dan mudah diolah. Seiring waktu, hidangan sederhana ini berkembang menjadi salah satu kuliner populer yang banyak ditemukan di rumah makan Sunda dan menjadi makanan harian masyarakat Jawa Barat.

Resep Nasi Tutug Oncom

Bahan utama:
- 1 piring nasi hangat
- 1 papan oncom merah atau hitam, hancurkan kasar
- Minyak goreng secukupnya

Bumbu tumis:
- 3 siung bawang putih
- 5 siung bawang merah
- 5 buah cabai merah atau sesuai selera
- 1 ruas kencur
- Garam dan gula secukupnya

Pelengkap yang umum:
- Lalapan seperti kemangi, timun, dan kol
- Sambal terasi
- Tahu dan tempe goreng
- Ikan asin atau ayam goreng

Cara membuat:
1. Haluskan bawang putih, bawang merah, cabai, dan kencur.
2. Tumis bumbu halus hingga harum lalu masukkan oncom yang telah dihancurkan.
3. Tambahkan garam dan gula, aduk hingga oncom matang dan beraroma.
4. Campurkan oncom tumis dengan nasi hangat dan aduk hingga merata.
5. Sajikan bersama lauk dan lalapan khas Sunda.

Nasi Tutug Oncom terkenal karena rasanya yang gurih dan aromanya yang khas, menjadikannya salah satu makanan sederhana namun sangat digemari oleh masyarakat Sunda.
''';

    case "Seblak":
  return '''
Seblak adalah makanan khas Bandung yang terkenal dengan cita rasanya yang pedas, gurih, dan aromanya yang khas. Hidangan ini terbuat dari kerupuk mentah yang direbus hingga lembut, kemudian dimasak bersama bumbu rempah seperti kencur, bawang, cabai, dan berbagai pelengkap. Seblak hadir dalam banyak variasi, mulai dari seblak basah, seblak kering, hingga seblak dengan berbagai tambahan seperti ceker, bakso, sosis, mie, dan sayuran.

Secara sejarah, seblak diyakini berasal dari kuliner tradisional masyarakat Sunda yang memanfaatkan kerupuk dan bumbu sederhana. Dalam perkembangannya, seblak mulai populer sekitar tahun 2000-an di Bandung dan kemudian menyebar ke seluruh Indonesia. Kencur menjadi salah satu ciri utama seblak yang membedakannya dari masakan pedas lainnya, karena memberikan aroma dan rasa hangat yang khas. Kini, seblak menjadi street food favorit yang digemari anak muda maupun orang dewasa.

Resep Seblak Sederhana

Bahan utama:
- 1 genggam kerupuk mentah (kerupuk bawang atau kerupuk kanji)
- 1 butir telur
- Sosis, bakso, atau ceker (opsional)
- Sayuran seperti sawi atau kol
- Air secukupnya
- Minyak goreng

Bumbu halus:
- 3 siung bawang putih
- 4 siung bawang merah
- 6–10 cabai rawit (sesuai selera pedas)
- 1 ruas kencur
- Garam, gula, dan kaldu bubuk secukupnya

Cara membuat:
1. Rebus kerupuk hingga setengah lembut, tiriskan.
2. Haluskan bumbu lalu tumis hingga harum.
3. Masukkan telur dan orak-arik.
4. Tambahkan sosis, bakso, atau pelengkap lainnya.
5. Masukkan kerupuk dan tuang sedikit air hingga mencapai tekstur seblak yang diinginkan.
6. Bumbui dengan garam, gula, dan kaldu bubuk.
7. Masukkan sayuran lalu masak hingga layu.
8. Sajikan selagi panas.

Seblak dikenal sebagai makanan pedas yang memanjakan lidah, dengan perpaduan kencur dan cabai yang membuat rasanya unik serta sulit dilupakan.
''';

    case "Cireng":
  return '''
Cireng adalah makanan khas Bandung yang dibuat dari adonan aci (tepung tapioka) yang digoreng hingga renyah di luar namun tetap kenyal di dalam. Nama "cireng" sendiri berasal dari singkatan dalam bahasa Sunda yaitu aci digoreng. Makanan ini memiliki rasa gurih dan tekstur yang khas, sehingga menjadi salah satu jajanan yang sangat populer di Jawa Barat, terutama sebagai camilan sore.

Secara sejarah, cireng sudah ada sejak tahun 1980-an dan awalnya dijual sebagai jajanan sederhana oleh pedagang kaki lima. Karena bahan dasarnya murah dan mudah didapat, cireng menjadi favorit banyak orang. Seiring waktu, variasi cireng semakin berkembang, mulai dari cireng bumbu rujak, cireng isi ayam, cireng isi keju, hingga cireng isi sosis. Inovasi ini membuat cireng semakin dikenal dan digemari di berbagai daerah di Indonesia.

Resep Cireng Sederhana

Bahan utama:
- 200 gram tepung tapioka
- 2 sendok makan tepung terigu
- 2 siung bawang putih, haluskan
- 1 batang daun bawang, iris halus
- Garam, merica, dan kaldu bubuk secukupnya
- Air panas secukupnya
- Minyak goreng untuk menggoreng

Cara membuat:
1. Campurkan tepung tapioka, tepung terigu, bawang putih, daun bawang, garam, merica, dan kaldu bubuk.
2. Tuang air panas sedikit demi sedikit sambil diaduk hingga adonan bisa dipulung.
3. Ambil sedikit adonan, bentuk pipih sesuai selera.
4. Panaskan minyak lalu goreng cireng dengan api sedang hingga bagian luar berwarna putih keemasan.
5. Angkat dan tiriskan.

Cireng biasanya disajikan dengan sambal rujak yang manis pedas, menjadikan rasanya semakin nikmat dan cocok sebagai camilan favorit sepanjang hari.
''';

    case "Bajigur":
  return '''
Bajigur adalah minuman tradisional khas Sunda yang memiliki rasa manis, hangat, dan menenangkan. Minuman ini dibuat dari campuran gula aren, santan, jahe, serta sedikit garam untuk menyeimbangkan rasa. Aroma wangi gula aren dan sensasi hangat dari jahe membuat bajigur sangat cocok diminum saat cuaca dingin atau malam hari. 

Secara sejarah, bajigur berasal dari kebiasaan masyarakat pedesaan di Jawa Barat yang mencari minuman penghangat tubuh ketika cuaca dingin di daerah pegunungan. Awalnya bajigur dibuat dengan resep sederhana, namun seiring waktu berkembang dengan tambahan bahan seperti kopi, vanili, dan potongan kolang-kaling. Pedagang bajigur keliling dengan gerobak khasnya menjadi pemandangan umum di berbagai daerah Sunda pada masa lalu hingga sekarang.

Resep Bajigur Sederhana

Bahan utama:
- 200 gram gula aren
- 700 ml santan
- 2 ruas jahe, memarkan
- 2 lembar daun pandan
- 1/4 sendok teh garam
- 1 sendok makan kopi bubuk (opsional)
- Kolang-kaling secukupnya (opsional)

Cara membuat:
1. Rebus santan bersama gula aren, jahe, pandan, dan garam.
2. Aduk terus agar santan tidak pecah.
3. Setelah gula larut dan aroma muncul, masukkan kopi jika ingin rasa lebih pekat.
4. Masak hingga mendidih lalu angkat.
5. Sajikan panas dengan tambahan kolang-kaling jika suka.

Bajigur dikenal sebagai minuman penghangat tubuh yang menenangkan, dengan perpaduan manisnya gula aren dan hangatnya jahe yang membuatnya menjadi salah satu minuman khas Sunda paling populer.
''';

    case "Asinan Bogor":
  return '''
Asinan Bogor adalah hidangan khas Kota Bogor yang terkenal dengan rasa segar, asam, manis, dan pedas. Makanan ini terdiri dari berbagai buah-buahan atau sayur-sayuran yang direndam dalam kuah asinan yang khas. Kuahnya terbuat dari campuran cuka, gula, garam, dan cabai yang menciptakan sensasi segar serta menggugah selera. Asinan Bogor memiliki dua jenis populer, yaitu asinan buah dan asinan sayur, dan keduanya sangat digemari masyarakat lokal maupun wisatawan.

Secara sejarah, asinan diduga merupakan hasil akulturasi kuliner antara budaya Tionghoa dan masyarakat Sunda. Teknik pengawetan bahan makanan dengan merendamnya dalam larutan asin atau asam mirip dengan metode pembuatan acar dalam tradisi Tionghoa. Seiring berkembangnya waktu, masyarakat Bogor memodifikasi resep tersebut dengan bumbu lokal sehingga terciptalah Asinan Bogor yang kita kenal saat ini. Hidangan ini sudah menjadi ikon kuliner Bogor dan sering dijadikan oleh-oleh khas wisatawan.

Resep Asinan Bogor Buah

Bahan utama:
- Buah-buahan seperti nanas, pepaya, jambu, kedondong, dan bengkuang
- Cabai merah secukupnya
- Kacang tanah goreng untuk taburan

Bahan kuah:
- 500 ml air
- 150 gram gula merah
- 3–4 sendok makan cuka
- 1 sendok teh garam
- 5–10 cabai merah (sesuai tingkat pedas)
- Pewarna makanan merah (opsional)

Cara membuat:
1. Potong buah sesuai selera, sisihkan.
2. Haluskan cabai merah kemudian rebus bersama air, gula merah, dan garam hingga larut.
3. Setelah hangat, tambahkan cuka dan aduk rata.
4. Tuang kuah asinan ke dalam wadah berisi buah.
5. Simpan di kulkas selama beberapa jam agar bumbu meresap.
6. Sajikan dengan taburan kacang tanah goreng.

Asinan Bogor terkenal dengan cita rasanya yang segar dan menyegarkan, menjadikannya hidangan yang cocok dinikmati kapan saja, terutama saat cuaca panas.
''';

    case "Chocodot":
  return '''
Chocodot adalah camilan khas Garut yang menggabungkan cokelat dengan dodol, dua produk unggulan daerah tersebut. Nama "Chocodot" sendiri merupakan singkatan dari chocolate dan dodol. Inovasi unik ini menghasilkan perpaduan rasa manis, lembut, dan kenyal yang membuat Chocodot menjadi oleh-oleh modern yang sangat populer di Jawa Barat.

Secara sejarah, Chocodot pertama kali diciptakan oleh seorang pengusaha muda dari Garut yang ingin mengembangkan produk lokal agar lebih menarik bagi generasi muda dan wisatawan. Dengan memadukan dodol tradisional Garut bersama cokelat yang disukai banyak orang, lahirlah camilan baru yang memiliki cita rasa khas namun tetap mempertahankan identitas lokal. Chocodot kemudian berkembang menjadi berbagai varian menarik, seperti cokelat isi dodol rasa stroberi, durian, kacang, hingga varian pedas.

Resep Chocodot Sederhana

Bahan utama:
- 200 gram cokelat batang (dark atau milk chocolate)
- Dodol Garut secukupnya, potong kecil
- Kertas cup atau cetakan cokelat

Cara membuat:
1. Lelehkan cokelat batang dengan metode double boiler agar tidak gosong.
2. Tuang sedikit cokelat cair ke dalam cetakan.
3. Masukkan potongan dodol ke bagian tengah.
4. Tutup kembali dengan cokelat cair hingga menutupi dodol sepenuhnya.
5. Dinginkan di lemari es hingga cokelat mengeras.
6. Keluarkan dan sajikan.

Chocodot terkenal sebagai oleh-oleh kekinian dari Garut yang berhasil menggabungkan cita rasa tradisional dan modern, menjadikannya camilan unik yang digemari banyak kalangan.
''';

    case "Ubi Cilembu":
  return '''
Ubi Cilembu adalah jenis ubi manis khas dari daerah Cilembu, Sumedang, Jawa Barat. Ubi ini terkenal karena ketika dipanggang, bagian dalamnya akan mengeluarkan cairan lengket seperti madu yang memberikan rasa manis alami dan tekstur lembut. Karena keunikannya, ubi ini sering dijuluki sebagai "ubi madu" dan menjadi salah satu produk pertanian paling terkenal dari Jawa Barat.

Secara sejarah, Ubi Cilembu sudah dibudidayakan sejak puluhan tahun yang lalu oleh masyarakat lokal. Keberhasilan dalam menghasilkan rasa manis yang khas dipengaruhi oleh kondisi tanah dan iklim di kawasan Cilembu, sehingga ubi ini tidak dapat dibudidayakan dengan kualitas yang sama di sembarang tempat. Seiring berjalannya waktu, Ubi Cilembu menjadi komoditas unggulan yang sering dijadikan oleh-oleh, baik untuk pasar lokal maupun ekspor ke berbagai negara.

Resep Ubi Cilembu Panggang

Bahan utama:
- Ubi Cilembu secukupnya

Cara membuat:
1. Cuci bersih ubi Cilembu tanpa mengupas kulitnya.
2. Panaskan oven pada suhu 180–200°C.
3. Panggang ubi selama 60–90 menit hingga kulit kecokelatan dan bagian dalamnya mengeluarkan cairan madu.
4. Angkat dan sajikan selagi hangat.

Ubi Cilembu dikenal sebagai camilan sehat dengan rasa manis alami dan tekstur lembut, menjadikannya salah satu kuliner paling khas dari Jawa Barat.
''';

    case "Combro":
  return '''
Combro adalah makanan khas Sunda yang terbuat dari singkong parut yang diisi dengan oncom berbumbu pedas. Nama "combro" berasal dari frasa Sunda "oncom di jero", yang berarti oncom di dalam. Makanan ini memiliki rasa gurih dan pedas, dengan tekstur luar yang renyah dan bagian dalam yang lembut. Combro sering dijadikan camilan atau teman minum teh di sore hari.

Secara sejarah, combro berasal dari wilayah Priangan, khususnya daerah Bandung dan sekitarnya. Masyarakat dahulu memanfaatkan singkong sebagai bahan pokok dan menggabungkannya dengan oncom yang difermentasi untuk menciptakan hidangan bercita rasa khas. Inovasi sederhana ini berkembang menjadi makanan populer yang digemari di seluruh Jawa Barat hingga saat ini.

Resep Combro

Bahan utama:
- 1 kg singkong parut
- 200 g kelapa parut
- 200 g oncom
- 5 siung bawang putih
- 4 siung bawang merah
- 5 cabai rawit atau sesuai selera
- Garam secukupnya
- Minyak untuk menggoreng

Cara membuat:
1. Peras singkong parut hingga tidak terlalu basah, lalu campurkan dengan kelapa parut dan garam.
2. Haluskan bawang merah, bawang putih, dan cabai, kemudian tumis hingga harum.
3. Masukkan oncom ke dalam tumisan, aduk hingga matang dan tercampur rata.
4. Ambil adonan singkong, pipihkan, lalu beri isian oncom.
5. Bentuk lonjong dan pastikan isian tertutup rapat.
6. Goreng dalam minyak panas hingga berwarna keemasan.
7. Angkat dan sajikan selagi hangat.

Combro menjadi salah satu camilan Sunda yang paling digemari karena rasanya yang gurih, pedas, dan khas.
''';

    case "Cuanki":
  return '''
Cuanki adalah jajanan khas Bandung yang terdiri dari campuran bakso, tahu, siomay, dan pangsit yang disajikan dalam kuah gurih hangat. Nama "cuanki" sering disebut berasal dari singkatan "cari uang jalan kaki", karena pada awalnya pedagang cuanki menjajakan dagangannya dengan berjalan kaki membawa pikulan. Kuahnya yang ringan namun nikmat serta isiannya yang beragam membuat cuanki menjadi salah satu makanan favorit warga Jawa Barat.

Secara sejarah, cuanki muncul pada sekitar tahun 1980-an di Bandung, terinspirasi dari bakso dan siomay bergaya Tionghoa. Karena keterbatasan modal, para pedagang menjualnya secara keliling dengan pikulan sambil berjalan kaki. Cara jualan inilah yang membuat namanya unik dan mudah diingat. Seiring waktu, cuanki berkembang menjadi hidangan populer yang dijual di kedai maupun gerobak di sepanjang jalan kota Bandung.

Resep Cuanki Sederhana

Bahan utama:
- Bakso sapi atau ayam
- Tahu putih isi atau tahu goreng
- Siomay kukus
- Pangsit rebus atau goreng
- Daun bawang secukupnya

Bahan kuah:
- 1 liter air
- Tulang sapi atau ayam
- 3 siung bawang putih
- 2 siung bawang merah
- Garam, gula, dan merica secukupnya

Cara membuat:
1. Rebus tulang sapi atau ayam untuk membuat kuah kaldu hingga harum.
2. Tumis bawang putih dan bawang merah yang dihaluskan, lalu masukkan ke dalam kuah.
3. Masukkan garam, gula, dan merica sesuai selera.
4. Siapkan mangkuk berisi bakso, tahu, siomay, dan pangsit.
5. Siram dengan kuah panas dan taburi daun bawang.
6. Sajikan selagi hangat.

Cuanki dikenal sebagai makanan yang sederhana namun nikmat, cocok disantap kapan saja terutama saat cuaca dingin.
''';

    case "Dodol Garut":
  return '''
Dodol Garut adalah makanan manis khas Kabupaten Garut, Jawa Barat, yang terbuat dari campuran tepung ketan, gula merah, dan santan. Teksturnya kenyal dan lembut, dengan rasa manis yang khas. Dodol Garut terkenal karena kualitasnya yang lebih baik dibanding dodol daerah lain, terutama berkat proses pengolahannya yang teliti dan penggunaan bahan-bahan alami berkualitas.

Secara sejarah, Dodol Garut mulai diproduksi sejak awal abad ke-20. Pada masa itu, banyak pengusaha lokal mengembangkan resep dodol yang berbeda dari dodol Betawi atau dodol lainnya, terutama dengan teknik masak perlahan dalam waktu berjam-jam. Seiring berkembangnya industri rumahan di Garut, dodol ini menjadi oleh-oleh khas yang sangat terkenal dan bahkan diekspor ke berbagai negara. Kini, Dodol Garut hadir dengan berbagai varian rasa seperti cokelat, durian, stroberi, dan pandan.

Resep Dodol Garut Sederhana

Bahan utama:
- 500 g tepung ketan
- 500 g gula merah (sisir halus)
- 200 g gula pasir
- 1 liter santan kental
- 1 sdt garam
- Daun pandan (opsional)

Cara membuat:
1. Campurkan santan, gula merah, dan gula pasir, lalu masak hingga gula larut dan adonan berwarna cokelat.
2. Masukkan tepung ketan sedikit demi sedikit sambil diaduk agar tidak menggumpal.
3. Tambahkan garam dan daun pandan bila ingin menambah aroma.
4. Masak adonan dengan api kecil sambil terus diaduk selama 2–3 jam hingga mengental dan tidak lengket di wajan.
5. Setelah matang, angkat dan tuang ke loyang yang sudah dioles minyak.
6. Dinginkan, lalu potong-potong sesuai selera.
7. Sajikan atau bungkus sebagai oleh-oleh.

Dodol Garut menjadi simbol kuliner tradisional Jawa Barat yang terkenal karena cita rasanya yang manis, teksturnya yang kenyal, dan proses pembuatannya yang penuh kesabaran.
''';

    case "Dorokdok":
  return '''
Dorokdok adalah kerupuk kulit khas Garut, Jawa Barat, yang dibuat dari kulit sapi yang dikeringkan lalu digoreng hingga mengembang dan renyah. Dorokdok memiliki tekstur yang sangat garing dan rasa gurih alami tanpa perlu banyak bumbu tambahan. Suara “dok-dok” saat digigit menjadi asal-usul nama makanan ringan ini. Dorokdok sering dijadikan camilan atau pelengkap makanan seperti bakso, mie, atau nasi.

Secara sejarah, dorokdok berkembang dari kebiasaan masyarakat Garut memanfaatkan bagian kulit sapi yang tidak terpakai. Dengan teknik pengolahan tradisional, kulit sapi dibersihkan, direbus, dijemur, dan diproses hingga menjadi kerupuk yang tahan lama. Industri rumahan dorokdok kemudian tumbuh pesat, menjadikannya salah satu oleh-oleh paling terkenal dari Garut selain dodol. Kini dorokdok tersedia dalam berbagai varian, mulai dari yang original hingga pedas dan bawang.

Resep Dorokdok Sederhana

Bahan utama:
- Kulit sapi yang sudah dibersihkan
- Garam secukupnya
- Air untuk merebus
- Minyak untuk menggoreng

Cara membuat:
1. Cuci kulit sapi hingga bersih, kemudian rebus sampai empuk.
2. Potong kulit sesuai ukuran yang diinginkan.
3. Taburi garam dan jemur di bawah sinar matahari hingga benar-benar kering.
4. Panaskan minyak dalam jumlah banyak.
5. Goreng kulit yang sudah kering hingga mengembang dan berwarna keemasan.
6. Angkat dan tiriskan.
7. Sajikan atau simpan dalam wadah kedap udara agar tetap renyah.

Dorokdok menjadi salah satu camilan khas Garut yang digemari karena kerenyahan ekstremnya, rasa gurih alami, dan cocok dinikmati kapan saja.
''';

    case "Empal Gentong":
  return '''
Empal Gentong adalah makanan khas Cirebon yang terdiri dari potongan daging sapi, jeroan, dan kuah santan berbumbu rempah. Hidangan ini dimasak menggunakan gentong tanah liat, sehingga menghasilkan aroma smoky dan cita rasa yang lebih kaya. Kuahnya gurih dan berempah, sering disajikan dengan daun kucai dan sambal khas Cirebon untuk menambah kenikmatan.

Secara sejarah, Empal Gentong sudah ada sejak abad ke-19 dan awalnya disajikan dalam acara-acara adat dan kegiatan masyarakat. Penggunaan gentong tanah liat berasal dari tradisi memasak masyarakat Cirebon yang percaya bahwa wadah tersebut memberikan rasa lebih sedap. Seiring waktu, kuliner ini menjadi ikon kota Cirebon dan banyak dijual oleh pedagang kaki lima hingga rumah makan besar, menarik wisatawan lokal maupun mancanegara.

Resep Empal Gentong Sederhana

Bahan utama:
- 500 g daging sapi (bisa ditambah babat atau usus sesuai selera)
- 500 ml santan
- 2 batang serai (geprek)
- 2 lembar daun salam
- Daun kucai secukupnya

Bumbu halus:
- 6 siung bawang putih
- 8 siung bawang merah
- 4 butir kemiri
- 1 sdt ketumbar
- 1 ruas kunyit
- 1 ruas jahe
- Garam dan gula secukupnya

Cara membuat:
1. Rebus daging hingga empuk, kemudian potong kecil-kecil.
2. Tumis bumbu halus hingga harum, lalu masukkan ke dalam rebusan daging.
3. Tambahkan serai dan daun salam, masak hingga bumbu meresap.
4. Tuang santan dan aduk perlahan agar tidak pecah.
5. Masak dengan api kecil hingga kuah mengental dan berwarna kuning.
6. Sajikan dengan taburan daun kucai dan sambal.

Empal Gentong terkenal karena rasa gurihnya yang kaya rempah dan aroma khas dari proses memasak menggunakan gentong tanah liat.
''';

    case "Geco":
  return '''
Geco adalah makanan khas Cirebon yang merupakan singkatan dari "Toge dan Tauco". Hidangan ini terdiri dari campuran tauge yang disiram kuah tauco khas, ditambah bahan pelengkap seperti tahu, lontong, mie, dan kerupuk. Rasanya unik karena perpaduan gurih, asin, dan sedikit manis dari tauco yang difermentasi.

Secara sejarah, Geco berkembang dari kebiasaan masyarakat Cirebon yang memanfaatkan tauco sebagai bumbu utama dalam berbagai masakan. Tauco sendiri merupakan hasil pengaruh budaya Tionghoa yang kemudian diadaptasi oleh masyarakat setempat. Seiring waktu, Geco menjadi salah satu makanan sederhana yang populer dan dijual di warung-warung tradisional.

Resep Geco Sederhana

Bahan utama:
- Tauge rebus
- Tahu goreng
- Lontong atau ketupat
- Mie kuning
- Kerupuk

Bahan kuah tauco:
- 2 sdm tauco
- 3 siung bawang putih
- 3 siung bawang merah
- 1 sdm kecap manis
- Garam dan gula secukupnya
- Air secukupnya

Cara membuat:
1. Tumis bawang merah dan bawang putih hingga harum.
2. Masukkan tauco dan aduk rata.
3. Tuang air, beri kecap manis, garam, dan gula, lalu masak hingga mendidih.
4. Siapkan mangkuk berisi tauge, lontong, tahu, dan mie.
5. Siram dengan kuah tauco.
6. Tambahkan kerupuk sebelum disajikan.

Geco terkenal sebagai makanan sederhana yang memiliki cita rasa khas Cirebon dengan dominasi bumbu tauco yang unik.
''';

    case "Gemblong":
  return '''
Gemblong adalah camilan tradisional khas Jawa Barat yang terbuat dari adonan ketan yang digoreng, kemudian dilapisi gula merah cair. Teksturnya kenyal di dalam dan renyah di luar, dengan rasa manis khas gula merah yang menjadi ciri utamanya. Gemblong sering dijual sebagai jajanan pasar dan disukai berbagai kalangan karena rasanya yang sederhana namun memuaskan.

Secara sejarah, Gemblong sudah ada sejak masa kolonial sebagai jajanan rakyat yang dibuat dari bahan-bahan sederhana seperti tepung ketan dan gula. Makanan ini menjadi simbol kuliner tradisional masyarakat Sunda yang memanfaatkan bahan lokal dan teknik memasak sederhana. Hingga kini, Gemblong tetap populer dan sering ditemukan di pasar tradisional, warung kue, ataupun acara keluarga.

Resep Gemblong Sederhana

Bahan utama:
- 250 g tepung ketan putih
- 2 sdm tepung tapioka
- 150 ml santan hangat
- 1/2 sdt garam
- Minyak untuk menggoreng

Bahan lapisan gula:
- 150 g gula merah
- 50 ml air
- 1 lembar daun pandan

Cara membuat:
1. Campur tepung ketan, tepung tapioka, dan garam. Tambahkan santan hangat sedikit demi sedikit hingga adonan bisa dipulung.
2. Bentuk adonan lonjong atau sesuai selera.
3. Goreng dalam minyak panas hingga kecokelatan, lalu tiriskan.
4. Rebus gula merah, air, dan daun pandan hingga larut.
5. Masukkan gemblong goreng ke dalam larutan gula dan aduk hingga terlapisi merata.
6. Angkat dan biarkan mengering sebelum disajikan.

Gemblong terkenal sebagai jajanan tradisional yang manis, kenyal, dan sangat menggugah selera.
''';

    case "Ketan":
  return '''
Ketan adalah makanan tradisional yang terbuat dari beras ketan yang dimasak hingga memiliki tekstur pulen dan lengket. Ketan sering disajikan sebagai makanan ringan, hidangan pendamping, atau bagian dari berbagai kuliner Nusantara. Rasanya yang netral membuatnya cocok dipadukan dengan berbagai topping seperti kelapa parut, gula merah, oncom, hingga durian.

Secara sejarah, ketan sudah menjadi bagian penting dalam budaya pangan masyarakat Indonesia sejak masa kerajaan-kerajaan kuno. Beras ketan kerap digunakan dalam upacara adat, sesajen, dan acara keluarga karena dianggap simbol kebersamaan dan rezeki. Di Jawa Barat, ketan sering dijadikan hidangan khas seperti ketan bakar, ketan susu, ketan serundeng, dan ketan hitam manis.

Resep Ketan Kukus Sederhana

Bahan utama:
- 500 g beras ketan (putih atau hitam)
- 250 ml santan
- 1/2 sdt garam
- Daun pandan (opsional)

Cara membuat:
1. Cuci beras ketan dan rendam selama 2–3 jam.
2. Kukus ketan selama 20 menit hingga setengah matang.
3. Panaskan santan bersama garam dan daun pandan.
4. Siram santan ke ketan setengah matang, aduk rata.
5. Kukus kembali selama 20–30 menit hingga matang sempurna.
6. Sajikan dengan topping sesuai selera seperti kelapa, gula merah, atau serundeng.

Ketan dikenal sebagai makanan yang sederhana namun kaya makna budaya, serta menjadi bagian penting dari ragam kuliner Jawa Barat.
''';

    case "Nasi Liwet":
  return '''
Nasi Liwet adalah hidangan khas Jawa Barat yang dimasak menggunakan santan, bumbu aromatik, dan rempah-rempah sehingga menghasilkan nasi yang gurih dan harum. Biasanya dimasak dalam kastrol atau panci khusus, nasi liwet sering disajikan bersama lauk seperti ayam suwir, tahu, tempe, ikan asin, sambal, dan lalapan. Hidangan ini menjadi favorit di berbagai acara keluarga atau kegiatan kebersamaan.

Secara sejarah, Nasi Liwet sudah ada sejak masa kerajaan Sunda dan dikenal sebagai hidangan bergengsi dalam jamuan adat maupun acara besar. Nasi yang dimasak bersama santan dan rempah ini melambangkan rasa syukur dan kebersamaan. Tradisi membuat nasi liwet secara gotong royong masih lestari terutama di daerah pedesaan Jawa Barat, menjadikannya simbol kuliner yang kuat dalam budaya Sunda.

Resep Nasi Liwet Sederhana

Bahan utama:
- 500 g beras
- 400 ml santan
- 3 siung bawang putih (iris)
- 5 siung bawang merah (iris)
- 2 batang serai (geprek)
- 3 lembar daun salam
- 2 lembar daun jeruk
- Garam secukupnya
- Ikan teri atau ikan asin (opsional)

Cara membuat:
1. Cuci beras hingga bersih.
2. Tumis bawang merah dan bawang putih hingga harum.
3. Masukkan santan, serai, daun salam, dan daun jeruk.
4. Tambahkan garam dan biarkan mendidih.
5. Masukkan beras, aduk rata, lalu masak hingga santan terserap.
6. Saat setengah matang, kukus atau teruskan memasak hingga nasi pulen dan gurih.
7. Sajikan dengan lauk pendamping seperti ayam suwir, tempe, tahu, dan sambal.

Nasi Liwet terkenal karena aroma rempahnya yang kaya serta cita rasanya yang gurih, menjadikannya salah satu makanan paling khas dan digemari dari Jawa Barat.
''';

    case "Lontong Kari":
  return '''
Lontong Kari adalah hidangan khas Bandung yang terdiri dari lontong yang disajikan dengan kuah kari gurih berwarna kuning. Kuahnya terbuat dari santan dan bumbu rempah seperti kunyit, serai, dan ketumbar, kemudian dipadukan dengan potongan ayam atau daging sapi. Hidangan ini memiliki cita rasa gurih, hangat, dan aromatik, sehingga sangat digemari sebagai menu sarapan atau makan siang.

Secara sejarah, Lontong Kari merupakan hasil perpaduan kuliner Nusantara dan pengaruh budaya India melalui penggunaan rempah kari. Masyarakat Sunda kemudian mengadaptasi bumbu tersebut menjadi lebih ringan dan creamy, sehingga terciptalah lontong kari khas Bandung yang populer hingga sekarang. Makanan ini sering dijumpai di warung sarapan, pusat kuliner, hingga acara keluarga.

Resep Lontong Kari Sederhana

Bahan utama:
- Lontong siap saji
- 300 g ayam atau daging sapi
- 400 ml santan
- 2 batang serai (geprek)
- 3 lembar daun salam
- 2 lembar daun jeruk

Bumbu halus:
- 5 siung bawang putih
- 7 siung bawang merah
- 3 butir kemiri
- 1 ruas kunyit
- 1 ruas jahe
- 1 sdt ketumbar
- Garam dan gula secukupnya

Cara membuat:
1. Tumis bumbu halus hingga harum.
2. Masukkan serai, daun salam, dan daun jeruk.
3. Tambahkan ayam atau daging yang sudah dipotong, aduk hingga berubah warna.
4. Tuang santan dan masak dengan api kecil hingga bumbu meresap.
5. Siapkan potongan lontong dalam mangkuk.
6. Siram dengan kuah kari dan tambahkan pelengkap seperti bawang goreng atau sambal.

Lontong Kari dikenal sebagai makanan berkuah gurih rempah yang lembut dan hangat, menjadi salah satu kuliner paling khas dari kota Bandung.
''';

    case "Mie Kocok":
  return '''
Mie Kocok adalah kuliner khas Bandung yang terdiri dari mie kuning tebal yang disajikan dengan kuah kaldu sapi gurih. Dalam satu porsi mie kocok biasanya terdapat kikil sapi, tauge, bakso, dan taburan bawang goreng serta seledri. Nama "mie kocok" berasal dari teknik memasaknya, yaitu mie dan tauge yang dikocok dalam saringan sebelum disajikan.

Secara sejarah, Mie Kocok telah menjadi bagian dari kuliner Bandung sejak awal abad ke-20 dan berkembang dari usaha para pedagang kaki lima. Kuah kaldu sapi yang kaya rasa menjadi ciri khas kuliner ini, serta penggunaan kikil yang menambah tekstur kenyal. Kini, mie kocok menjadi salah satu hidangan ikonik yang banyak dicari wisatawan saat berkunjung ke Bandung.

Resep Mie Kocok Sederhana

Bahan utama:
- Mie kuning tebal
- 500 ml kaldu sapi
- 200 g kikil sapi (rebus hingga empuk)
- Tauge secukupnya
- Bakso (opsional)
- Bawang goreng dan seledri untuk taburan

Bumbu kuah:
- 4 siung bawang putih
- 6 siung bawang merah
- 1 sdt merica bubuk
- Garam dan gula secukupnya

Cara membuat:
1. Haluskan bawang putih dan bawang merah, lalu tumis hingga harum.
2. Masukkan bumbu tumis ke dalam kaldu sapi dan masak hingga mendidih.
3. Tambahkan garam, gula, dan merica.
4. Kocok mie dan tauge dalam saringan sebentar dengan air panas.
5. Letakkan mie dan tauge ke dalam mangkuk.
6. Tambahkan kikil dan bakso, lalu siram kuah kaldu panas.
7. Taburi dengan bawang goreng dan seledri.

Mie Kocok terkenal karena kuah kaldunya yang gurih dan kikilnya yang lembut, menjadikannya salah satu kuliner paling khas dan menggugah selera dari kota Bandung.
''';

    case "Misro":
  return '''
Misro adalah makanan khas Sunda yang dibuat dari parutan singkong yang dipadatkan dan diisi dengan gula merah. Nama "misro" merupakan singkatan dari “amis di jero” yang berarti “manis di dalam”. Makanan ini memiliki bentuk bulat atau lonjong dan digoreng hingga bagian luarnya renyah, sementara bagian dalamnya lumer karena gula merah yang meleleh.

Secara tradisional, misro banyak dijual sebagai jajanan pasar atau oleh pedagang gorengan keliling. Rasa manis alami dari gula merah dan tekstur singkong yang gurih membuat misro menjadi camilan yang populer di Jawa Barat.

Resep Misro Sederhana

Bahan utama:
- 500 g singkong, kupas dan parut
- 150 g gula merah, sisir halus
- ½ sdt garam
- Minyak untuk menggoreng

Cara membuat:
1. Peras sedikit air dari parutan singkong, lalu tambahkan garam dan aduk rata.
2. Ambil sedikit adonan singkong, pipihkan.
3. Isi dengan gula merah secukupnya, lalu bentuk menjadi bulat atau lonjong.
4. Panaskan minyak dan goreng hingga bagian luar kecokelatan.
5. Angkat dan tiriskan.

Misro memiliki perpaduan rasa gurih dan manis yang cocok sebagai camilan sore hari.
''';

    case "Nasi Jamblang":
  return '''
Nasi Jamblang adalah kuliner khas Cirebon yang terkenal dengan cara penyajiannya yang unik, yaitu menggunakan **bungkus daun jati**. Aroma daun jati yang khas menjadi daya tarik utama dari hidangan ini. Nasi Jamblang biasanya disajikan dengan berbagai lauk pauk yang bisa dipilih bebas, menjadikannya mirip konsep prasmanan.

Secara sejarah, Nasi Jamblang berasal dari daerah Jamblang, Kabupaten Cirebon. Pada masa kolonial Belanda, makanan ini dibuat untuk para pekerja yang membangun jalan Daendels sehingga porsinya besar dan tahan lama berkat bungkus daun jati yang menjaga nasi tetap pulen.

Pilihan lauk khas:
- Sambal goreng
- Telur dadar iris
- Semur hati atau daging
- Tahu dan tempe goreng
- Perkedel
- Cumi hitam
- Pepes
- Paru goreng
- Sate kentang
- Balakutak (cumi tinta hitam khas Cirebon)

Resep Nasi Jamblang Sederhana

Bahan utama:
- Nasi putih pulen
- Daun jati (untuk membungkus)
- Lauk sesuai selera (cumi hitam, sambal goreng, tahu, tempe, dll.)

Cara membuat:
1. Siapkan nasi hangat.
2. Ambil selembar daun jati, letakkan nasi di atas daun.
3. Pilih lauk yang ingin disajikan.
4. Sajikan bersama sambal dan bawang goreng.
5. Nasi Jamblang siap disantap!

Ciri khas utama Nasi Jamblang adalah **aroma daun jati**, pilihan lauk yang sangat beragam, dan rasa masakan Cirebon yang cenderung gurih dan sedikit manis.
''';

    case "Opak":
  return '''
Opak adalah camilan tradisional khas Sunda yang terbuat dari tepung beras, santan, dan bumbu sederhana seperti garam serta bawang. Rasanya gurih, teksturnya renyah, dan sering menjadi pendamping makanan utama seperti nasi liwet atau sekadar camilan sehari-hari. Opak biasanya berbentuk lingkaran tipis berwarna putih kekuningan.

Secara sejarah, opak sudah dikenal sejak lama di tanah Sunda sebagai makanan rumahan yang mudah dibuat dan awet disimpan. Banyak daerah di Jawa Barat memiliki versi opak masing-masing, seperti opak singkong, opak ketan, hingga opak biasa dari tepung beras. Di pedesaan, opak masih sering dijemur dan dipanggang menggunakan bara api tradisional.

Resep Opak Sederhana

Bahan utama:
- 250 g tepung beras
- 200 ml santan
- 2 siung bawang putih, haluskan
- Garam secukupnya
- Air secukupnya

Cara membuat:
1. Campurkan tepung beras, bawang putih, dan garam.
2. Tambahkan santan sedikit demi sedikit hingga adonan kalis dan bisa dipipihkan.
3. Ambil sedikit adonan, bentuk bulat lalu pipihkan tipis.
4. Jemur adonan hingga benar-benar kering.
5. Panggang atau goreng opak hingga mengembang dan renyah.
6. Sajikan sebagai camilan atau pendamping hidangan.

Opak dikenal sebagai camilan renyah khas Sunda yang sederhana namun selalu digemari karena rasanya yang gurih dan cocok dinikmati kapan saja.
''';

    case "Peuyeum":
  return '''
Peuyeum adalah makanan khas Sunda yang dibuat dari singkong yang difermentasi. Rasanya manis alami, sedikit asam, dan memiliki aroma khas hasil proses fermentasi. Teksturnya lembut, legit, dan sering dinikmati sebagai camilan maupun bahan olahan makanan dan minuman.

Secara sejarah, peuyeum telah menjadi bagian dari kuliner tradisional masyarakat Bandung dan sekitarnya. Sentra pembuatannya yang paling terkenal berada di daerah Cimenyan dan Kopo. Peuyeum awalnya dibuat sebagai cara masyarakat untuk mengawetkan singkong agar tidak mudah rusak. Seiring waktu, peuyeum menjadi oleh-oleh populer khas Bandung.

Resep Peuyeum Singkong

Bahan utama:
- 1 kg singkong
- Ragi tape (secukupnya)

Cara membuat:
1. Kupas dan cuci singkong hingga bersih.
2. Rebus singkong setengah matang, lalu tiriskan.
3. Biarkan singkong hingga benar-benar dingin.
4. Taburi ragi tape secara merata di seluruh permukaan singkong.
5. Susun singkong dalam wadah tertutup rapat.
6. Simpan selama 2–3 hari hingga proses fermentasi menghasilkan rasa manis dan tekstur lembut.
7. Peuyeum siap disajikan.

Peuyeum dikenal sebagai camilan tradisional yang manis, lembut, dan menjadi salah satu ikon kuliner khas Bandung yang sangat digemari.
''';

    case "Rengginang":
  return '''
Rengginang adalah camilan tradisional khas Nusantara yang terbuat dari beras ketan yang dibentuk bulat, kemudian dijemur hingga kering dan digoreng hingga mengembang. Rasanya gurih dengan tekstur renyah, membuatnya menjadi camilan favorit di berbagai daerah, termasuk Jawa Barat.

Secara sejarah, rengginang sudah dibuat sejak masa masyarakat agraris sebagai cara untuk memanfaatkan sisa nasi atau ketan agar tidak terbuang. Proses penjemuran membuatnya tahan lama sebelum akhirnya digoreng. Variasi rasa kemudian berkembang, seperti rengginang terasi, rengginang bawang, dan rengginang original.

Resep Rengginang Sederhana

Bahan utama:
- 500 g beras ketan
- 3 siung bawang putih, haluskan
- Garam secukupnya
- Air secukupnya
- Minyak goreng

Cara membuat:
1. Cuci beras ketan lalu rendam selama 2–3 jam.
2. Kukus ketan hingga setengah matang, lalu campurkan dengan bawang putih dan garam.
3. Kukus kembali hingga matang sempurna.
4. Bentuk ketan menjadi bulat pipih sesuai ukuran yang diinginkan.
5. Jemur di bawah sinar matahari hingga kering dan keras (biasanya 1–2 hari).
6. Goreng dalam minyak panas hingga mengembang dan renyah.
7. Sajikan selagi hangat atau simpan dalam wadah kedap udara.

Rengginang terkenal sebagai camilan gurih dan renyah yang sering disajikan pada hari raya, acara keluarga, atau dinikmati kapan saja.
''';

    case "Sate":
  return '''
Sate adalah salah satu kuliner paling populer di Indonesia yang terdiri dari potongan daging kecil-kecil yang ditusuk menggunakan bambu, kemudian dibakar di atas bara api. Sate biasanya disajikan dengan bumbu kacang, kecap manis, atau bumbu khas lainnya sesuai daerahnya. Aroma bakaran yang khas dan rasanya yang gurih menjadikan sate digemari oleh berbagai kalangan.

Secara sejarah, sate diperkirakan berkembang di Jawa pada abad ke-19 yang terpengaruh oleh teknik kebab dari pedagang Timur Tengah dan India. Seiring waktu, sate menyebar ke seluruh Indonesia dan melahirkan berbagai variasi, seperti sate ayam, sate kambing, sate madura, sate lilit Bali, hingga sate maranggi dari Jawa Barat. Setiap daerah memiliki ciri khas bumbu dan cara penyajian masing-masing.

Resep Sate Ayam Sederhana

Bahan utama:
- 500 g daging ayam, potong dadu
- Tusuk sate secukupnya

Bumbu marinasi:
- 3 siung bawang putih, haluskan
- 2 sdm kecap manis
- 1 sdm minyak
- Garam dan merica secukupnya

Bumbu kacang:
- 150 g kacang tanah goreng, haluskan
- 2 siung bawang putih
- 3 siung bawang merah
- 3 buah cabai merah (opsional)
- 2–3 sdm kecap manis
- Garam dan gula secukupnya
- Air panas secukupnya

Cara membuat:
1. Campurkan daging ayam dengan bumbu marinasi, lalu diamkan minimal 15–30 menit.
2. Tusuk potongan daging ke tusuk sate.
3. Haluskan bawang putih, bawang merah, dan cabai untuk bumbu kacang.
4. Campurkan bumbu halus dengan kacang tanah, beri kecap, garam, gula, lalu encerkan dengan air panas.
5. Bakar sate di atas bara api sambil diolesi kecap manis hingga harum dan matang.
6. Sajikan sate dengan bumbu kacang dan tambahan kecap manis.

Sate dikenal sebagai hidangan bakaran khas Indonesia yang kaya rasa, memiliki banyak variasi, dan selalu cocok dinikmati di berbagai suasana.
''';

    case "Surabi":
  return '''
Surabi adalah makanan tradisional khas Sunda yang terbuat dari adonan tepung beras dan santan yang dimasak di atas tungku tanah liat. Surabi memiliki tekstur lembut di bagian tengah dan sedikit renyah di bagian pinggirnya. Ada dua jenis surabi yang terkenal, yaitu surabi asin dan surabi manis, dengan berbagai topping seperti kinca gula merah, oncom, keju, cokelat, hingga durian.

Secara sejarah, surabi sudah ada sejak ratusan tahun lalu dan menjadi bagian dari budaya kuliner masyarakat Jawa Barat. Dahulu, surabi hanya dibuat dengan rasa sederhana seperti kinca dan oncom, namun seiring perkembangan zaman, banyak inovasi topping modern yang membuat surabi semakin populer, terutama di Bandung dan sekitarnya.

Resep Surabi Sederhana

Bahan utama:
- 250 g tepung beras
- 200 ml santan kental
- 300 ml air
- 1/2 sdt garam
- 1/2 sdt ragi instan (opsional untuk tekstur lebih lembut)

Topping kinca gula merah:
- 150 g gula merah
- 150 ml santan
- 1 lembar daun pandan
- Sejumput garam

Cara membuat:
1. Campurkan tepung beras, santan, air, garam, dan ragi (jika digunakan). Aduk hingga tidak ada yang bergerindil.
2. Diamkan adonan 20–30 menit.
3. Panaskan wajan kecil atau cetakan surabi tradisional.
4. Tuang adonan sedikit demi sedikit hingga membentuk surabi.
5. Masak dengan api kecil hingga bagian pinggir mengering dan bagian tengah matang.
6. Untuk topping kinca, rebus gula merah, santan, dan daun pandan hingga mengental.
7. Siram surabi dengan kinca atau pilih topping sesuai selera.

Surabi dikenal sebagai jajanan khas Sunda yang sederhana tetapi memiliki cita rasa autentik, cocok dinikmati hangat-hangat pada pagi atau sore hari.
''';

    case "Tahu Gejrot":
  return '''
Tahu Gejrot adalah jajanan khas Cirebon yang terdiri dari tahu garing yang dipotong kecil-kecil dan disiram dengan kuah pedas manis asam. Kuahnya terbuat dari campuran gula merah, bawang, cabai rawit, dan cuka yang memberikan cita rasa segar dan menggugah selera. Biasanya makanan ini disajikan dalam cobek kecil dari tanah liat untuk menambah cita rasa tradisionalnya.

Secara sejarah, Tahu Gejrot mulai dikenal di daerah Cirebon sejak berkembangnya industri tahu setempat. Para penjual menciptakan cara unik untuk menyajikan tahu goreng dengan kuah bumbu yang diulek kasar, sehingga memberikan sensasi pedas dan segar yang langsung "ngejrot" di mulut, dari situlah asal nama “gejrot”.

Resep Tahu Gejrot Sederhana

Bahan utama:
- 6–8 potong tahu pong atau tahu sumedang
- Minyak goreng secukupnya

Bahan kuah:
- 100 g gula merah
- 200 ml air
- 1 sdm kecap asin (opsional)
- 1 sdm cuka atau air asam jawa
- Garam secukupnya

Bumbu ulek kasar:
- 3 siung bawang merah
- 1 siung bawang putih
- 3–6 cabai rawit (sesuai selera)

Cara membuat:
1. Goreng tahu hingga garing, lalu potong kecil-kecil.
2. Rebus gula merah bersama air hingga larut, lalu masukkan cuka atau asam jawa.
3. Tambahkan garam dan kecap asin bila suka.
4. Ulek kasar bawang merah, bawang putih, dan cabai rawit.
5. Campurkan bumbu ulek ke dalam kuah, aduk hingga rata.
6. Siram tahu yang sudah dipotong dengan kuah bumbu.
7. Sajikan segera untuk rasa yang lebih segar dan nikmat.

Tahu Gejrot terkenal dengan sensasi kuahnya yang pedas, manis, dan asam yang menyatu sempurna, menjadikannya salah satu jajanan paling populer dari Cirebon, Jawa Barat.
''';

    case "Tahu Sumedang":
  return '''
Tahu Sumedang adalah tahu goreng khas dari Kabupaten Sumedang, Jawa Barat. Ciri khasnya terletak pada teksturnya yang renyah di luar namun kopong dan lembut di dalam. Rasanya gurih alami meski tanpa banyak bumbu tambahan, sehingga cocok disantap sebagai camilan maupun pendamping makanan.

Secara sejarah, Tahu Sumedang mulai dibuat pada awal abad ke-20 oleh seorang perantau asal Tiongkok bernama Ong Kino, yang bereksperimen dengan proses pembuatan tahu menggunakan air Sumedang yang terkenal bersih dan berkualitas. Kualitas air inilah yang membuat tahu Sumedang memiliki tekstur dan rasa khas yang tidak mudah ditiru daerah lain. Seiring waktu, tahu ini menyebar luas dan menjadi ikon kuliner Sumedang.

Resep Tahu Sumedang Sederhana

Bahan utama:
- Tahu putih (khususnya jenis yang bertekstur kopong bila digoreng)
- Minyak goreng secukupnya

Bumbu (opsional):
- Garam
- Bawang putih halus

Cara membuat:
1. Potong tahu sesuai selera, lalu taburi sedikit garam atau bumbu bawang putih bila ingin rasa lebih gurih.
2. Panaskan minyak dalam jumlah banyak.
3. Goreng tahu hingga kulit luar berubah kecokelatan dan terasa renyah.
4. Angkat dan tiriskan minyaknya.
5. Sajikan selagi hangat, biasanya dengan cabai rawit sebagai pelengkap.

Tahu Sumedang terkenal sebagai camilan sederhana namun sangat khas, dengan rasa gurih renyah yang menjadikannya salah satu kuliner legendaris dari Jawa Barat.
''';

    case "Bandrek":
  return '''
Bandrek adalah minuman tradisional khas Sunda yang dibuat dari campuran jahe, gula merah, dan rempah-rempah. Minuman ini memiliki rasa pedas hangat yang menenangkan, sangat cocok dinikmati saat cuaca dingin atau hujan. Bandrek juga dipercaya dapat membantu menghangatkan tubuh dan menjaga stamina.

Secara sejarah, Bandrek sudah menjadi bagian dari kehidupan masyarakat Sunda sejak zaman dahulu, terutama di daerah dataran tinggi yang memiliki udara sejuk. Minuman ini berkembang dari tradisi masyarakat yang menggunakan rempah-rempah lokal sebagai penghangat tubuh. Variasi bandrek juga bermunculan, seperti bandrek susu atau bandrek dengan tambahan kelapa serut.

Resep Bandrek Tradisional

Bahan utama:
- 3 ruas jahe (memarkan)
- 150 g gula merah
- 500 ml air
- 2 lembar daun pandan (opsional)

Rempah tambahan (opsional):
- 1 batang serai (memarkan)
- 2 butir cengkih
- 1 batang kayu manis
- Susu kental manis bila ingin versi bandrek susu

Cara membuat:
1. Rebus air bersama jahe hingga aromanya keluar.
2. Masukkan gula merah, daun pandan, dan rempah-rempah lainnya.
3. Masak hingga gula larut dan kuahnya harum.
4. Saring dan tuang ke dalam gelas.
5. Tambahkan susu bila ingin rasa lebih creamy.
6. Sajikan selagi panas.

Bandrek dikenal sebagai minuman penghangat tubuh yang kaya aroma rempah, menjadikannya salah satu minuman tradisional paling populer di Jawa Barat.
''';

    case "Es Goyobod":
  return '''
Es Goyobod adalah minuman segar khas Sunda yang terbuat dari campuran goyobod (jelly tepung aren), santan, gula merah cair, dan es serut. Rasanya manis, segar, dan memiliki tekstur kenyal yang menjadi ciri khasnya. Biasanya es goyobod juga ditambah potongan alpukat, roti tawar, atau kolang-kaling.

Secara sejarah, Es Goyobod berasal dari wilayah Priangan, terutama Bandung dan Garut. Minuman ini sudah ada sejak masa kolonial dan awalnya dibuat sebagai hidangan manis yang sederhana menggunakan bahan-bahan lokal. Nama "goyobod" merujuk pada teksturnya yang lembut dan kenyal, mirip dengan kue-kue tradisional berbahan tepung aren.

Resep Es Goyobod Sederhana

Bahan utama:
- 100 g tepung aren atau tepung hunkwe
- 500 ml air
- 100 g gula pasir
- Pewarna makanan merah atau hijau (opsional)

Bahan pelengkap:
- Santan matang secukupnya
- Gula merah cair
- Es serut atau es batu
- Kolang-kaling (opsional)
- Alpukat atau roti tawar sesuai selera

Cara membuat:
1. Campurkan tepung aren, air, dan gula, lalu masak sambil diaduk hingga mengental.
2. Masukkan pewarna bila ingin warna lebih menarik.
3. Tuang ke cetakan, biarkan dingin, lalu potong kecil-kecil sebagai goyobod.
4. Siapkan mangkuk atau gelas.
5. Masukkan potongan goyobod, kolang-kaling, dan buah bila menggunakan.
6. Tuang santan dan gula merah cair.
7. Tambahkan es serut hingga penuh.
8. Sajikan segera selagi dingin dan segar.

Es Goyobod terkenal sebagai minuman tradisional yang menyegarkan, cocok dinikmati saat cuaca panas dan menjadi salah satu minuman khas Sunda yang populer.
''';

    case "Es Cendol":
  return '''
Es Cendol adalah minuman tradisional khas Sunda yang terbuat dari cendol berbahan tepung beras, disajikan dengan santan dan gula merah cair. Rasanya manis, segar, dan memiliki tekstur kenyal lembut. Di beberapa daerah, minuman ini juga dikenal sebagai "cendol dawet". Es Cendol menjadi salah satu minuman paling populer di Indonesia, terutama saat cuaca panas atau bulan Ramadan.

Secara sejarah, Es Cendol berasal dari wilayah Jawa Barat, terutama Bandung. Namanya berasal dari bahasa Sunda "cendol" yang merujuk pada butiran hijau kenyal yang berbentuk memanjang. Warna hijau klasiknya berasal dari daun pandan atau daun suji, yang memberikan aroma khas dan warna alami. Seiring waktu, Es Cendol menjadi kuliner nasional dan dikenal hingga mancanegara.

Resep Es Cendol Tradisional

Bahan cendol:
- 100 g tepung beras
- 50 g tepung tapioka
- 600 ml air
- 1 sdt pasta atau sari daun pandan
- Sejumput garam

Bahan pelengkap:
- 500 ml santan matang (rebus dengan sedikit garam)
- Gula merah cair secukupnya
- Es batu atau es serut

Cara membuat cendol:
1. Campurkan tepung beras, tepung tapioka, air, garam, dan pandan dalam panci.
2. Masak sambil diaduk hingga mengental dan menjadi adonan licin.
3. Siapkan baskom berisi air es.
4. Tekan adonan cendol melalui saringan berlubang besar ke dalam air es hingga membentuk butiran cendol.
5. Tiriskan.

Cara penyajian:
1. Masukkan cendol ke dalam gelas atau mangkuk.
2. Tambahkan gula merah cair sesuai selera.
3. Tuang santan matang.
4. Tambahkan es batu atau es serut.
5. Sajikan selagi dingin untuk kesegaran maksimal.

Es Cendol dikenal dengan rasa manis dan segarnya, menjadikannya salah satu minuman tradisional paling ikonik dari Jawa Barat.
''';

    case "Es Doger":
  return '''
Es Doger adalah minuman tradisional khas Sunda yang biasanya disajikan dingin, terbuat dari campuran santan, susu, tape singkong, kolang-kaling, dan serutan es. Rasanya manis, creamy, dan segar, sering menjadi minuman favorit saat cuaca panas atau untuk sajian saat acara keluarga dan perayaan tradisional.

Secara sejarah, Es Doger berasal dari Bandung dan sekitarnya. Nama “Doger” konon berasal dari kata “dodol gerimis” karena awalnya minuman ini muncul sebagai camilan manis saat hujan. Minuman ini populer di kalangan masyarakat sejak lama karena rasa manisnya yang khas, perpaduan tekstur lembut dan kenyal dari berbagai bahan, serta aroma santan yang harum.

Resep Es Doger Sederhana

Bahan utama:
- 200 g tape singkong
- 100 g kolang-kaling, potong kecil
- 200 ml santan matang
- 50 ml susu kental manis
- 2 sdm sirup merah atau gula merah cair
- Es batu serut secukupnya

Bahan tambahan (opsional):
- Alpukat, nangka, cincau, atau roti tawar potong dadu

Cara membuat:
1. Siapkan gelas atau mangkuk saji.
2. Masukkan tape singkong, kolang-kaling, dan bahan tambahan jika digunakan.
3. Tuang santan dan susu kental manis, aduk rata.
4. Tambahkan sirup merah atau gula merah cair sesuai selera.
5. Tambahkan es serut hingga penuh.
6. Sajikan segera selagi dingin.

Es Doger terkenal dengan kombinasi rasa manis, gurih, dan segar, menjadikannya salah satu minuman khas Sunda yang menyenangkan untuk dinikmati kapan saja.
''';

    case "Es Pala":
  return '''
Es Pala adalah minuman tradisional khas Sunda yang terkenal dengan rasa manis dan aroma rempah pala yang khas. Biasanya disajikan dingin dengan tambahan es serut atau es batu, santan, sirup, dan potongan buah atau kolang-kaling. Minuman ini sangat menyegarkan, cocok untuk dinikmati saat cuaca panas.

Secara sejarah, Es Pala berasal dari daerah Priangan, Jawa Barat. Pala merupakan rempah yang telah dikenal di Nusantara sejak zaman kolonial sebagai bahan minuman dan masakan. Minuman ini kemudian berkembang sebagai minuman khas rakyat Sunda, dengan resep sederhana namun memberikan rasa dan aroma yang khas.

Resep Es Pala Sederhana

Bahan utama:
- 500 ml air matang
- 100 ml santan kental
- 50 g gula merah, larutkan
- 1 sdt bubuk pala atau ½ sdt pala parut segar
- Es serut secukupnya
- Kolang-kaling atau potongan buah (opsional)

Cara membuat:
1. Larutkan gula merah dalam air hangat, tambahkan bubuk atau parutan pala.
2. Masukkan santan, aduk rata.
3. Siapkan gelas, tambahkan es serut atau es batu.
4. Tuang campuran minuman ke dalam gelas.
5. Tambahkan kolang-kaling atau potongan buah bila suka.
6. Sajikan segera agar tetap segar.

Es Pala dikenal dengan aroma pala yang hangat dan manisnya yang seimbang, menjadikannya minuman tradisional Sunda yang unik dan menyegarkan.
''';

    case "Es Oyen":
  return '''
Es Oyen adalah minuman segar khas Sunda yang populer di Bandung dan sekitarnya. Minuman ini terdiri dari campuran potongan buah, agar-agar, kolang-kaling, cincau, dan sirup manis, disajikan dengan es serut atau es batu. Rasanya manis, segar, dan memiliki tekstur kenyal dari berbagai bahan tambahan.

Secara sejarah, Es Oyen muncul sebagai salah satu minuman rakyat Sunda yang mudah dibuat dari bahan-bahan lokal. Nama “Oyen” berasal dari warna merah muda khas sirup yang sering digunakan. Minuman ini banyak dijual di pedagang kaki lima dan menjadi favorit masyarakat terutama saat cuaca panas atau bulan Ramadan.

Resep Es Oyen Sederhana

Bahan utama:
- 50 g cincau hitam, potong dadu
- 50 g kolang-kaling, rebus dan tiriskan
- 50 g agar-agar merah atau jelly, potong dadu
- 1 buah alpukat matang, potong dadu (opsional)
- Sirup merah secukupnya
- Susu kental manis secukupnya
- Es serut atau es batu secukupnya

Cara membuat:
1. Siapkan gelas saji, masukkan semua potongan buah dan agar-agar.
2. Tambahkan kolang-kaling dan es serut.
3. Tuang sirup merah dan susu kental manis sesuai selera.
4. Aduk perlahan agar semua bahan tercampur rata.
5. Sajikan segera untuk sensasi segar maksimal.

Es Oyen dikenal dengan perpaduan rasa manis, segar, dan tekstur kenyal, menjadikannya salah satu minuman tradisional Sunda yang paling digemari.
''';

    case "Es Cincau":
  return '''
Es Cincau adalah minuman tradisional khas Sunda yang menyegarkan, terbuat dari cincau hijau atau cincau hitam, disajikan dengan santan, gula merah cair, atau sirup manis, serta es serut atau es batu. Rasanya manis, segar, dan memiliki tekstur kenyal dari cincau yang khas.

Secara sejarah, cincau telah dikenal luas di Nusantara sebagai bahan minuman sehat karena dipercaya memiliki efek pendingin tubuh. Di Jawa Barat, Es Cincau menjadi minuman populer, terutama di daerah Priangan. Minuman ini mudah dibuat, ekonomis, dan sering dijual sebagai minuman kaki lima maupun di pasar tradisional.

Resep Es Cincau Sederhana

Bahan utama:
- 100 g cincau hijau atau hitam, potong dadu
- 200 ml santan matang (rebus dengan sedikit garam)
- 100 ml gula merah cair atau sirup gula
- Es serut atau es batu secukupnya

Cara membuat:
1. Siapkan gelas saji, masukkan potongan cincau.
2. Tambahkan es serut atau es batu.
3. Tuang santan dan gula merah cair atau sirup sesuai selera.
4. Aduk perlahan agar semua bahan tercampur.
5. Sajikan segera untuk sensasi dingin dan menyegarkan.

Es Cincau terkenal sebagai minuman tradisional yang menyegarkan, manis, dan memiliki tekstur kenyal yang khas, cocok dinikmati kapan saja, terutama saat cuaca panas.
''';

    case "Bir Kotjok":
  return '''
Bir Kotjok adalah minuman tradisional khas Sunda yang terbuat dari campuran tape singkong, gula aren, santan, dan es serut. Meskipun namanya “bir”, minuman ini tidak mengandung alkohol. Rasanya manis, creamy, dan sedikit asam dari tape singkong, sangat menyegarkan ketika dinikmati dingin.

Secara sejarah, Bir Kotjok berasal dari Bandung dan sekitarnya. Minuman ini populer sebagai minuman rakyat yang sederhana namun nikmat, terutama di musim panas atau untuk sajian di pasar tradisional. Nama “Kotjok” konon berasal dari suara saat minuman diaduk atau digoyang sebelum disajikan.

Resep Bir Kotjok Sederhana

Bahan utama:
- 100 g tape singkong, hancurkan kasar
- 200 ml santan matang
- 2–3 sdm gula aren cair atau gula merah
- Es serut atau es batu secukupnya
- Susu kental manis (opsional)

Cara membuat:
1. Siapkan gelas saji, masukkan tape singkong.
2. Tambahkan es serut atau es batu.
3. Tuang santan dan gula aren cair, aduk hingga merata.
4. Tambahkan susu kental manis bila ingin rasa lebih creamy.
5. Sajikan segera selagi dingin.

Bir Kotjok dikenal sebagai minuman segar khas Sunda yang manis, creamy, dan memiliki aroma tape singkong yang khas, cocok dinikmati kapan saja.
''';

    case "Es Ciming":
  return '''
Es Ciming adalah minuman tradisional khas Sunda yang menyegarkan, terbuat dari campuran cincau hitam, sirup manis, santan, dan es serut. Rasanya manis, segar, dan memiliki tekstur kenyal dari cincau yang menjadi ciri khas minuman ini. Es Ciming sering dinikmati saat cuaca panas atau sebagai minuman pelengkap saat bersantai.

Secara sejarah, Es Ciming berasal dari Bandung dan daerah sekitarnya, sebagai variasi dari minuman cincau tradisional yang mudah dibuat dan menyegarkan. Nama "Ciming" kemungkinan berasal dari bahasa Sunda yang mengacu pada kesegaran minuman ini. Minuman ini populer di pedagang kaki lima dan pasar tradisional, menjadi favorit masyarakat lokal.

Resep Es Ciming Sederhana

Bahan utama:
- 100 g cincau hitam, potong dadu
- 200 ml santan matang
- 50 ml sirup gula merah atau sirup merah
- Es serut atau es batu secukupnya
- Kolang-kaling atau potongan buah (opsional)

Cara membuat:
1. Siapkan gelas saji, masukkan cincau hitam.
2. Tambahkan es serut atau es batu.
3. Tuang santan dan sirup gula merah, aduk rata.
4. Tambahkan kolang-kaling atau potongan buah bila diinginkan.
5. Sajikan segera agar tetap segar dan nikmat.

Es Ciming dikenal sebagai minuman segar khas Sunda dengan perpaduan rasa manis dan tekstur kenyal dari cincau, cocok untuk dinikmati kapan saja.
''';

    
    default:
      return "Kuliner khas Jawa Barat.";
  }
}
