import 'package:flutter/material.dart';
import 'package:manekin/helper/custom.card.dart';
import 'package:manekin/helper/custom_appbar.dart';
import 'package:manekin/page/informasi_sensor/detail_sensor.dart';
import '../../data/InformasiSensorData.dart';

class SensorTile extends StatefulWidget {
  const SensorTile({super.key});

  @override
  State<SensorTile> createState() => _SensorTileState();
}

class _SensorTileState extends State<SensorTile> {
  List<InformasiSensorData> listSensor = [];

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() {
    List<InformasiSensorData> listTemp = [];

    listTemp.add(InformasiSensorData(
        title: "Lidar",
        image: "assets/sensor/lidar.jpg",
        dekripsi:
            "Lidar (Light Detection and Ranging) adalah teknologi yang menggunakan sinar laser untuk mengukur jarak dan membuat peta 3D dari lingkungan sekitarnya. Lidar bekerja dengan mengirimkan pulsa cahaya laser ke target dan kemudian mengukur waktu yang dibutuhkan untuk pulsa tersebut kembali ke sensor. Dengan mengukur waktu yang dibutuhkan untuk pulsa kembali, Lidar dapat menghitung jarak ke target dengan sangat akurat. Teknologi Lidar digunakan dalam berbagai aplikasi seperti kendaraan otonom, survei dan pemetaan, pertanian, arkeologi, robotika, dan pemantauan lingkungan."));
    listTemp.add(InformasiSensorData(
        title: "Camera Infrared",
        image: "assets/sensor/infraredjpg.jpg",
        dekripsi:
            "Kamera infrared adalah jenis kamera yang dapat mendeteksi radiasi inframerah yang dipancarkan oleh objek dan menghasilkan gambar berdasarkan radiasi tersebut. Kamera infrared sering digunakan dalam aplikasi seperti pemantauan suhu, pengawasan keamanan, dan penginderaan jarak jauh."));
    listTemp.add(InformasiSensorData(
      title: "ESP32",
      image: "assets/sensor/esp32.jpg",
      dekripsi:
          "ESP32 adalah mikrokontroler yang kuat yang dikembangkan oleh Espressif Systems. Mikrokontroler ini terkenal karena kemampuan Wi-Fi dan Bluetooth-nya, hemat daya, serta banyak pin GPIO untuk berbagai proyek elektronik. Ini adalah pilihan populer di dunia IoT dan memiliki dukungan komunitas yang kuat.",
    ));
    listTemp.add(InformasiSensorData(
        title: "Gas Sensor V2",
        image: "assets/sensor/gas.jpg",
        dekripsi:
            "ESP32 adalah mikrokontroler yang kuat yang dikembangkan oleh Espressif Systems. Mikrokontroler ini terkenal karena kemampuan Wi-Fi dan Bluetooth-nya, hemat daya, serta banyak pin GPIO untuk berbagai proyek elektronik. Ini adalah pilihan populer di dunia IoT dan memiliki dukungan komunitas yang kuat."));
    listTemp.add(InformasiSensorData(
        title: "LoadCell",
        image: "assets/sensor/loadcell.jpg",
        dekripsi:
            "Load cell sensor (sensor beban) adalah perangkat yang digunakan untuk mengukur gaya atau beban yang diterapkan pada suatu objek. Ini adalah salah satu jenis sensor yang paling umum digunakan dalam berbagai aplikasi, mulai dari skala digital hingga peralatan pengujian material."));
    listTemp.add(InformasiSensorData(
      title: "MPU 6050",
      image: "assets/sensor/mpu6050.jpg",
      dekripsi:
          "MPU6050 adalah sensor inersia yang umum digunakan. Ini adalah sensor gabungan yang menggabungkan akselerometer dan giroskop dalam satu paket, yang digunakan untuk mengukur perubahan percepatan dan perubahan sudut (rotasi) suatu objek. MPU6050 sering digunakan dalam berbagai aplikasi seperti kendaraan mandiri, robotika, dan perangkat yang memerlukan pemantauan gerakan.",
    ));
    listTemp.add(InformasiSensorData(
      title: "ADXL 345",
      image: "assets/sensor/adxl345.jpg",
      dekripsi:
          "ADXL345 adalah sebuah sensor akselerometer tiga sumbu yang dikembangkan oleh Analog Devices. Sensor ini digunakan untuk mendeteksi percepatan linier pada tiga sumbu yang saling tegak lurus",
    ));
    listTemp.add(InformasiSensorData(
        title: "Strain Gauge",
        image: "assets/sensor/straingauge.png",
        dekripsi:
            "Strain gauge adalah perangkat sensor yang digunakan untuk mengukur perubahan deformasi atau regangan pada suatu objek atau struktur. Deformasi ini disebabkan oleh penerapan gaya atau beban pada objek tersebu"));
    listTemp.add(InformasiSensorData(
      title: "Analog Sound Sensor V2.2",
      image: "assets/sensor/analogsensor.jpg",
      dekripsi:
          "Analog Sound Sensor (Sensor Suara Analog) adalah perangkat sensor yang digunakan untuk mendeteksi dan mengukur suara atau getaran suara dalam bentuk sinyal analog. Ini memungkinkan perangkat elektronik untuk merespons dan memproses suara atau bunyi yang ada di sekitarnya",
    ));

    setState(() {
      listSensor = listTemp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar("Informasi Sensor"),
      body: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemCount: listSensor.length,
          separatorBuilder: (BuildContext context, int index) => const Divider(
                height: 20,
                indent: 10,
                endIndent: 10,
              ),
          itemBuilder: (BuildContext context, int index) {
            final data = listSensor[index];

            return CustomCard(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailSensor(data: data)),
                );
              },
              title: data.title,
              widthCard: 250,
              heightCard: 120,
              widthBanner: 250,
              isWithIcon: false,
              isWithValue: false,
              image: data.image,
              dekripsi: data.dekripsi,
            );
          }),
    );
  }
}
