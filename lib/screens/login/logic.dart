import 'package:get/get.dart';
import 'package:nws_chat/screens/home/view.dart';
import 'package:nws_chat/services/auth_service.dart';

import 'state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();

  Future login({
    required String username,
    required String password,
  }) async {
    await 10.delay();
    await _handleLoginSuccess("123123");
  }

  Future _handleLoginSuccess(String accessToken) async {
    await AuthService.find.setToken(accessToken);
    Get.offAll(HomePage());
  }
}
