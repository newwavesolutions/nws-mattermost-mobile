import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nws_chat/app.dart';

import 'logic.dart';

class HomePage extends StatelessWidget {
  final logic = Get.put(HomeLogic());
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ElevatedButton(
          onPressed: () {
            logic.logout();
          },
          child: Text("Logout"),
        ),
      ),
    );
  }
}
