import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Keys { kAccessToken }

class AuthService extends GetxService {
  static AuthService get find => Get.find();

  /// Mocks a login process
  final isLoggedIn = false.obs;
  bool get isLoggedInValue => isLoggedIn.value;

  String? token;

  // Public func
  Future<void> boostrap() async {
    final token = await _getToken();
    isLoggedIn.value = token != null && token.isNotEmpty;
  }

  Future<void> login(String token) async {
    if (token.isEmpty) return;
    await setToken(token);
    this.token = token;
    isLoggedIn.value = true;
  }

  Future<void> logout() async {
    await _clearToken();
    token = null;
    isLoggedIn.value = false;
  }

  Future<void> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Keys.kAccessToken.name, token);
    token = token;
  }

  // Private func

  Future<String?> _getToken() async {
    if (token != null) {
      return token;
    }
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString(Keys.kAccessToken.name);
      return token;
    } catch (e) {
      return null;
    }
  }

  Future<void> _clearToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove(Keys.kAccessToken.name);
    } catch (e) {
      // Nothing
    }
  }
}
