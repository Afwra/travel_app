import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  final bool isResponsive;
  final double? width;
  final void Function()? onTap;

  const ResponsiveButton({super.key, this.isResponsive = false, this.width,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: isResponsive? const EdgeInsets.only(left: 20) : EdgeInsets.zero,
          height: 60,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.mainColor,
          ),
          child: Row(
            mainAxisAlignment: isResponsive? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
            children: [
              isResponsive? AppText(text: 'Book Trip Now',color: Colors.white,):const SizedBox(),
              Image.asset('assets/images/button-one.png'),
            ],
          ),
        ),
      ),
    );
  }
}
