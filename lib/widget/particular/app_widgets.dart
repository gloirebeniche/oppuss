
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oppuss/utils/theme.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key, required this.text, required this.icons, required this.press,
  }) : super(key: key);

  final String text;
  final IconData icons;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextButton(
        onPressed: press,
        child: Row(
          children: [
            icon2(icons),
            spacingWidth2,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                  customeTextStyle(text, 14, black, fontWeight: FontWeight.bold),
                  spacingHeight,
                  const Divider(height: 1, thickness: 2,)
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}


class AboutVersionAppWidget extends StatelessWidget {
  const AboutVersionAppWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          customeTextStyle("Oppus", smallTextSize, grey2),
          customeTextStyle("v2.1.1", smallTextSize, grey)
        ],
      ),
    );
  }
}

class ProfilePictureWidget extends StatelessWidget {
  const ProfilePictureWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children:  [
            SizedBox(
              height: 110,
              width: 110,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  const CircleAvatar(backgroundColor: grey),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: SizedBox(
                      height: 35,
                      width: 35,
                      child: MaterialButton(
                        onPressed: (){},
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                          side: const BorderSide(color: white)
                        ),
                        color: white,
                        child: const Icon(EvaIcons.cameraOutline, color: iconColor,),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text("@KBjeanelie",
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: textSize,
                  fontWeight: FontWeight.bold,
                  color: grey2)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
} 


class TextProfileManageWidget extends StatelessWidget {
  const TextProfileManageWidget({
    Key? key, required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: customeTextStyle(text, 12, grey2),
    );
  }
}