import 'package:flutter/material.dart';
import 'package:flutter_dio/models/add_product_model.dart';
import 'package:flutter_dio/res/app_color.dart';
import 'package:get/get.dart';

import '../../../res/strings.dart';
import '../../../utils/my_application.dart';
import '../../../utils/size_config.dart';
import '../../../utils/widget_util.dart';
import '../../../widgets/progressbutton/iconed_button.dart';
import '../../../widgets/progressbutton/progress_button.dart';
import '../../../widgets/text_styles.dart';
import '../../widgets/form_error.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  String? category;
  String? name;
  String? price;
  String? quantity;
  String? organization;
  final List<String?> errors = [];




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
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       Scaffold(
        appBar: AppBar(
          title: const Text('Add Product'),
        ),
   body: SafeArea(
      child: SizedBox(
      width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                WidgetUtil.normalVerticalSpace(),
                const Text( "Enter your Product details",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),

                ),
                WidgetUtil.normalVerticalSpace(height: 30),
                bodyWidget(context),
                WidgetUtil.normalVerticalSpace(height: SizeConfig.screenHeight * 0.08),

              ],
            ),
          ),
        ),
      ),
      ),
      ),
    );
  }



  Widget bodyWidget(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildNameFormField(),
          WidgetUtil.normalVerticalSpace(),
          buildCategoryFormField(),
          WidgetUtil.normalVerticalSpace(),
          buildOrganizationFormField(),
          WidgetUtil.normalVerticalSpace(),
          buildPriceFormField(),
          WidgetUtil.normalVerticalSpace(),
          buildQuantityFormField(),
          WidgetUtil.normalVerticalSpace(),

          FormError(errors: errors),
          WidgetUtil.normalVerticalSpace(),


          createAddProductButton((){
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();

              var product = AddProduct(
                name: name,
                price: double.parse(price.safeGet()),
                orgId: organization,
                category: category,
                availableQuantity: int.parse(quantity.safeGet()),
              );

              app.appController.addNewProducts(product);

            }


          }),


        ],
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
        style: KTextStyle.textFieldHeading,
        keyboardType: TextInputType.name,
        onSaved: (newValue) => name = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: strings.kPNNullError);
          }
          return null;
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: strings.kPNNullError);
            return "";
          }
          return null;
        },
        decoration: boxStyle(strings.LABEL_NAME, strings.kNamelNullError));
  }

  TextFormField buildCategoryFormField() {
    return TextFormField(
        style: KTextStyle.textFieldHeading,
        keyboardType: TextInputType.text,
        onSaved: (newValue) => category = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: strings.kPCNullError);
          }
          return null;
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: strings.kPCNullError);
            return "";
          }
          return null;
        },
        decoration: boxStyle(strings.LABEL_CATEGORY, strings.kPCNullError));
  }

  TextFormField buildOrganizationFormField() {
    return TextFormField(
        style: KTextStyle.textFieldHeading,
        keyboardType: TextInputType.text,
        onSaved: (newValue) => organization = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: strings.kPONullError);
          }
          return null;
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: strings.kPONullError);
            return "";
          }
          return null;
        },
        decoration: boxStyle(strings.LABEL_ORGANIZATION, strings.kPONullError));
  }


  TextFormField buildPriceFormField() {
    return TextFormField(
        style: KTextStyle.textFieldHeading,
        keyboardType: TextInputType.number,
        onSaved: (newValue) => price = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: strings.kPPNullError);
          }
          return null;
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: strings.kPPNullError);
            return "";
          }
          return null;
        },
        decoration: boxStyle(strings.LABEL_PRICE, strings.kPPNullError));
  }

  TextFormField buildQuantityFormField() {
    return TextFormField(
        style: KTextStyle.textFieldHeading,
        keyboardType: TextInputType.number,
        onSaved: (newValue) => quantity = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: strings.kPQNullError);
          }
          return null;
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: strings.kPQNullError);
            return "";
          }
          return null;
        },
        decoration: boxStyle(strings.KQuantity, strings.kPQNullError));
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


  createAddProductButton(Function onPressed)
  {
    return ProgressButton.icon(iconedButtons: {
      ButtonState.idle:
      IconedButton(
          text: "Add Product",
          icon: Icon(Icons.add,color: Colors.white),
          color: appColor.main),
      ButtonState.loading:
      IconedButton(
          text: "Loading",
          color: appColor.main),
      ButtonState.fail:
      IconedButton(
          text: "Failed",
          icon: Icon(Icons.cancel,color: Colors.white),
          color: Colors.red.shade300),
      ButtonState.success:
      IconedButton(
          text: "Success",
          icon: Icon(Icons.check_circle,color: Colors.white,),
          color: Colors.green.shade400)
    },
        onPressed: onPressed,
        state: app.appController.getProductButtonState);
  }
}