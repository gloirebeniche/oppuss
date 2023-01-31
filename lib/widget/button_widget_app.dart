import 'package:flutter/material.dart';
import 'package:oppuss/utils/theme.dart';

final ButtonStyle primaryButton = ElevatedButton.styleFrom(
  minimumSize: const Size(327, 50),
  elevation: 1,
  backgroundColor: primaryColor,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(50))
  )
);

final ButtonStyle primaryOutlinedButton = ElevatedButton.styleFrom(
  minimumSize: const Size(327, 50),
  elevation: 1,
  backgroundColor: white,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(50))
  )
);

class BtnCustom extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final Color? textColor;
  final VoidCallback? onPressed;
  const BtnCustom(
      {super.key, this.buttonText, this.buttonColor, this.onPressed, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: buttonColor,
            border: Border.all(width: 1, color: primaryColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              buttonText!,
              style:  TextStyle(
                  color: textColor, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}


Container CustomButton(String text, VoidCallback onPressed){
  return Container(
    margin: margin,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(45)),
    child: ElevatedButton(
      onPressed: onPressed,
      style: primaryButton,
      child: Padding(
        padding: padding,
        child: customeTextStyle(text, headingTextSize, white),),
    ),
  );
}

Container CustomOutlinedButton(String text, VoidCallback onPressed){
  return Container(
    margin: margin,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(45)),
    child: OutlinedButton(
      onPressed: onPressed,
      style: primaryOutlinedButton,
      child: Padding(
        padding: padding,
        child: customeTextStyle(text, headingTextSize, black),),
    ),
  );
}

ElevatedButton defaultButton(String text, VoidCallback onPress, {btnColor = secondaryColor, colorText = textColor}){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: btnColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(6))
      )
    ),
    onPressed: onPress,
    child: Padding(
      padding: padding,
      child: titleTextStyle(text, color: colorText, fontWeight: FontWeight.bold),
    ),
  );
}


