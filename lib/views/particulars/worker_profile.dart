import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:oppuss/api/api.dart';
import 'package:oppuss/api/auth_provider.dart';
import 'package:oppuss/utils/theme.dart';
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
          const ProfilePictureWorker(),
          Container(
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
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  color: white,
                  width: double.infinity,
                  padding: padding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customeTextStyle("Expérience", 20, black),
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
                      customeTextStyle("Licences & Certifications", 20, black),
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
                backgroundColor: grey,
                radius: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: customeTextStyle("Philippe", 13, black, fontWeight: FontWeight.bold),
              ),
              const Icon(EvaIcons.star, color: Colors.yellow, size: 20,),
              const Icon(EvaIcons.star, color: Colors.yellow, size: 20,),
              const Icon(EvaIcons.star, color: Colors.yellow, size: 20,),
              const Icon(EvaIcons.star, color: Colors.yellow, size: 20,)
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

class ProfilePictureWorker extends StatelessWidget {
  const ProfilePictureWorker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children:  [
              SizedBox(
                height: 80,
                width: 80,
                child: Stack(
                  fit: StackFit.expand,
                  children: const [
                    CircleAvatar(backgroundColor: Colors.grey),
                    // Positioned(
                    //   right: 0,
                    //   top: 0,
                    //   child: SizedBox(
                    //     height: 25,
                    //     width: 25,
                    //     child: MaterialButton(
                    //       onPressed: (){},
                    //       padding: EdgeInsets.zero,
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(35),
                    //         side: const BorderSide(color: Colors.white)
                    //       ),
                    //       color: Colors.white,
                    //       child: const Icon(EvaIcons.ver, color: Colors.green,),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text("Elijah Walter",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.star, color: Colors.amber, size: 17,),
                  Text("4,95",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber),
                  ),
                  Text(" (105 avis)",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                  ),
                ],
              ),
              const Text("Membre depuis 4 mois",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45),
              ),
              const Text("50 jobs réalisés",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Container(
                width: 140,
                child: verifyWorker(),
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 1,
                        backgroundColor: primaryColor,
                        minimumSize: const Size(170, 40),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        )
                      ),
                      onPressed: (){},
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Row(
                          children: [
                            const Icon(EvaIcons.phoneCallOutline, color: white, size: 20,),
                            Padding(padding: const EdgeInsets.only(left: 5), child: customeTextStyle("Appeler", textSizeH2, white))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: OutlinedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 1,
                        backgroundColor: white,
                        minimumSize: const Size(170, 40),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        )
                      ),
                      onPressed: (){},
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Row(
                          children: [
                            icon2(EvaIcons.paperPlaneOutline),
                            Padding(padding: const EdgeInsets.only(left: 5), child: customeTextStyle("Écrire", textSizeH2, primaryColor))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
} 