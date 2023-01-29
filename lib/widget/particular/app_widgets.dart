
import 'package:flutter/material.dart';
import 'package:oppuss/utils/theme.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key, required this.text, required this.icon, required this.press,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        onPressed: press,
        child: Row(
          children: [
            Icon(
              icon,
              size: 25,
              color: primaryColor,),
            const SizedBox(width: 20,),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                  Text(text,
                  style: const TextStyle(color: black, fontSize: textSize,)),
                  const SizedBox(height: 5,),
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
        children: const [
          Text("Oppus", style: TextStyle(color: grey2, fontSize: smallTextSize,)),
          Text("v1.2.1.1", style: TextStyle(color: grey2, fontSize: smallTextSize,))
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
                        child: const Icon(Icons.camera_alt_rounded, color: grey,),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text("@KBjeanelie",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: textSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
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
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Text(
        text,
        style:  const TextStyle(color: grey2, fontSize: smallTextSize,)
      ),
    );
  }
}