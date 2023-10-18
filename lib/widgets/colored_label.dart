
import 'package:flutter/cupertino.dart';



class ColorLabelWidget extends StatelessWidget {
  String label;
  Color color;
  IconData? icon;

  ColorLabelWidget({
    Key? key,
    required this.label,
    required this.color,
    this.icon,

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 30,
          padding:const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.4),
            borderRadius: BorderRadius.circular(5),
          ),
          child:  icon == null ?
          Text(
            label,
            style:TextStyle( color:color,fontSize: 10),
          ):
          Icon(icon, size: 20,color: color)

      );
  }
}