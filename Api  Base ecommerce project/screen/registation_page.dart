import 'dart:convert';

import 'package:admin_app/http/custome_http_request.dart';
import 'package:admin_app/widget/brand_colors.dart';
import 'package:admin_app/widget/custom_TextField.dart';
import 'package:admin_app/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistationPage extends StatefulWidget {
  const RegistationPage({Key? key}) : super(key: key);

  @override
  State<RegistationPage> createState() => _RegistationPageState();
}

class _RegistationPageState extends State<RegistationPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isLoading = false;
  getRegister() async {
    setState(() {
      isLoading = true;
    });
    var map = Map<String, dynamic>();
    map["name"] = nameController.text.toString();
    map["email"] = emailController.text.toString();
    map["password"] = passwordController.text.toString();
    map["password_confirmation"] = confirmPasswordController.text.toString();
    var responce = await http.post(
      Uri.parse("$uri/create/new/admin"),
      body: map,
      headers: CustomHttpRequest.defaultHeader,
    );
    print("${responce.body}");
    var data = jsonDecode(responce.body);
    if (responce.statusCode == 201) {
      showInToast("Registation Successful");
    } else {
      showInToast("${data["errors"]["email"]}");
    }
    
    setState(() {
      isLoading = false;
    });
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
            children: [
              CustomTextField(
                controller: nameController,
                hintText: "Enter your name",
              ),
              CustomTextField(
                controller: emailController,
                hintText: "Enter your email",
              ),
              CustomTextField(
                controller: passwordController,
                hintText: "Enter your password",
              ),
              CustomTextField(
                controller: confirmPasswordController,
                hintText: "Confirm password",
              ),
              MaterialButton(
                onPressed: () {
                  getRegister();
                },
                color: Colors.orange,
                child: Text("Register"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
