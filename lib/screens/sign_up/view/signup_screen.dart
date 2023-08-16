import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placement_dept/screens/utils/shared_preference.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sign UP"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: txtemail,
                decoration: InputDecoration(
                  hintText: "Email:"
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: txtpassword,
                decoration: InputDecoration(
                    hintText: "Password:"
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  
                  String email = txtemail.text;
                  String password = txtpassword.text;
                  
                  Shr shr = Shr();
                  shr.createData(email, password);
                  Get.snackbar("Successfully registered", '');
                },
                child: Text("SignUp"),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("You already have an account? Sign in"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
