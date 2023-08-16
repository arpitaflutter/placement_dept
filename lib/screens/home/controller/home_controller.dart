import 'package:get/get.dart';
import 'package:placement_dept/screens/utils/db_helper.dart';

class HomeController {
  RxList<Map> Transactions = <Map>[].obs;
  int index = 0;

  Future<void> readData() async {
    Transactions.value = await DBHelper.dbHelper.readDB();
  }

  void deleteData(int id) {
    DBHelper.dbHelper.deleteDB(id: id);
  }

  void updateData({required id,
    required name,
    required price,
    required qa,
    required cate,
    required desc,
    required image}) {
    DBHelper.dbHelper.updateDB(id: id,
        name: name,
        price: price,
        qa: qa,
        cate: cate,
        desc: desc,
        image: image);
  }
}