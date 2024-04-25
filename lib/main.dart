import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parent_kid_monitoring_app/pages/auth/login/login_model.dart';
import 'package:parent_kid_monitoring_app/pages/auth/login_sign_up_view.dart';
import 'package:parent_kid_monitoring_app/pages/auth/signup/sign_up_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // state management for sign up
        ChangeNotifierProvider(
          create: (_) => SignUpModel(),
        ),
        // state management for log in
        ChangeNotifierProvider(
          create: (_) => LoginModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Parent-Kid Monitoring App',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const LoginOrSignUpView(),
      ),
    );
  }
}

