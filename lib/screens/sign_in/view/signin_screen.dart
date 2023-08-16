import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placement_dept/screens/utils/shared_preference.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("SignIn"),
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
                onPressed: () async {
                  String usremail = txtemail.text;
                  String usrpassword = txtpassword.text;

                  Shr shr = Shr();
                  Map m1 = await shr.readData();

                  if(usremail == m1["e1"] && usrpassword == m1["p1"])
                    {
                      Get.snackbar("Successfully logged in", "");
                      Get.offAndToNamed('/home');
                    }
                  else
                    {
                      Get.snackbar("Enter the valid email or password", "or you don't have an account");
                    }
                },
                child: Text("SignIn"),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed('/signup');
                },
                child: Text("You dont't have an account? Sign up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
