import 'dart:convert';

import 'package:admin_app/tab_item/tab_menu.dart';
import 'package:admin_app/widget/custom_TextField.dart';
import 'package:admin_app/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  String loginLink = "https://apihomechef.antopolis.xyz/api/admin/sign-in";

  late SharedPreferences sharedPreferences;

  isLogin() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") != null) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => TabMenu()));
    } else {
      print("Token is empty");
    }
  }

  getLogin() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var map = Map<String, dynamic>();
    map["email"] = emailController.text.toString();
    map["password"] = passwordController.text.toString();
    var responce = await http.post(
      Uri.parse(loginLink),
      body: map,
    );
    if (responce.statusCode == 200) {
      showInToast("Login Succesfull");
      var data = jsonDecode(responce.body);
      setState(() {
        sharedPreferences.setString("token", data["access_token"]);
      });
      token = sharedPreferences.getString("token");

      print("token is $token");
    } else {
      showInToast("Invalid Email or Password");
    }
  }

  String? token;

  @override
  void initState() {
    // TODO: implement initState
    isLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: isLoading == true,
        opacity: 0.0,
        progressIndicator: CircularProgressIndicator(),
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                controller: emailController,
                hintText: "Enter your email",
              ),
              CustomTextField(
                controller: passwordController,
                hintText: "Enter your password",
              ),
              MaterialButton(
                onPressed: () {
                  getLogin();
                },
                color: Colors.orange,
                child: Text("Login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
