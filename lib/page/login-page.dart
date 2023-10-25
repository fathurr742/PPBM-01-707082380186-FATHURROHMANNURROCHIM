// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:manekin/page/dashboard-page.dart';

import 'package:manekin/page/register-page.dart';
import 'package:mysql1/mysql1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bcrypt/bcrypt.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true; // Add this line
  bool _rememberMe = false;
  late SharedPreferences _prefs;

  Future<bool> isRemembered() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('rememberMe') ?? false;
  }

  Future<void> _login() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    final setting = ConnectionSettings(
      host: '10.20.114.26',
      user: 'flutter',
      password: 'malammakan',
      db: 'latihan_flutter',
    );

    final conn = await MySqlConnection.connect(setting);

    try {
      final result = await conn
          .query('SELECT password FROM users WHERE email = ?', [email]);

      if (result.isNotEmpty) {
        final user = result.first;
        final hashPassword = user['password'] as String;
        final bool isValidPassword = BCrypt.checkpw(password, hashPassword);

        if (isValidPassword) {
          await _prefs.setString('email', email);
          await _prefs.setString('password', password);
          await _prefs.setBool('rememberMe', _rememberMe);

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MyDashBoard()),
          );
        } else {
          showDialog(
              context: context,
              builder: ((context) => AlertDialog(
                    title: const Text("Error"),
                    content: const Text("Invalid email or password"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Close"),
                      )
                    ],
                  )));
        }
      }
    } catch (error) {
    } finally {
      await conn.close();
    }
  }

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        _prefs = prefs;
        _rememberMe = _prefs.getBool('rememberMe') ?? false;
        if (_rememberMe) {
          _emailController.text = _prefs.getString('email') ?? '';
          _passwordController.text = _prefs.getString('password') ?? '';
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [body()],
      ),
    );
  }

  Widget body() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        bellowBody(),
        Positioned(
          top: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(200),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              image: const DecorationImage(
                image: AssetImage("assets/bg-login.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
                child: Image.asset(
              "assets/logo-rg.png",
              scale: 6,
            )),
          ),
        ),
      ],
    );
  }

  Widget bellowBody() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey[600],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 215),
        child: Column(
          children: <Widget>[
            const Text("Hello, STAS - CITIZEN",
                style: TextStyle(
                    fontSize: 30, color: Colors.white, fontFamily: "Vogue")),
            const Text("Login to your account",
                style: TextStyle(
                    fontSize: 17, color: Colors.white, fontFamily: "Handmade")),
            Form(
              key: _formKey,
              child: Column(children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: TextFormField(
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
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: TextFormField(
                    obscureText: _obscurePassword,
                    controller: _passwordController, // Add this line
                    decoration: InputDecoration(
                        hintStyle: const TextStyle(fontFamily: "Handmade"),
                        hintText: 'Password',
                        errorStyle: const TextStyle(color: Colors.red),
                        prefixIcon: const Icon(Icons.lock_outline_sharp),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                            icon: _obscurePassword
                                ? const Icon(Icons.remove_red_eye)
                                : const Icon(Icons.remove_red_eye_outlined)),
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
                ),

                //Make a checkbox
                Container(
                  margin: const EdgeInsets.only(left: 40),
                  child: Row(
                    children: [
                      Checkbox(
                          value: _rememberMe,
                          onChanged: (value) {
                            setState(() {
                              _rememberMe = value ?? false;
                            });
                          }),
                      const Text(
                        "Remember Me",
                        style: TextStyle(
                            color: Colors.white, fontFamily: "Handmade"),
                      )
                    ],
                  ),
                ),

                //Make a button
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _login();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[700],
                        minimumSize: const Size(250, 50),
                        shadowColor: Colors.black,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text("Login",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: "Handmade")),
                  ),
                ),

                //Make a text don't have an account
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                            color: Colors.white, fontFamily: "Handmade"),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyRegisterPage()),
                            );
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.black, fontFamily: "Handmade"),
                          ))
                    ],
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
