// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_delete/Admin_Pannel_Pages/category_screen.dart';
import 'package:test_delete/firebase_options.dart';
import 'package:test_delete/pages/baby_food_screen.dart';
import 'package:test_delete/pages/cloth_screen.dart';
import 'package:test_delete/pages/screens/Main_Page.dart';
import 'package:test_delete/pages/screens/detail_screen.dart';
import 'package:test_delete/pages/screens/widgets/detail2_screen.dart';
import 'package:test_delete/pages/screens/widgets/login_screen.dart';
import 'package:test_delete/pages/screens/widgets/registration_screen.dart';
import 'package:test_delete/pages/screens/widgets/splash_screen.dart';

// import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // try {
  //   await Firebase.initializeApp(
  //       options: DefaultFirebaseOptions.currentPlatform);
  // } catch (e) {
  //   print("Firebase initialization error: $e");
  // }

  runApp(const MyApp());
}

// void main() {
//   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//     statusBarColor: Colors.transparent,
//   ));
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      // home: RegistrationScreen(),
      home: LoginScreen(),
      // home: MainPageScreen(),
      // home: OrderSuccessPage(),
      // home: ProfileSettingsPage(),
      // home: DetailPage(),
      // home: DetailPage2(),
      // home: ToysPage(),
      // home: ClothPage(),
      // home: DiaperPage(),
      // home: BabyfoodPage(),
      // home: OrderHistoryScreen(),
      // home: ShoppingCart(),
      // home: CheckOutPage(),
      // home: OrderHistoryScreen(),
      // home: SearchProductPage(),
      // home: Admin_Pannel(),
      // home: CategoryPage(),
      // home: ProductPage(),
      // home: OrderPage(),
      // home: SettingPage(),
      // home: ProfileScreen(),
    );
  }
}
