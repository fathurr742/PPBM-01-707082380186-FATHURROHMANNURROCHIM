import 'package:flutter/material.dart';
import 'package:manekin/data/InformasiSensorData.dart';
import 'package:manekin/helper/custom_appbar.dart';

class DetailSensor extends StatelessWidget {
  final InformasiSensorData data;

  const DetailSensor({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar("Informasi Sensor"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              data.image,
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.fitHeight,
            ),
            const Divider(),

            // Title
            Text(
              data.title,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Vogue"),
            ),
            const Divider(),
            // Dekripsi

            Text(
              data.dekripsi,
              style: const TextStyle(
                fontSize: 12,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
