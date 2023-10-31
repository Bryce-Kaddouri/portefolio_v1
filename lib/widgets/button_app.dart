import 'package:flutter/material.dart';
import 'package:portefolio/util/app_constant.dart';

class ButtonApp extends StatelessWidget {
  String? text;
  Color? bgColor;
  Color? onHoverColor;
  Color? textColor;
  Color? borderColor;
  Color? onHoverTextColor;
  Color? onHoverBorderColor;
  VoidCallback? onPressed;
  double? width;
  double? height;

  ButtonApp({
    super.key,
    this.text,
    this.bgColor,
    this.textColor,
    this.borderColor,
    this.onHoverColor,
    this.onHoverTextColor,
    this.onHoverBorderColor,
    this.onPressed,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onHover: (value) {
        print(value);
        if (value) {
          bgColor = onHoverColor;
          textColor = onHoverTextColor;
          borderColor = onHoverBorderColor;
        } else {
          bgColor = bgColor;
          textColor = textColor;
          borderColor = borderColor;
        }
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor ?? Colors.white,
        backgroundColor: bgColor ?? AppConstant.APP_SOLID_BACKGROUND_COLOR,
        fixedSize: Size(width ?? 200, height ?? 30),
        side: borderColor != null
            ? BorderSide(
                color: borderColor!,
                width: 1,
              )
            : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {},
      child: Text("Button"),
    );
  }
}
