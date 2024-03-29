import 'package:dalil_app/constant/styles.dart';
import 'package:dalil_app/firebase_options.dart';
import 'package:dalil_app/home_page.dart';
import 'package:dalil_app/pages/auth/sign_in/signin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User? user;
  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    SystemUiMode.immersiveSticky;
    return GetMaterialApp(
      theme: ThemeData(
        textTheme: Styles.textThemes,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 300),
      home: user != null ? HomePage() : SigninPage(),
    );
  }
}
