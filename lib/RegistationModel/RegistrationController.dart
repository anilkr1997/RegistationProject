// registration_controller.dart
import 'package:flutter/material.dart';
import 'registration_model.dart';

class RegistrationController {
  final registrationData = RegistrationModel();

  final formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();
  final addressLine1Controller = TextEditingController();
  final addressLine2Controller = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipController = TextEditingController();
  final countryController = TextEditingController();
  final dobController = TextEditingController();
  final occupationController = TextEditingController();
  final companyController = TextEditingController();
  final jobTitleController = TextEditingController();
  final educationController = TextEditingController();
  final skillsController = TextEditingController();
  final interestsController = TextEditingController();
  final referralController = TextEditingController();

  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    addressLine1Controller.dispose();
    addressLine2Controller.dispose();
    cityController.dispose();
    stateController.dispose();
    zipController.dispose();
    countryController.dispose();
    dobController.dispose();
    occupationController.dispose();
    companyController.dispose();
    jobTitleController.dispose();
    educationController.dispose();
    skillsController.dispose();
    interestsController.dispose();
    referralController.dispose();
  }

  bool validateAndSaveForm() {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      registrationData.firstName = firstNameController.text;
      registrationData.lastName = lastNameController.text;
      registrationData.email = emailController.text;
      registrationData.password = passwordController.text;
      registrationData.phoneNumber = phoneController.text;
      registrationData.addressLine1 = addressLine1Controller.text;
      registrationData.addressLine2 = addressLine2Controller.text;
      registrationData.city = cityController.text;
      registrationData.state = stateController.text;
      registrationData.zipCode = zipController.text;
      registrationData.country = countryController.text;
      registrationData.dateOfBirth = dobController.text;
      registrationData.occupation = occupationController.text;
      registrationData.company = companyController.text;
      registrationData.jobTitle = jobTitleController.text;
      registrationData.educationLevel = educationController.text;
      registrationData.skills = skillsController.text;
      registrationData.interests = interestsController.text;
      registrationData.referralSource = referralController.text;
    }
    return isValid;
  }

  Future<void> submitForm() async {
    if (validateAndSaveForm()) {
      // Here you would typically send the data to a server
      // For now, we'll just print it to the console
      print(registrationData.toJson());
    }
  }
}
