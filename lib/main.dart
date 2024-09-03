import 'package:flutter/material.dart';
import 'package:registationproject/RegistrationForm.dart';

import 'SplashScreen.dart';
import 'loginpage/loginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => LoginPage(),
        '/home': (context) => RegistrationForm(),
      },
    builder: (context, child) {
    return MediaQuery(
    data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
    child: PopScope(
      canPop: true,
onPopInvoked: ((pop){
  return ;
}),

    child: child!,
    ),
    );
    },

    );
  }
}


