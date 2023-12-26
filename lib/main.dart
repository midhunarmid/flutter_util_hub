import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_util_hub/core/presentation/navigation/app_router.dart';
import 'package:flutter_util_hub/core/presentation/pages/signin_screen.dart';
import 'package:flutter_util_hub/core/presentation/utils/di.dart';
import 'package:flutter_util_hub/core/presentation/utils/theme.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setPathUrlStrategy();
  setupDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: router,
          title: "flutter_util_hub",
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          darkTheme: appTheme,
        );
      },
      child: const SigninScreen(),
    );
  }

  static void debugPrint(Object? object) {
    if (kDebugMode) {
      print(object);
    }
  }
}
