import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:nws_chat/generated/l10n.dart';
import 'package:nws_chat/screens/home/view.dart';
import 'package:nws_chat/screens/login/view.dart';
import 'package:nws_chat/screens/splash/view.dart';
import 'package:nws_chat/services/auth_service.dart';

import 'flavors.dart';
import 'pages/my_home_page.dart';
import 'shared/logger/logger_utils.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: F.title,
      localizationsDelegates: const [
        S.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
      ],
      locale: const Locale(
          'en', ''), // TODO: Change this for change default language
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _flavorBanner(
        child: SplashPage(),
        show: kDebugMode,
      ),
      initialBinding: BindingsBuilder(
        () {
          Get.put(AuthService());
        },
      ),
      enableLog: kDebugMode,
      debugShowCheckedModeBanner: false,
      logWriterCallback: Logger.write,
    );
  }

  Widget _flavorBanner({
    required Widget child,
    bool show = true,
  }) {
    if (show) {
      return Banner(
        location: BannerLocation.topStart,
        message: F.name,
        color: Colors.green.withOpacity(0.6),
        textStyle: const TextStyle(
            fontWeight: FontWeight.w700, fontSize: 12.0, letterSpacing: 1.0),
        textDirection: TextDirection.ltr,
        child: child,
      );
    }
    return child;
  }
}
