import 'package:get/get.dart';
import 'package:nws_chat/screens/login/view.dart';
import 'package:nws_chat/services/auth_service.dart';

import 'state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();

  Future logout() async {
    await 5.delay();
    await _handleLogoutSuccess();
  }

  Future _handleLogoutSuccess() async {
    await AuthService.find.logout();
    Get.offAll(LoginPage());
  }
}
