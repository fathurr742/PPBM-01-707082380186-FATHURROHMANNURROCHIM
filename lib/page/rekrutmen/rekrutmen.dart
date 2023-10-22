import 'package:flutter/material.dart';
import 'package:manekin/helper/custom_appbar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../helper/custom_modal.dart';

class Rekrutmen extends StatefulWidget {
  const Rekrutmen({super.key});

  @override
  State<Rekrutmen> createState() => _RekrutmenState();
}

class _RekrutmenState extends State<Rekrutmen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _instagramController = TextEditingController();
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar("Rekrutmen"),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/waves.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            const SizedBox(
              height: 40,
            ),
            const Center(
                child: Text(
              "ISI FORMULIR REKRUTMEN",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "Vogue",
              ),
            )),
            const SizedBox(
              height: 20,
            ),
            MyForm(),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget MyForm() {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController, // Add this line
                decoration: InputDecoration(
                    hintStyle:
                        const TextStyle(fontFamily: "Handmade", fontSize: 18),
                    errorStyle: const TextStyle(color: Colors.red),
                    hintText: 'Nama Lengkap',
                    filled: true,
                    prefixIcon: const Icon(Icons.account_circle_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    fillColor: Colors.white),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                    return 'Please enter a valid name';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _emailController, // Add this line
                decoration: InputDecoration(
                    hintStyle:
                        const TextStyle(fontFamily: "Handmade", fontSize: 18),
                    errorStyle: const TextStyle(color: Colors.red),
                    hintText: 'Email',
                    filled: true,
                    prefixIcon: const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    fillColor: Colors.white),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                    return "Please enter a valid email address";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _instagramController,
                decoration: InputDecoration(
                    hintStyle: const TextStyle(fontFamily: "Handmade"),
                    hintText: 'Instagram',
                    errorStyle: const TextStyle(color: Colors.red),
                    prefixIcon: Icon(MdiIcons.instagram),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    fillColor: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your Instagram";
                  }

                  return null;
                },
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(5),
                width: 400,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.black)),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  padding: const EdgeInsets.all(10),
                  isDense: false,
                  isExpanded: true,
                  iconSize: 30,
                  underline: Container(),
                  hint: const Text("Pilih Fakultas"),
                  items: <String>['FIT', 'FIK', 'FTE', 'TRM']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 20),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: const Text(
                  "Pemberitahuan akan dikirimkan melalui email yang telah didaftarkan",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: "Handmade"),
                ),
              ),
              const SizedBox(height: 5),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[600],
                  minimumSize: const Size(250, 40),
                  shadowColor: Colors.black,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  // Register the user
                  if (_formKey.currentState!.validate()) {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomModal(
                            title: 'Berikan rating untuk aplikasi ini',
                            content: RatingBar.builder(
                              initialRating: 1,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: false,
                              itemCount: 5,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                // Do something with the rating
                              },
                            ),
                            actions: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context); // Close the modal
                              },
                              child: const Text('Kirim'),
                            ),
                          );
                        });
                  }
                },
                child: const Text(
                  "Kirim",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
