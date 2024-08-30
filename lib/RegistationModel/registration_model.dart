// registration_model.dart
class RegistrationModel {
  String firstName;
  String lastName;
  String email;
  String password;
  String phoneNumber;
  String addressLine1;
  String addressLine2;
  String city;
  String state;
  String zipCode;
  String country;
  String dateOfBirth;
  String occupation;
  String company;
  String jobTitle;
  String educationLevel;
  String skills;
  String interests;
  String referralSource;

  RegistrationModel({
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.password = '',
    this.phoneNumber = '',
    this.addressLine1 = '',
    this.addressLine2 = '',
    this.city = '',
    this.state = '',
    this.zipCode = '',
    this.country = '',
    this.dateOfBirth = '',
    this.occupation = '',
    this.company = '',
    this.jobTitle = '',
    this.educationLevel = '',
    this.skills = '',
    this.interests = '',
    this.referralSource = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'addressLine1': addressLine1,
      'addressLine2': addressLine2,
      'city': city,
      'state': state,
      'zipCode': zipCode,
      'country': country,
      'dateOfBirth': dateOfBirth,
      'occupation': occupation,
      'company': company,
      'jobTitle': jobTitle,
      'educationLevel': educationLevel,
      'skills': skills,
      'interests': interests,
      'referralSource': referralSource,
    };
  }
}
