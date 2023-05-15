import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oppuss/api/auth_provider.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/widget/button_widget_app.dart';
import 'package:oppuss/widget/customized_appbar.dart';
import 'package:oppuss/widget/particular/app_widgets.dart';
import 'package:provider/provider.dart';


class WorkerProfile extends StatefulWidget {
  const WorkerProfile({super.key});

  @override
  State<WorkerProfile> createState() => _WorkerProfileState();
}

class _WorkerProfileState extends State<WorkerProfile> {

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: CustomAppBar2("", context),
      backgroundColor: Colors.grey.shade300,
      body: //!authProvider.isAuthenticated? cardAuth(context) :
      ListView(
        children: [

          //GRANDE IMAGE ET PHOTO DE PROFIL DE L'OUVRIER
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.23,
                color: white,
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/bg-user.jpg"), fit: BoxFit.cover)
                ),
              ),
              const Positioned(
                top: 90,
                left: 20,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/worker.jpg"),
                  radius: 45,
                ),
              )
            ],
          ),

          // CETTE PARTIE CONCERNE LES INFORMATION PERSONNELLE DE L'OUVRIER
          Container(
            color: white,
            padding: padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customeTextStyle("Jean-Elie KUBEMBULA", 15, black, fontWeight: FontWeight.bold),
                customeTextStyle("Plombier", 13, black),
                customeTextStyle("Brazzaville, République du Congo", 13, black),
                customeTextStyle("50 Travaux réalisé", 14, black, fontWeight: FontWeight.bold),
                defaultButtonOutlined("Message", (){context.go("/home/message");})
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 25, top: 15),
                  color: white,
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 5),
                  child: customeTextStyle("À propos", 20, black)),
                Container(
                  color: white,
                  padding: const EdgeInsets.only(left: 25, right: 25, bottom: 5),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: customeTextStyle(" Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. Pellentesque congue. Ut in risus volutpat libero pharetra tempor. ", 
                    13, black),
                  ),
                ),

                // CETTE PARTIE CONCERNE LES EXPERIENCE
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  color: white,
                  width: double.infinity,
                  padding: padding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customeTextStyle("Expérience", 20, black),
                      experience_card(),
                      experience_card(),
                      experience_card(),
                      experience_card(),
                      experience_card(),
                      experience_card(),
                    ]
                  ),
                ),

                // CETTE PARTIE CONCERNE LES LICENSE ET CERTIFICATION
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  color: white,
                  width: double.infinity,
                  padding: padding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customeTextStyle("Licences & Certifications", 20, black),
                      certification_card(),
                      certification_card(),
                      certification_card(),
                      certification_card(),
                    ]
                  ),
                ),

                // CETTE PARTIE CONCERNE LES COMPETENCES
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  color: white,
                  width: double.infinity,
                  padding: padding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customeTextStyle("Compétences professionel", 20, black),
                      Wrap(
                        children: [
                          competences("Travail en équipe"),
                          competences("Contruction"),
                          competences("Communication"),
                          competences("Gestion de projet"),
                          competences("ORC"),
                          competences("Contruction"),
                          competences("Communication"),
                          competences("Gestion de projet"),
                          competences("Travail en équipe"),
                          competences("ORC"),
                        ],
                      )
                    ]
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  color: white,
                  width: double.infinity,
                  padding: padding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customeTextStyle("Avis & Commentaire", 20, black),
                      testimonyWidget(),
                      const Divider(thickness: 0.5, color: grey),
                      testimonyWidget(),
                      const Divider(thickness: 0.5, color: grey),
                      testimonyWidget(),
                      const Divider(thickness: 0.5, color: grey),
                      testimonyWidget(),
                      const Divider(thickness: 0.5, color: grey),
                      testimonyWidget(),
                      const Divider(thickness: 0.5, color: grey),
                      testimonyWidget(),
                      const Divider(thickness: 0.5, color: grey),
                      testimonyWidget(),
                      const Divider(thickness: 0.5, color: grey),
                      testimonyWidget(),
                      const Divider(thickness: 0.5, color: grey),
                      testimonyWidget(),
                    ]
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


Container experience_card(){
  return Container(
    margin: const EdgeInsets.only(top: 20),
    child: Row(
      children: [
        const SizedBox(
          height: 50,
          width: 50,
          child: Image(image: AssetImage("assets/firm.png")),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customeTextStyle("Plombier", 15, black, fontWeight: FontWeight.bold),
                customeTextStyle("SOGECOP : CDD", 13, black),
                customeTextStyle("déc.2022 - janv 2023", 13, black),
                customeTextStyle("Brazzaville, République du Congo", 13, black),
                customeTextStyle("Description: ici", 13, black),
              ],
            ),
          ),
        )
      ],
    ),
  );
}



Container certification_card(){
  return Container(
    margin: const EdgeInsets.only(top: 20),
    child: Row(
      children: [
        const SizedBox(
          height: 50,
          width: 50,
          child: Image(image: AssetImage("assets/univ3.png")),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customeTextStyle("L'essentiel de Python 3", 15, black, fontWeight: FontWeight.bold),
                customeTextStyle("Par : LinkedIn", 13, black),
                customeTextStyle("Diplôme : Licence", 13, black),
                customeTextStyle("Domaine d'étude : Génie Logiciel", 13, black),
                customeTextStyle("Date de délivrance : mai 2023", 13, black),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Container testimonyWidget(){
  return Container(
    margin: const EdgeInsets.only(top: 15),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                backgroundImage: AssetImage("assets/user.png"),
                radius: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: customeTextStyle("Philippe", 13, black, fontWeight: FontWeight.bold),
              ),
              const Icon(EvaIcons.star, color: Colors.amber, size: 20,),
              const Icon(EvaIcons.star, color: Colors.amber, size: 20,),
              const Icon(EvaIcons.star, color: Colors.amber, size: 20,),
              const Icon(EvaIcons.star, color: Colors.amber, size: 20,)
              ],
            ),
            customeTextStyle("il y a 7 jours", 13, grey)
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: customeTextStyle("Philipe a été d'un professionnaliste incroyable! Il a été très agréable également. Il a vraiment du coeur à réaliser un travail impécable. Nousle recommandons chaleureusement et les yeux fermés",
          13, black),
        )
      ],
    )
  );
}
