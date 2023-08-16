import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placement_dept/screens/home/controller/home_controller.dart';

import '../../utils/db_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtprice = TextEditingController();
  TextEditingController txtcate = TextEditingController();
  TextEditingController txtdesc = TextEditingController();
  TextEditingController txtqa = TextEditingController();
  TextEditingController txtimage = TextEditingController();
  HomeController controller = Get.put(HomeController());

  var args;

  @override
  void initState() {
    super.initState();
    DBHelper.dbHelper.checkDB();
    controller.readData();
    args = Get.arguments;

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (args['status'] == 1) {
      txtname = TextEditingController(text: args['data'].name);
      txtprice = TextEditingController(text: args['data'].price);
      txtdesc = TextEditingController(text: args['data'].desc);
      txtcate = TextEditingController(text: args['data'].cate);
      txtqa = TextEditingController(text: args['data'].qa);
      txtimage = TextEditingController(text: args['data'].image);
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(status);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Insert Data"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: txtname,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Name: ",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtprice,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Price: ",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtcate,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Category: ",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtdesc,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Description: ",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtqa,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "qa: ",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtimage,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Image: ",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (args['status'] == 1) {
                      controller.updateData(
                          id: args['data'].id,
                          name: txtname.text,
                          price: txtprice.text,
                          qa: txtqa.text,
                          cate: txtcate.text,
                          desc: txtdesc.text,
                          image: txtimage.text);
                      Get.toNamed('/tra');
                    } else {
                      DBHelper.dbHelper.insertDB(
                          name: txtname.text,
                          price: txtprice.text,
                          qa: txtqa.text,
                          cate: txtcate.text,
                          desc: txtdesc.text,
                          image: txtimage.text);

                      Get.toNamed('/tra');
                    }
                  },
                  child: Text(args['status'] == 1? "Upadate task":"Insert"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
