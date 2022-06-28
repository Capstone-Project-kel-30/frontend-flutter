import 'package:shared_preferences/shared_preferences.dart';

class UserInfoService {
  final SharedPreferences sharedPreferences;
  UserInfoService({required this.sharedPreferences});

  Map<String, dynamic> getUserInfo() {
    final token = sharedPreferences.getString("token");
    final name = sharedPreferences.getString("name");
    final email = sharedPreferences.getString("email");
    final phone = sharedPreferences.getString("phone");
    final password = sharedPreferences.getString("password");
    final memberType = sharedPreferences.getString("member_type");
    final user = {
      'token': token,
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'member_type': memberType,
    };
    return user;
  }

  Future<void> updateUserInfo({
    String? token,
    bool? hasLogin,
    int? id,
    String? name,
    String? email,
    String? phone,
    String? password,
    String? memberType,
  }) async {
    if (hasLogin != null) {
      await sharedPreferences.setBool("hasLogin", hasLogin);
    }
    if (token != null) {
      await sharedPreferences.setString("token", token);
    }
    if (id != null) {
      await sharedPreferences.setInt("id", id);
    }
    if (name != null) {
      await sharedPreferences.setString("name", name);
    }
    if (email != null) {
      await sharedPreferences.setString("email", email);
    }
    if (password != null) {
      await sharedPreferences.setString("password", password);
    }
    if (phone != null) {
      await sharedPreferences.setString("phone", phone);
    }
    if (memberType != null) {
      await sharedPreferences.setString("member_type", memberType);
    }
  }

  Future<void> resetUserInfo() async {
    await sharedPreferences.remove("hasLogin");
    await sharedPreferences.remove("token");
    await sharedPreferences.remove("id");
    await sharedPreferences.remove("name");
    await sharedPreferences.remove("email");
    await sharedPreferences.remove("phone");
    await sharedPreferences.remove("password");
    await sharedPreferences.remove("member_type");
  }
}
