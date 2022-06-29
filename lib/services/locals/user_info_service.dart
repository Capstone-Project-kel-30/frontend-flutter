import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_zone/models/user_model.dart';

class UserInfoService {
  final SharedPreferences sharedPreferences;
  UserInfoService({required this.sharedPreferences});

  UserModel getUserInfo() {
    final token = sharedPreferences.getString("token");
    final name = sharedPreferences.getString("name");
    final email = sharedPreferences.getString("email");
    final phone = sharedPreferences.getString("phone");
    final memberType = sharedPreferences.getString("member_type");
    final UserModel user = UserModel(
      data: Data(
        token: token,
        name: name,
        email: email,
        phone: phone,
        memberType: memberType,
      ),
    );
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
    if (hasLogin != null && hasLogin != sharedPreferences.getBool("hasLogin")) {
      await sharedPreferences.setBool("hasLogin", hasLogin);
    }
    if (token != null && token != sharedPreferences.getString("token")) {
      await sharedPreferences.setString("token", token);
    }
    if (id != null && id != sharedPreferences.getInt("id")) {
      await sharedPreferences.setInt("id", id);
    }
    if (name != null && name != sharedPreferences.getString("name")) {
      await sharedPreferences.setString("name", name);
    }
    if (email != null && email != sharedPreferences.getString("email")) {
      await sharedPreferences.setString("email", email);
    }
    if (password != null &&
        password != sharedPreferences.getString("password")) {
      await sharedPreferences.setString("password", password);
    }
    if (phone != null && phone != sharedPreferences.getString("phone")) {
      await sharedPreferences.setString("phone", phone);
    }
    if (memberType != null &&
        memberType != sharedPreferences.getString("member_type")) {
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
