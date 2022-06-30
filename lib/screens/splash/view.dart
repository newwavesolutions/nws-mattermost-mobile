import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nws_chat/services/auth_service.dart';

import 'logic.dart';

class SplashPage extends StatelessWidget {
  final logic = Get.put(SplashLogic());
  final state = Get.find<SplashLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(child: Text("Loading...")),
      ),
    );
  }
}
