import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placement_dept/screens/home/controller/home_controller.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.readData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Transactions"),
        ),
        body: Obx(
          () => ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("${controller.Transactions[index]['name']}"),
                subtitle: Text("${controller.Transactions[index]['price']}"),
                leading: Text("${controller.Transactions[index]['qa']}"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        int id = controller.Transactions[index]['id'];
                        controller.deleteData(id);
                        controller.readData();
                      },
                      icon: Icon(Icons.delete),
                    ),
                    IconButton(
                      onPressed: () {
                        String id = controller.Transactions[index]['id'];
                        String name = controller.Transactions[index]['name'];
                        String price = controller.Transactions[index]['price'];
                        String cate = controller.Transactions[index]['cate'];
                        String desc = controller.Transactions[index]['desc'];
                        String image = controller.Transactions[index]['image'];
                        String qa = controller.Transactions[index]['qa'];
                        controller.updateData(
                            id: id,
                            name: name,
                            price: price,
                            qa: qa,
                            cate: cate,
                            desc: desc,
                            image: image);
                        Get.toNamed('/home', arguments: {
                          'status': 1,
                          'data': controller.Transactions[index].values
                        });
                      },
                      icon: Icon(Icons.edit),
                    ),
                  ],
                ),
              );
            },
            itemCount: controller.Transactions.length,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed('/home', arguments: {
              "status": 0});
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
