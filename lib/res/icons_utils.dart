
IconUtils iconUtils = IconUtils();

class IconUtils {
  static IconUtils? _instance;



  IconUtils._();

  factory IconUtils() {
    _instance ??= IconUtils._();
    // since you are sure you will return non-null value, add '!' operator
    return _instance!;
  }

  final  WELCOME_ICON = "assets/icons/ic_welcome.png";
  final  fb_icon = "assets/icons/ic_facebook.svg";
  final  google_icon = "assets/icons/ic_google.svg";
  final  twitter_icon = "assets/icons/ic_twitter.svg";
  final ic_error =   "assets/icons/ic_error.svg";
  final ic_password_lock =  "assets/icons/ic_password_lock.svg";


  final ic_dispatch = "assets/icons/ic_dispatch.png";

  final ic_user = "assets/icons/ic_user.svg";
  final ic_help_center = "assets/icons/ic_help_center.svg";
  final ic_logout = "assets/icons/ic_logout.svg";
}