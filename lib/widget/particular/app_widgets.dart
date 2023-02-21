
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/widget/button_widget_app.dart';

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


Container certifyWorker(){
  return Container(
    margin: const EdgeInsets.only(top: 5),
    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.blue,),
    child: Row(
      children: const [
        Icon(Icons.verified, size: 15, color: Colors.white,),
        Padding(
          padding: EdgeInsets.only(left: 5),
          child: Text("Ouvrier certifier et vérifier", style: TextStyle(color: Colors.white),),
        )
      ],
    ),
  );
}

Container verifyWorker(){
  return Container(
    margin: const EdgeInsets.only(top: 5),
    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.green,),
    child: Row(
      children: const [
        Icon(Icons.check_circle, size: 15, color: Colors.white,),
        Padding(
          padding: EdgeInsets.only(left: 5),
          child: Text("Ouvrier vérifier", style: TextStyle(color: Colors.white),),
        )
      ],
    ),
  );
}

Container cardOffer (BuildContext context){
  return Container(
    margin: const EdgeInsets.only(top: 10, bottom: 10),
    padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
    color: Colors.white,
    child: Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: Stack(
                fit: StackFit.expand,
                children:const [
                   CircleAvatar(backgroundColor: Colors.grey),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("Elijah Walter", style: TextStyle(color: Colors.black, fontSize: 15),),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.star, color: Colors.amber, size: 17,),
                        Text("4,95",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black),
                        ),
                        Text(" (105 avis)",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  certifyWorker()
                ],
              ),
            ),
            const Expanded(
              child: Text("500 XAF",
                textAlign: TextAlign.end,
                style: TextStyle(color: Color(0xFF363636), fontSize: 15),)
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Charpentier", style : TextStyle(color: Colors.grey, fontSize: 17)),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: const [
                    Icon(Icons.badge),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("5 à 9 d'expériences", style : TextStyle(color: Colors.black, fontSize: 15)),
                    )
                  ],
                ),
              ),
              Container(margin: const EdgeInsets.only(top: 10),
                child: Center(child: defaultButton("Reserver", (){}),)),
              Center(child: defaultButtonOutlined("Voir le profil", (){context.go("/home/offer_detail/worker_profile/");}),)
            ],
          ),
        )
      ],
    ),
  );
}