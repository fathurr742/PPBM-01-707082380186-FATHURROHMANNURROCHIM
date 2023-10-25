import 'package:bcrypt/bcrypt.dart';

import 'package:flutter/material.dart';
import 'package:manekin/page/login-page.dart';
import 'package:mysql1/mysql1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyRegisterPage extends StatefulWidget {
  const MyRegisterPage({Key? key}) : super(key: key);

  @override
  State<MyRegisterPage> createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<MyRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Future<void> _register() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (password != confirmPassword) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Error"),
                content:
                    const Text("Password and Confirm Password must be same"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"),
                  ),
                ],
              ));
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);

    final setting = ConnectionSettings(
      host: '10.20.114.26',
      user: 'flutter',
      password: 'malammakan',
      db: 'latihan_flutter',
    );

    final conn = await MySqlConnection.connect(setting);

    try {
      final result = await conn.query(
        'SELECT COUNT(*) FROM users WHERE email = ?',
        [email],
      );
      final count = result.first.values!.first as int;

      if (count > 0) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text("Error"),
                  content: const Text("Email already registered"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("OK"),
                    ),
                  ],
                ));
        return;
      }

      final encrpyt = BCrypt.hashpw(password, BCrypt.gensalt());

      final insertResult = await conn.query(
          'INSERT INTO users (email, password) VALUES (?,?)', [email, encrpyt]);

      if (insertResult.affectedRows! > 0) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text("Success"),
                  content: const Text("Register success"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyLoginPage()));
                      },
                      child: const Text("OK"),
                    ),
                  ],
                ));
      } else {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text("User Error"),
                  content: const Text("Register failed"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("OK"),
                    ),
                  ],
                ));
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Server Error"),
                // content: Text(e.toString()),
                content: const Text('Server Error Silakan Hubungi Admin'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"),
                  ),
                ],
              ));
    } finally {
      await conn.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg-register.jpg"),
                fit: BoxFit.fitHeight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
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
                Container(
                  margin: const EdgeInsets.only(top: 45),
                  child: Center(
                    child: Text(
                      "Register",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[600],
                          fontFamily: "Handmade"),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Center(
                    child: Text(
                      "Create your account",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[600],
                          fontFamily: "Handmade"),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  margin: const EdgeInsets.only(top: 34),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: _emailController, // Add this line
                          decoration: InputDecoration(
                              hintStyle: const TextStyle(
                                  fontFamily: "Handmade", fontSize: 18),
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
                          controller: _passwordController,
                          obscureText: true, // Add this line
                          decoration: InputDecoration(
                              hintStyle:
                                  const TextStyle(fontFamily: "Handmade"),
                              hintText: 'Password',
                              errorStyle: const TextStyle(color: Colors.red),
                              prefixIcon: const Icon(Icons.lock_outline_sharp),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              fillColor: Colors.white),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your password";
                            }
                            if (value.length < 8) {
                              return "Password must be at least 8 characters long";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _confirmPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintStyle:
                                  const TextStyle(fontFamily: "Handmade"),
                              hintText: 'Confrim Password',
                              errorStyle: const TextStyle(color: Colors.red),
                              prefixIcon: const Icon(Icons.lock_outline_sharp),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              fillColor: Colors.white),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your password";
                            }
                            if (value.length < 8) {
                              return "Password must be at least 8 characters long";
                            }
                            return null;
                          },
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            "By Registering, you agree to our Term of  use and Privacy Policy  ",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[600],
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
                              _register();
                            }
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
