import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';


class AppButton extends StatelessWidget {

  final double width;
  final double height;
  final Color itemColor;
  final Color backgroundColor;
  final double itemSize;
  final Color borderColor;
  final Color textColor;
  final bool isIcon;
  final String? text;
  final IconData? icon;

   const AppButton({super.key, required this.width,required this.height, this.itemColor = Colors.white , this.backgroundColor = Colors.white,
      required this.itemSize, this.borderColor = Colors.white,this.text ='1',this.icon,this.isIcon = false,this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor,
          border: Border.all(color: borderColor,width: 1)
      ),
      child: isIcon?Center(child: Icon(icon,color: itemColor,)):Center(child: AppText(text: text.toString(),color: textColor,)),
    );
  }
}
