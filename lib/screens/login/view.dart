import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class LoginPage extends StatelessWidget {
  final logic = Get.put(LoginLogic());
  final state = Get.find<LoginLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ElevatedButton(
          onPressed: () {
            logic.login(username: "username", password: "password");
          },
          child: Text("Login"),
        ),
      ),
    );
  }
}
