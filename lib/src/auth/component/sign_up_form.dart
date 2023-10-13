import 'package:flutter/material.dart';
import 'package:flutter_dio/data/common/enums.dart';
import 'package:flutter_dio/res/app_color.dart';
import 'package:flutter_dio/utils/widget_util.dart';
import 'package:flutter_dio/widgets/custom_button.dart';
import 'package:flutter_dio/widgets/text_styles.dart';

import '../../../res/strings.dart';
import '../../widgets/form_error.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? name;
  String? phone;
  String? address;
  String? password;
  String? conform_password;
  String? organization;
  String? userType;
  bool remember = false;
  final List<String?> errors = [];

  final List<DropdownMenuItem> userTypes = [
    DropdownMenuItem(
      value: UserType.Distributor.name,
      child: Text(
        UserType.Distributor.name,
      ),
    ),
    DropdownMenuItem(
      value: UserType.Dispatcher.name,
      child: Text(
        UserType.Dispatcher.name,
      ),
    ),
    DropdownMenuItem(
      value: UserType.Collector.name,
      child: Text(
        UserType.Collector.name,
      ),
    ),
  ];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildNameFormField(),
          WidgetUtil.normalVerticalSpace(),
          buildEmailFormField(),
          WidgetUtil.normalVerticalSpace(),
          buildPhoneFormField(),
          WidgetUtil.normalVerticalSpace(),
          buildOrganizationFormField(),
          WidgetUtil.normalVerticalSpace(),
          buildUserTypeFormField(),
          WidgetUtil.normalVerticalSpace(),
          buildPasswordFormField(),
          WidgetUtil.normalVerticalSpace(),
          buildConformPassFormField(),
          WidgetUtil.normalVerticalSpace(),
          buildAddressFormField(),
          WidgetUtil.normalVerticalSpace(),
          FormError(errors: errors),
          WidgetUtil.normalVerticalSpace(),
          SimpleButton(
            text: strings.LABEL_CONTINUE,
            onTap: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                // Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
        style: KTextStyle.textFieldHeading,
        obscureText: true,
        onSaved: (newValue) => conform_password = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: strings.kPassNullError);
          } else if (value.isNotEmpty && password == conform_password) {
            removeError(error: strings.kMatchPassError);
          }
          conform_password = value;
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: strings.kPassNullError);
            return "";
          } else if ((password != value)) {
            addError(error: strings.kMatchPassError);
            return "";
          }
          return null;
        },
        decoration:
            boxStyle(strings.LABEL_CONFIRM_PASSWORD, strings.kPassNullError));
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
        obscureText: true,
        style: KTextStyle.textFieldHeading,
        onSaved: (newValue) => password = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: strings.kPassNullError);
          } else if (value.length >= 8) {
            removeError(error: strings.kShortPassError);
          }
          password = value;
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: strings.kPassNullError);
            return "";
          } else if (value.length < 8) {
            addError(error: strings.kShortPassError);
            return "";
          }
          return null;
        },
        decoration: boxStyle(strings.LABEL_PASSWORD, strings.kPassNullError));
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
        style: KTextStyle.textFieldHeading,
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => email = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: strings.kEmailNullError);
          } else if (strings.emailValidatorRegExp.hasMatch(value)) {
            removeError(error: strings.kInvalidEmailError);
          }
          return null;
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: strings.kEmailNullError);
            return "";
          } else if (!strings.emailValidatorRegExp.hasMatch(value)) {
            addError(error: strings.kInvalidEmailError);
            return "";
          }
          return null;
        },
        decoration: boxStyle(strings.LABEL_EMAIL, strings.kEmailNullError));
  }

  TextFormField buildNameFormField() {
    return TextFormField(
        style: KTextStyle.textFieldHeading,
        keyboardType: TextInputType.name,
        onSaved: (newValue) => name = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: strings.kNamelNullError);
          }
          return null;
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: strings.kNamelNullError);
            return "";
          }
          return null;
        },
        decoration: boxStyle(strings.LABEL_NAME, strings.kNamelNullError));
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
        style: KTextStyle.textFieldHeading,
        keyboardType: TextInputType.text,
        onSaved: (newValue) => address = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: strings.kAddressNullError);
          }
          return null;
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: strings.kAddressNullError);
            return "";
          }
          return null;
        },
        decoration: boxStyle(strings.LABEL_ADDRESS, strings.kAddressNullError));
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
        style: KTextStyle.textFieldHeading,
        keyboardType: TextInputType.phone,
        onSaved: (newValue) => phone = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: strings.kPhoneNumberNullError);
          }
          return null;
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: strings.kPhoneNumberNullError);
            return "";
          }
          return null;
        },
        decoration:
            boxStyle(strings.LABEL_PHONE, strings.kPhoneNumberNullError));
  }

  TextFormField buildOrganizationFormField() {
    return TextFormField(
        style: KTextStyle.textFieldHeading,
        keyboardType: TextInputType.text,
        onSaved: (newValue) => organization = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: strings.kOrganizationNullError);
          }
          return null;
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: strings.kOrganizationNullError);
            return "";
          }
          return null;
        },
        decoration: boxStyle(
            strings.LABEL_ORGANIZATION, strings.kOrganizationNullError));
  }

  DropdownButtonFormField buildUserTypeFormField() {
    return DropdownButtonFormField(
      style: KTextStyle.textFieldHeading,
      icon: const Icon(Icons.keyboard_arrow_down_sharp),
      onSaved: (newValue) => userType = newValue,
      value: userType,
      onChanged: (v) {
        if (v.isNotEmpty) {
          removeError(error: strings.kUserTypeNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: strings.kUserTypeNullError);
          return "";
        }
        return null;
      },
      dropdownColor: appColor.whiteshade,

      decoration: boxStyle(strings.LABEL_USER_TYPE, strings.kUserTypeNullError),
      items: userTypes,
    );
  }

  boxStyle(String label, String hint) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      hintStyle: KTextStyle.textFieldHintStyle,
      labelStyle: KTextStyle.textFieldHeading,
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      enabledBorder:
          const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      border: const OutlineInputBorder(),
    );
  }
}
