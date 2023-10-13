Strings strings = Strings();

final title = "Strings";

class Strings {
  static final Strings _strings = Strings._i();

  factory Strings() {
    return _strings;
  }

  Strings._i();

  final String app_name = 'NRoute';
  final String home_title = 'Home';
  final String special = 'Special';
  final String products = 'Products';
  final String upcoming_movies = 'Upcoming Movies';
  final String popular_movies = 'Popular Movies';


  final String SCREEN_MORE= "More";

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
}
