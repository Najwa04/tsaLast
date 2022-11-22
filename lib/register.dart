// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, unused_field, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tsa_last/home.dart';
import 'package:tsa_last/login.dart';

class Regiser_page extends StatefulWidget {
  const Regiser_page({super.key});

  @override
  State<Regiser_page> createState() => _Register_pageState();
}

// ignore: camel_case_types
class _Register_pageState extends State<Regiser_page> {
  final controllerEmail = TextEditingController();
  final controllerPass = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> regiser() async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: controllerEmail.text.toString(),
          password: controllerPass.text.toString());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "Sukses",
              ),
              content: Text("Berhasil Register"),
              actions: [
                TextButton(onPressed: ()=>Get.to(Login_page()), child: Text('OK')),
              ],
            );
          });
    } catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "Error",
              ),
              content: Text("Gagal Registrasi"),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 60),
                Text(
                  "Register",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40),
                Container(
                  width: 315,
                  height: 47,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xfff0f0f0)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                    child: TextField(
                      controller: controllerEmail,
                      decoration: InputDecoration.collapsed(hintText: "Email"),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 315,
                  height: 47,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xfff0f0f0)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                    child: TextField(
                      controller: controllerPass,
                      decoration:
                          InputDecoration.collapsed(hintText: "Password"),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 315,
                  height: 47,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 230, 82, 37),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                      onPressed: () {
                        regiser();
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(fontSize: 19, color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
