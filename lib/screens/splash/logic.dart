import 'package:get/get.dart';
import 'package:nws_chat/screens/home/view.dart';
import 'package:nws_chat/screens/login/view.dart';
import 'package:nws_chat/services/auth_service.dart';

import 'state.dart';

class SplashLogic extends GetxController {
  final SplashState state = SplashState();

  @override
  void onReady() {
    super.onReady();
    initRoute();
  }

  void initRoute() async {
    await AuthService.find.boostrap();
    final isLoggedIn = AuthService.find.isLoggedInValue;

    if (isLoggedIn) {
      Get.offAll(HomePage());
    } else {
      Get.offAll(LoginPage());
    }
  }
}
