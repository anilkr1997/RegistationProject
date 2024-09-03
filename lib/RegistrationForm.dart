// registration_form.dart
import 'package:flutter/material.dart';

import 'RegistationModel/RegistrationController.dart';
import 'Utill/InputDecorationBuilder.dart';


class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final RegistrationController _controller = RegistrationController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Registration'),
        backgroundColor: Colors.blue,

      ),
      body:Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child:  SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller:_controller. firstNameController,
                    decoration: InputDecorationBuilder.buildInputDecoration('First Name', Icons.person),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller:_controller.lastNameController,
                    decoration: InputDecorationBuilder.buildInputDecoration('Last Name', Icons.person),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _controller.emailController,
                    decoration: InputDecorationBuilder.buildInputDecoration('Email', Icons.email),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      // Add email validation regex if needed
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller:_controller.passwordController,
                    decoration: InputDecorationBuilder.buildInputDecoration('Password', Icons.lock),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller:_controller.confirmPasswordController,
                    decoration: InputDecorationBuilder.buildInputDecoration('Confirm Password', Icons.lock),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _controller.passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller:_controller.phoneController,
                    decoration: InputDecorationBuilder.buildInputDecoration('Phone Number', Icons.phone),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller:_controller.addressLine1Controller,
                    decoration: InputDecorationBuilder.buildInputDecoration('Address Line 1', Icons.home),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller:_controller.addressLine2Controller,
                    decoration: InputDecorationBuilder.buildInputDecoration('Address Line 2', Icons.home),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _controller.cityController,
                    decoration: InputDecorationBuilder.buildInputDecoration('City', Icons.location_city),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller:_controller.stateController,
                    decoration: InputDecorationBuilder.buildInputDecoration('State/Province', Icons.map),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller:_controller.zipController,
                    decoration: InputDecorationBuilder.buildInputDecoration('Zip/Postal Code', Icons.pin_drop),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _controller.countryController,
                    decoration: InputDecorationBuilder.buildInputDecoration('Country', Icons.flag),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _controller.dobController,
                    decoration: InputDecorationBuilder.buildInputDecoration('Date of Birth', Icons.cake),
                    keyboardType: TextInputType.datetime,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _controller.occupationController,
                    decoration: InputDecorationBuilder.buildInputDecoration('Occupation', Icons.work),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _controller.companyController,
                    decoration: InputDecorationBuilder.buildInputDecoration('Company', Icons.business),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _controller.jobTitleController,
                    decoration: InputDecorationBuilder.buildInputDecoration('Job Title', Icons.badge),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _controller.educationController,
                    decoration: InputDecorationBuilder.buildInputDecoration('Education Level', Icons.school),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _controller.skillsController,
                    decoration: InputDecorationBuilder.buildInputDecoration('Skills', Icons.star),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _controller.interestsController,
                    decoration: InputDecorationBuilder.buildInputDecoration('Interests', Icons.favorite),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _controller.referralController,
                    decoration: InputDecorationBuilder.buildInputDecoration('Referral Source', Icons.people),
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_controller.formKey.currentState!.validate()) {
                          // Process data
                          _submitForm();
                        }
                      },
                      child: const Text('Submit'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

      )

    );
  }

  void _submitForm() {


    // You can now send this data to your backend or process it as required
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Form Submitted Successfully')),
    );
  }
}