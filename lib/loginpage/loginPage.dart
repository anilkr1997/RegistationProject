import 'package:flutter/material.dart';

import '../Utill/InputDecorationBuilder.dart';
import 'LoginController.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginForm();
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  late LoginController _controller;

  @override
  void initState() {
    super.initState();
    _controller = LoginController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 40),
                      Text(
                        'Welcome',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Please sign in to continue',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 48),
                      TextFormField(
                        controller: _controller.emailController,
                        decoration: InputDecorationBuilder.buildInputDecoration('Email', Icons.email),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) => _controller.validateEmail(value!) ? null : 'Invalid email',
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _controller.passwordController,
                        decoration: InputDecorationBuilder.buildInputDecoration('Password', Icons.lock),
                        obscureText: true,
                        validator: (value) => _controller.validatePassword(value!) ? null : 'Invalid password',
                      ),
                      const SizedBox(height: 24),
                      StreamBuilder<bool>(
                        stream: _controller.isLoadingStream,
                        initialData: false,
                        builder: (context, snapshot) {
                          return ElevatedButton(
                            onPressed: snapshot.data!
                                ? null
                                : () async {
                              if (_formKey.currentState!.validate()) {
                                bool success = await _controller.login();
                                if (success) {
                                  // Navigate to home page or show success message
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Login Successful')),
                                  );
                                  Navigator.of(context).pushReplacementNamed('/home');
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: snapshot.data!
                                  ? const CircularProgressIndicator(color: Colors.white)
                                  : const Text('Login', style: TextStyle(fontSize: 18)),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () {
                          // Handle forgot password
                        },
                        child: const Text('Forgot Password?'),
                      ),
                      StreamBuilder<String?>(
                        stream: _controller.errorStream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData && snapshot.data != null) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Text(
                                snapshot.data!,
                                style: const TextStyle(color: Colors.red),
                                textAlign: TextAlign.center,
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ),
    );
  }
}
