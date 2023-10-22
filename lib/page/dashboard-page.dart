// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:manekin/data/SensorData.dart';
import 'package:manekin/page/livescreen/live_screen.dart';
import 'package:manekin/page/rekrutmen/rekrutmen.dart';
import 'package:manekin/helper/custom.card.dart';
import 'package:manekin/helper/custom_appbar.dart';

import 'package:manekin/helper/custom_icon.dart';
// ignore: unused_import
import 'package:asset_cache/asset_cache.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:manekin/page/informasi_sensor/sensor_tile.dart';

import 'package:manekin/page/profile/profil_tile.dart';
import 'package:manekin/page/tentang_kami/about_us.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../helper/custom_modal.dart';

class MyDashBoard extends StatefulWidget {
  const MyDashBoard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyDashBoardState createState() => _MyDashBoardState();
}

class _MyDashBoardState extends State<MyDashBoard> {
  // ignore: non_constant_identifier_names
  List<SensorData> Datalist = [];

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() {
    List<SensorData> listTemp = [];
    listTemp.add(SensorData(
        icon: Icons.handshake_rounded,
        title: "Sensor 1",
        iconColor: Colors.white,
        value: 30));
    listTemp.add(SensorData(
        icon: Icons.handshake_rounded,
        title: "Sensor 2",
        iconColor: Colors.white,
        value: 30));
    listTemp.add(SensorData(
        icon: Icons.handshake_rounded,
        title: "Sensor 3",
        iconColor: Colors.white,
        value: 30));
    listTemp.add(SensorData(
        icon: Icons.handshake_rounded,
        title: "Sensor 4",
        iconColor: Colors.white,
        value: 30));
    listTemp.add(SensorData(
        icon: Icons.handshake_rounded,
        title: "Sensor 5",
        iconColor: Colors.white,
        value: 30));

    setState(() {
      Datalist = listTemp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar("Dashboard"),
      body: SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/waves.png'), fit: BoxFit.fitHeight),
            ),
            child: body()),
      ),
    );
  }

  Widget body() {
    return ListView(
      children: [
        imageSlider(),
        middleIcons(),
        const SizedBox(
          height: 20,
        ),
        bottomBody(),
        const SizedBox(
          height: 35,
        ),
        MyFooter(),
      ],
    );
  }

  Widget imageSlider() {
    return ImageSlideshow(
      width: MediaQuery.of(context).size.width,
      autoPlayInterval: 5000,
      height: 180,
      isLoop: true,
      children: const [
        Image(
          image: AssetImage('assets/2.png'),
          fit: BoxFit.fitWidth,
        ),
        Image(
          image: AssetImage('assets/1.png'),
          fit: BoxFit.fitWidth,
        ),
        Image(
          image: AssetImage('assets/3.png'),
          fit: BoxFit.fitWidth,
        ),
        Image(
          image: AssetImage('assets/4.png'),
          fit: BoxFit.fitWidth,
        ),
      ],
    );
  }

  Widget middleIcons() {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      height: 170,
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        childAspectRatio: 3 / 2,
        crossAxisCount: 3,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        children: [
          custom_icon(Icons.monitor_heart, "LIVESCREEN", 20, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LiveScreen()),
            );
          }),
          custom_icon(Icons.person_2, "Profile Member", 20, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilTile()),
            );
          }),
          custom_icon(Icons.on_device_training_outlined, "Informasi Sensor", 20,
              () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SensorTile()),
            );
          }),
          custom_icon(Icons.info_outline, "Tentang Kami", 20, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TentangKami()),
            );
          }),
          custom_icon(Icons.person_add_alt_1, "Rekrutmen", 20, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Rekrutmen()),
            );
          }),
          custom_icon(Icons.phone, "Contact Person", 20, () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return CustomModal(
                    title: 'Contact Person',
                    content: Column(
                      children: [
                        Container(
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(MdiIcons.whatsapp, color: Colors.white),
                              const Text(
                                '081234567890',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 200,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.purple,
                                Colors.pink,
                                Colors.orange,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(MdiIcons.instagram, color: Colors.white),
                              const Text(
                                '@STAS-RG JAYA MANDIRI',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    actions: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the modal
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                      child: const Text('Close'),
                    ),
                  );
                });
          }),
        ],
      ),
    );
  }

  Widget bottomBody() {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LiveScreen()),
                  );
                },
                child: const Text(
                  "Lihat Semua",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CarouselSlider.builder(
              itemCount: Datalist.length,
              options: CarouselOptions(
                viewportFraction: 0.6,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
              itemBuilder: (BuildContext context, int index, int realIndex) {
                final data = Datalist[index];
                return CustomCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LiveScreen()),
                    );
                  },
                  icon: data.icon,
                  title: data.title,
                  iconColor: data.iconColor,
                  value: data.value,
                  isWithIcon: true,
                );
              },
            ),
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget MyFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      color: Colors.grey[700],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Copyright ©2020, All Rights Reserved.',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12.0,
                    color: Colors.white),
              ),
              Text(
                'Powered by STAS-RG',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12.0,
                    color: Colors.white),
              ),
            ],
          ),
          Column(
            children: [
              Image.asset(
                'assets/pindad.png',
                scale: 16,
              ),
              Image.asset(
                'assets/logo-rg.png',
                scale: 16,
              )
            ],
          )
        ],
      ),
    );
  }
}
