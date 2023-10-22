import "package:flutter/material.dart";
import "package:manekin/data/Profil_Data.dart";

import "../page/profile/profil-page.dart";

class CustomTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final ProfilData profilData;

  const CustomTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.image,
      required this.profilData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.green[700],
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey[700],
            backgroundImage: AssetImage(image),
          )),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
      subtitle: Text(subtitle),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyProfilPage(profilData: profilData)),
        );
      },
    );
  }
}
