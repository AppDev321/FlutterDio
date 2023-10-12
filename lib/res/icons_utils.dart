
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

}