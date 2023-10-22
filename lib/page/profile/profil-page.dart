// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:manekin/data/Profil_Data.dart';

class MyProfilPage extends StatefulWidget {
  final ProfilData profilData;
  const MyProfilPage({super.key, required this.profilData});

  @override
  State<MyProfilPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyProfilPage> {
  final double coverHeight = 290;
  final double profileHeight = 144;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _buildTop(),
          _buildBottom(),
        ],
      ),
    );
  }

  Widget _buildTop() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: profileHeight / 2),
          child: Stack(
            children: [
              _buildCoverImage(),
              Positioned(
                top: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green[100],
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        // navigation.back
                        Navigator.pop(context);
                      },
                      color: Colors.black,
                      iconSize: 30.0,
                      tooltip: 'Go back',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: coverHeight - profileHeight / 2,
          child: _buildProfileImage(),
        )
      ],
    );
  }

  Widget _buildCoverImage() {
    return Image(
      image: const AssetImage("assets/profil-bg2.jpg"),
      fit: BoxFit.cover,
      width: double.infinity,
      height: coverHeight,
    );
  }

  Widget _buildProfileImage() {
    return CircleAvatar(
      radius: 80,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: profileHeight / 2,
        backgroundImage: AssetImage(widget.profilData.image),
      ),
    );
  }

  Widget _buildBottom() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(children: [
        Center(
          child: Text(
            widget.profilData.title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Vogue"),
            textAlign: TextAlign.center,
          ),
        ),

        Text(
          widget.profilData.subtitle,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.grey,
              fontFamily: "Vogue"),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 5),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.green[700],
                    borderRadius: BorderRadius.circular(80)),
                child: const Icon(
                  Icons.facebook,
                  color: Colors.white,
                  size: 34,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 5),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.green[700],
                    borderRadius: BorderRadius.circular(80)),
                child: const Icon(
                  Icons.email,
                  color: Colors.white,
                  size: 34,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 5),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.green[700],
                    borderRadius: BorderRadius.circular(80)),
                child: const Icon(
                  Icons.phone,
                  color: Colors.white,
                  size: 34,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.grey,
          height: 50,
          thickness: 1,
          indent: 20,
          endIndent: 20,
        ),

        //Buat tentang ku

        Container(
          margin: const EdgeInsets.only(top: 10),
          child: const Text(
            "Tentang Ku",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Vogue"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontFamily: "BebasNeueR",
                wordSpacing: 0,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ]),
    );
  }
}
