import 'package:flutter/material.dart';
import 'package:manekin/helper/custom_appbar.dart';
import 'package:manekin/helper/custom_tile.dart';

import '../../data/Profil_Data.dart';

class ProfilTile extends StatefulWidget {
  const ProfilTile({super.key});

  @override
  State<ProfilTile> createState() => _ProfilTileState();
}

class _ProfilTileState extends State<ProfilTile> {
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
        title: "GIVA ANDRIANA MUTIARA S.T., M.T., Ph.D.",
        subtitle: "DOSEN PEMBIMBING 2",
        image: "assets/buGiva.jpg"));
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
      appBar: CustomAppbar("Profil Member"),
      body: ListView.separated(
        itemCount: listProfilData.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          final data = listProfilData[index];

          return CustomTile(
            title: data.title,
            subtitle: data.subtitle,
            image: data.image,
            profilData: data,
          );
        },
      ),
    );
  }
}
