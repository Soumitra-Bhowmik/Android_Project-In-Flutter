import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day37/welcome.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  register() {
    FirebaseFirestore.instance.collection('Users').add({
      'name': _nameController.text,
      'email': _emailController.text,
      'password': _passController.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Form"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.00),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
            ),
            TextField(
              controller: _emailController,
            ),
            TextField(
              controller: _passController,
              obscureText: true,
            ),
            ElevatedButton(
                onPressed: () {
                  register();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Welcome()));
                },
                child: Text("SUBMIT"))
          ],
        ),
      ),
    );
  }
}
