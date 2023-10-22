// ignore_for_file: non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:manekin/data/Profil_Data.dart';

import '../../helper/custom_appbar.dart';

class TentangKami extends StatefulWidget {
  const TentangKami({Key? key}) : super(key: key);

  @override
  _TentangKamiState createState() => _TentangKamiState();
}

class _TentangKamiState extends State<TentangKami> {
  List<ProfilData> listProfilData = [];

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() {
    List<ProfilData> listTemp = [];
    listTemp.add(ProfilData(
        title: "Muhammad Rizqy Alfarisi S.T., M.T.",
        subtitle: "DOSEN PEMBIMBING 1",
        image: "assets/pakAlfa.jpg"));
    listTemp.add(ProfilData(
        title: "WILDAN MUHAMMAD YASIN FADILAH A.Md",
        subtitle: "Angkatan 2020",
        image: "assets/wildan.png"));
    listTemp.add(ProfilData(
        title: "Muhammad Ghifar Rizali A.Md",
        subtitle: "Angkatan 2020",
        image: "assets/ghifar.png"));
    listTemp.add(ProfilData(
        title: "Bauz Dinanta A.Md",
        subtitle: "Angkatan 2020",
        image: "assets/bauz.jpg"));
    listTemp.add(ProfilData(
        title: "Andika Fahrezi A.Md",
        subtitle: "Angkatan 2020",
        image: "assets/dika.png"));
    listTemp.add(ProfilData(
        title: "ICHLASUL AMAL RESTU WARDANA A.Md",
        subtitle: "Angkatan 2020",
        image: "assets/ichlasul.png"));
    listTemp.add(ProfilData(
        title: "FAUZI ISHAK A.Md",
        subtitle: "Angkatan 2020",
        image: "assets/fauzi.jpg"));
    listTemp.add(ProfilData(
        title: "FATHURROHMAN NUR ROCHIM",
        subtitle: "Angkatan 2020",
        image: "assets/profil.png"));

    setState(() {
      listProfilData = listTemp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar('Tentang Kami'),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            pinned: true,
            centerTitle: false,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 2,
              background: Image(
                image: AssetImage('assets/cover-rg-01.png'),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
                repeat: ImageRepeat.noRepeat,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      VisiMisi(),
                    ],
                  ),
                ),
                Leader(),
                SizedBox(
                  height: 40,
                ),
                OurMember()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget VisiMisi() {
    return Column(
      children: [
        Center(
          child: Text('VISI',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Vogue")),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[300],
          ),
          padding: const EdgeInsets.all(15),
          child: Text(
            'Membentuk Research Group Unggulan Vokasi yang berbasis kerja sama, berwawasan global dan berkesinambungan untuk civitas akamedemika yaitu dosen dan mahasiswa Telkom University umumnya dan Fakultas Ilmu Terapan khususnya.',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Text('MISI',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Vogue")),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[300],
          ),
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Text(
                '1. Melakukan kolaborasi penelitian yang terintergrasi untuk civitas akademika yang ada di prodi dan fakultas - fakultas di Telkom University.',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '2. Membuat dan mengambangkan kegitan penelitian yang dapat dimanfaatkan oleh masyarakat melalui program -program pengabdian masyarakat.',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                textAlign: TextAlign.justify,
              ),
              Text(
                '3. Membuat dan mengembangkan kegitan penelitan yang di kolaborasikan dengan keperluan industri. ',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget OurMember() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              'Our Member',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Vogue',
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              textAlign: TextAlign.start,
            ),
          ),
          CarouselSlider.builder(
            itemCount: listProfilData.length,
            options: CarouselOptions(
              aspectRatio: 3,
              viewportFraction: 0.4,
              initialPage: 0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 2),
              enableInfiniteScroll: true,
              reverse: false,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
            itemBuilder: (BuildContext context, int index, int realIndex) {
              final data = listProfilData[index];
              return Card(
                child: Image.asset(
                  data.image,
                  fit: BoxFit.cover,
                  scale: 4,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Leader extends StatelessWidget {
  const Leader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'assets/buGiva.jpg',
                  scale: 2,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            'Our Leader',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Vogue',
                fontWeight: FontWeight.bold,
                fontSize: 20),
            textAlign: TextAlign.start,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            'Giva Andriana Mutiara S.T., M.T., Ph.D.',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
            textAlign: TextAlign.start,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            'Lorem ipsum dolor sit amet, cons ',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 12),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
