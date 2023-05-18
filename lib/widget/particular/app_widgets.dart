
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
            icon(icons, color: primaryColor, iconSize: 25),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                  Padding(
                    padding: padding,
                    child: customeTextStyle(text, black, fontWeight: FontWeight.bold, size: headingTextSize),
                  ),
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
          customeTextStyle("Oppus", grey2),
          customeTextStyle("v3.1.1", grey)
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
              height: 120,
              width: 120,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/user.png')),
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
                        child: icon(EvaIcons.cameraOutline),
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
                  textStyle:  TextStyle(
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
      child: customeTextStyle(text,  grey2),
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
          child: customeTextStyle("Ouvrier certifier et vérifier", white),
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
    child: customeTextStyle(label, black, fontWeight: FontWeight.bold)
  );
}

Container cardOffer (BuildContext context){
  return Container(
    margin: const EdgeInsets.only(top: 5),
    padding: padding,
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
                  customeTextStyle("Elijah Walter", black, size: headingTextSize, fontWeight: FontWeight.bold),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(EvaIcons.star, color: Colors.amber, size: 17,),
                        customeTextStyle("4,95", black),
                        customeTextStyle("(105 avis)", black)
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
              customeTextStyle("Charpentier",black),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    const Icon(EvaIcons.briefcase),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: customeTextStyle("5 à 9 d'expériences",black),
                    )
                  ],
                ),
              ),
              defaultButton("Reserver", (){}),
              defaultButtonOutlined("Voir le profil", (){context.go("/home/offer_detail/worker_profile/");})
            ],
          ),
        )
      ],
    ),
  );
}


Container cardWorker (String fullname, int nombreExperience, String metier, int nombreAvis){
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
                  customeTextStyle(fullname.toUpperCase(), black, size: 15, fontWeight: FontWeight.bold),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(EvaIcons.star, color: Colors.amber, size: 17,),
                        customeTextStyle("4,95", black),
                        customeTextStyle("($nombreAvis avis)", black)
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
              customeTextStyle(metier, black),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    const Icon(EvaIcons.briefcase),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: customeTextStyle("$nombreExperience d'expériences",  black),
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

Container cardComent(){
  return Container(
    color: white,
    width: double.infinity,
    margin: const EdgeInsets.only(top: 5),
    child: Row(
      children: [
        const CircleAvatar(
        backgroundColor: white,
        radius: 40,
        backgroundImage: AssetImage("assets/worker.jpg"),
      ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Non de l'ouvrier
                    customeTextStyle("Bakary", black, fontWeight: FontWeight.bold),
                    // date
                    customeTextStyle("il y a 4 jours", size:11, grey2)
                  ],
                ),
                // contenue
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: customeTextStyle(" Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. ",
                    black
                  ),
                )
              ],
            ),
          ),
        ),
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
            child: customeTextStyle("Connectez vous pour contacter un ouvrier", grey2)),
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
          customeTextStyle("Aucune discussion",  black, fontWeight: FontWeight.bold),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(5),
            child: customeTextStyle("Faire une demande de travaux pour", grey2)),
          Container(
            child: customeTextStyle("pouvoir discuter avec votre ouvrier", grey2),
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
          customeTextStyle("Aucune demande",  black, fontWeight: FontWeight.bold),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(5),
            child: customeTextStyle("Faire une demande de travaux et trouvez",  grey2)),
          Container(
            child: customeTextStyle("un ouvrier en quelque minutes", grey2),
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
        customeTextStyle("Votre Compte", black, fontWeight: FontWeight.bold),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: customeTextStyle("Inscrivez-vous pour pouvoir planifier vos future", grey2),),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: customeTextStyle("travaux et trouver un ouvrier qualifié", grey2),),
        
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
              child: customeTextStyle("text", black),
            ),
          ),
        )
      ],
    ),
  );
}