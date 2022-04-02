import 'package:get_storage/get_storage.dart';

///Functions for sharedprefrence  functions only
///
/// These services folder can use  functions for fetch location ,Get image from gallery etc,put that in a separate file

class getStorage {
  final storage = GetStorage();

  void setUserToken(String token) {
    storage.write("token", token);
  }

  String getUserToken() {
    return storage.read('token');
  }

  void setLoggedIn(bool status) {
    storage.write("Logged_in", status);
  }

  bool getLoggedIn() {
    return storage.read("Logged_in") != null;
  }

  void setUserId(String id) {
    storage.write("id", id);
  }

  String getUserId() {
    return storage.read("id");
  }

  void setUserTypeId(String id) {
    storage.write("user_type_id", id);
  }

  String getUserTypeId() {
    return storage.read("user_type_id");
  }

  void setUsername(String name) {
    storage.write("username", name);
  }

  String getUsername() {
    return storage.read("username");
  }

  void setEmpId(String id) {
    storage.write("employee_id", id);
  }

  String getEmpId() {
    return storage.read("employee_id");
  }

  void setFranchiseId(String id) {
    storage.write("franchise_id", id);
  }

  String getFranchiseId() {
    return storage.read("franchise_id");
  }
}
