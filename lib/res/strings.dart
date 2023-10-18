import 'package:intl/intl.dart';

Strings strings = Strings();



extension StringSafeGet on String? {
  String safeGet() {
    return this ?? '';
  }

}

extension IntSafeGet on int? {
  int safeGet() {
    return this ?? 0;
  }
  String convertedString(){
    return this!=null ? "$this" : '0';
  }
}
extension DoubleSafeGet on double? {
  double safeGet() {
    return this ?? 0;
  }
  String convertedString(){
    return this!=null ? "$this" : '0';
  }
}

extension DateUtil on DateTime? {
  String getDate() {
    return  this != null ? DateFormat('yyyy-MM-dd').format(this!) :"";
  }
  String getTime() {
    return  this != null ? DateFormat('HH:mm:ss.SSS').format(this!) :"";
  }
  String getCompeteDateTime() {
    return  this != null ? DateFormat('yyyy-MM-dd HH:mm:ss.SSS').format(this!) : "";
  }
}


class Strings {
  static final Strings _strings = Strings._i();

  factory Strings() {
    return _strings;
  }

  Strings._i();

  final String app_name = 'NRoute';

  final String special = 'Special';
  final String products = 'Products';
  final String upcoming_movies = 'Upcoming Movies';
  final String popular_movies = 'Popular Movies';




  final String LABEL_ALREADY_ACCOUNT= "Already have an account? Login";
  final String LABEL_NEW_ACCOUNT= "Registered as new user";
  final String LABEL_WELCOME_MSG= "Welcome To Nroute";
  final String LABEL_LOGIN= "Login";
  final String LABEL_WELCOME_BACK= "Welcome Back";
  final String LABEL_SIGNUP= "Sign Up";
  final String LABEL_PASSWORD= "Password";
  final String LABEL_CONFIRM_PASSWORD= "Confirm Password";
  final String LABEL_EMAIL= "Email";
  final String LABEL_CONTINUE= "Continue";
  final String LABEL_NAME= "Name";
  final String LABEL_PHONE= "Phone";
  final String LABEL_ADDRESS= "Address";
  final String LABEL_ORGANIZATION= "Organization";
  final String LABEL_USER_TYPE= "User Type";


  final String LABEL_DISPATCHED_TAB = 'Dispatched List';
  final String LABEL_PRODUCTS_TAB = 'Product List';
  final String LABEL_STOCK_TAB = 'Stock List';
  final String LABEL_MORE_TAB= "More";

  final String LABEL_ADD_PRODUCT = "Add Product";


  final String LABEL_PRICE = "\$";
  // Form Error
  final RegExp emailValidatorRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final String kEmailNullError = "Please enter your email";
  final String kInvalidEmailError = "Please enter Valid Email";
  final String kPassNullError = "Please enter your password";
  final String kShortPassError = "Password is too short";
  final String kMatchPassError = "Passwords don't match";
  final String kNamelNullError = "Please enter your name";
  final String kPhoneNumberNullError = "Please enter your phone number";
  final String kAddressNullError = "Please enter your address";
  final String kOrganizationNullError = "Please enter your organization name";
  final String kUserTypeNullError = "Please select user type";

  final String KQuantity = "Quantity";
  final String KAdd = "Add";
  final String KCancel = "Cancel";

}
