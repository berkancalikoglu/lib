import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/view/kategori_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(ScreenUtilInit(
      designSize: const Size(640, 1340),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => MaterialApp(
          theme:
              ThemeData(primaryColor: Colors.cyan, primarySwatch: Colors.cyan),
          debugShowCheckedModeBanner: false,
          home: MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 350.h,
      splash: 'assets/splashh.png',
      nextScreen: KategoriPage(),
      splashTransition: SplashTransition.rotationTransition,
    );
  }
}
