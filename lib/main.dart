import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placement_dept/screens/sign_in/view/signin_screen.dart';
import 'package:placement_dept/screens/sign_up/view/signup_screen.dart';
import 'package:placement_dept/screens/transactions/view/transaction_screen.dart';

import 'screens/home/view/home_screen.dart';

void main()
{
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => SigninScreen()),
        GetPage(name: '/signup', page: () => SignupScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/tra', page: () => TransactionScreen()),
      ],
    )
  );
}