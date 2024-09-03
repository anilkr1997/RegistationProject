import 'dart:async';
import 'package:flutter/material.dart';
import 'LoginModel.dart';


class LoginController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final StreamController<bool> _isLoadingController = StreamController<bool>();
  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  final StreamController<String?> _errorController = StreamController<String?>();
  Stream<String?> get errorStream => _errorController.stream;

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    _isLoadingController.close();
    _errorController.close();
  }

  Future<bool> login() async {
    final loginModel = LoginModel(
      email: emailController.text,
      password: passwordController.text,
    );

    _isLoadingController.add(true);
    _errorController.add(null);

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      _isLoadingController.add(false);
      return true;
      // TODO: Replace this with actual API call
      // if (loginModel.email == 'test@example.com' && loginModel.password == 'password') {
      //   _isLoadingController.add(false);
      //   return true;
      // } else {
      //   throw Exception('Invalid credentials');
      // }
    } catch (e) {
      _isLoadingController.add(false);
      _errorController.add(e.toString());
      return false;
    }
  }

  bool validateEmail(String value) {
    if (value.isEmpty) {
      _errorController.add('Email cannot be empty');
      return false;
    }
    // You can add more sophisticated email validation here
    if (!value.contains('@')) {
      _errorController.add('Invalid email format');
      return false;
    }
    _errorController.add(null);
    return true;
  }

  bool validatePassword(String value) {
    if (value.isEmpty) {
      _errorController.add('Password cannot be empty');
      return false;
    }
    if (value.length < 6) {
      _errorController.add('Password must be at least 6 characters long');
      return false;
    }
    _errorController.add(null);
    return true;
  }
}
