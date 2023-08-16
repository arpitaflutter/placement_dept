import 'package:shared_preferences/shared_preferences.dart';

class Shr
{
  Future<void> createData(String email,String password)
  async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("e1", email);
    sharedPreferences.setString("p1", password);
  }

  Future<Map> readData()
  async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? email = sharedPreferences.getString("e1");
    String? password = sharedPreferences.getString("p1");

    Map m1 = {"e1":email,"p1": password};
    return m1;

  }
}