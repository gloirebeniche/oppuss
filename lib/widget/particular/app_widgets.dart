
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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

Center ProfilePictureWidget(String username){
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
              child: Text("@$username",
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
      children: [
        const Icon(EvaIcons.checkmarkCircle2, size: 15, color: Colors.white,),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: customeTextStyle("Ouvrier certifier et vérifier", 13, white),
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



Container competences(String label){
  return Container(
    margin: const EdgeInsets.only(top: 20, left: 5),
    padding: const EdgeInsets.fromLTRB(10,10,10,10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Colors.grey.shade200,),
    child: customeTextStyle(label, 12, black, fontWeight: FontWeight.bold)
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

Container cardWorker (String fullname){
  return Container(
    margin: const EdgeInsets.only(top: 10),
    color: Colors.white,
    child: Column(
      children: [
        Row(
          children: [
            const CircleAvatar(
              backgroundColor: white,
              radius: 40,
              backgroundImage: AssetImage("assets/worker.jpg"),
              ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  customeTextStyle(fullname, 15, black),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(EvaIcons.star, color: Colors.amber, size: 17,),
                        customeTextStyle("4,95", 13, black),
                        customeTextStyle("(105 avis)", 12, black)
                      ],
                    ),
                  ),
                  certifyWorker()
                ],
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customeTextStyle("Charpentier", 15, black),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    const Icon(EvaIcons.briefcase),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: customeTextStyle("5 à 9 d'expériences", 15, black),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}



Container cardAuth(BuildContext context){
  return Container(
    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.30, bottom: MediaQuery.of(context).size.height * 0.25),
    //height: MediaQuery.of(context).size.height * 0.5,
    child: Center(
      child: Column(
        children: [
          Icon(EvaIcons.person, size: 80, color: primaryColor,),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: customeTextStyle("Connectez vous pour contacter un ouvrier", textSizeH2, grey2)),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: defaultButton("Se connecter", (){context.go("/home/login");}),
          )
        ],
      ),
    ),
  );
}


Container cardMessageAuth(BuildContext context){
  return Container(
    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
    height: MediaQuery.of(context).size.height * 0.5,
    child: Center(
      child: Column(
        children: [
          Icon(EvaIcons.messageCircleOutline, size: 80, color: primaryColor,),
          customeTextStyle("Aucune discussion", 18, black, fontWeight: FontWeight.bold),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(5),
            child: customeTextStyle("Faire une demande de travaux pour", textSizeH2, grey2)),
          Container(
            child: customeTextStyle("pouvoir discuter avec votre ouvrier", textSizeH2, grey2),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: defaultButton("J'ai besoin d'un travaux", (){}),
          )
        ],
      ),
    ),
  );
}


Container cardOfferAuth(BuildContext context){
  return Container(
    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
    height: MediaQuery.of(context).size.height * 0.5,
    child: Center(
      child: Column(
        children: [
          Icon(EvaIcons.maximizeOutline, size: 80, color: primaryColor,),
          customeTextStyle("Aucune demande", 18, black, fontWeight: FontWeight.bold),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(5),
            child: customeTextStyle("Faire une demande de travaux et trouvez", textSizeH2, grey2)),
          Container(
            child: customeTextStyle("un ouvrier en quelque minutes", textSizeH2, grey2),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: defaultButton("J'ai besoin d'un travaux", (){}),
          )
        ],
      ),
    ),
  );
}

Container cardAuth2(BuildContext context){
  return Container(
    color: white,
    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
    //width: MediaQuery.of(context).size.height*0.5,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customeTextStyle("Votre Compte", bigTextSize4, black, fontWeight: FontWeight.bold),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: customeTextStyle("Inscrivez-vous pour pouvoir planifier vos future", textSizeH2, grey2),),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: customeTextStyle("travaux et trouver un ouvrier qualifié", textSizeH2, grey2),),
        
        Container(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 1,
              backgroundColor: primaryColor,
              minimumSize: Size(MediaQuery.of(context).size.height*0.4, 50),
              alignment: Alignment.center,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))
              )
            ),
            onPressed: (){},
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: titleTextStyle("text", color: white, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    ),
  );
}