import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oppuss/api/api.dart';
import 'package:oppuss/api/auth_provider.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/views/particulars/notification_view.dart';
import 'package:oppuss/views/particulars/profile_edit_view.dart';
import 'package:oppuss/views/auth/sign_up_ouvrier.dart';
import 'package:oppuss/widget/button_widget_app.dart';
import 'package:oppuss/widget/customized_appbar.dart';
import 'package:oppuss/widget/particular/app_widgets.dart';
import 'package:provider/provider.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  String? username;

  
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    setState(() {
      username = authProvider.currentUser?.username;
    });
    return !authProvider.isAuthenticated? Scaffold(
      backgroundColor: white,
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05, left: 15),
            child: customeTextStyle("Votre Compte", black, size: 30, fontWeight: FontWeight.bold),
          ),

          Container(
            margin: const EdgeInsets.only(top: 10, left: 15,),
            child: customeTextStyle("Inscrivez-vous pour pouvoir planifier vos future", grey2)
          ),

          Container(
            margin: const EdgeInsets.only(top: 6, left: 15),
            child: customeTextStyle("travaux et trouver un ouvrier qualifié", grey2)
          ),

          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 1,
                    backgroundColor: primaryColor,
                    minimumSize: Size(MediaQuery.of(context).size.height*0.43, 50),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    )
                  ),
                  onPressed: (){context.go("/home/user_register");},
                  child: customeTextStyle("S'inscrire", white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.only(top: 10, left: 15),
            padding: const EdgeInsets.all(4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                customeTextStyle("Vous avez déjà un compte ?", grey2),
                TextButton(
                  onPressed: (){context.go("/home/login");},
                  child: customeTextStyle("Se connecter", primaryColor, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
         
          Container(
            margin: const EdgeInsets.only(left: 15),
            padding: const EdgeInsets.all(4),
            child: customeTextStyle("Informations utiles", black),
          ),
          ProfileMenuWidget(
            text: "Paramètre",
            icons: EvaIcons.options2Outline,
            press: (){
                context.go("/home/settings");
            }
          ),
          ProfileMenuWidget(
            text: "Centre d'aide",
            icons: EvaIcons.questionMarkCircleOutline,
            press: (){
              context.go("/home/help");
            }
          ),
          ProfileMenuWidget(
            text: "Confiance et sécurité",
            icons: EvaIcons.shieldOutline,
            press: (){
              context.go("/home/safe");
            }
          ),
          ProfileMenuWidget(
            text: "Devenir Ouvrier",
            icons: EvaIcons.briefcaseOutline,
            press: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => const SignUpScreenOuvrier()));
            }
          ),
          const SizedBox(height: 20,),
          const TextProfileManageWidget(text: "Autres"),
          ProfileMenuWidget(
            text: "À propos",
            icons: EvaIcons.alertCircleOutline,
            press: (){
              context.go("/home/about");
            }
          ),
        ],
      )
    )
    :
    Scaffold(
      appBar: CustomAppBar("Compte",context),
      backgroundColor: white,
      body: ListView(
        children: [
          ProfilePictureWidget(username ?? "person"),
          const SizedBox(height: 10,),
          const TextProfileManageWidget(text: "Gérer mon compte"),
          ProfileMenuWidget(
            text: "Informations personnelles",
            icons: EvaIcons.personOutline,
            press: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => const EditProfilePage()));
            },
          ),
          ProfileMenuWidget(
            text: "Notifications",
            icons: EvaIcons.bellOutline,
            press: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => const NotificationView()));
            }
          ),
          const SizedBox(height: 20,),
          const TextProfileManageWidget(text: "Informations utiles"),
          ProfileMenuWidget(
            text: "Paramètre",
            icons: EvaIcons.options2Outline,
            press: (){
                context.go("/home/settings");
            }
          ),
          ProfileMenuWidget(
            text: "Centre d'aide",
            icons: EvaIcons.questionMarkCircleOutline,
            press: (){
              context.go("/home/help");
            }
          ),
          ProfileMenuWidget(
            text: "Confidentialité et sécurité",
            icons: EvaIcons.shieldOutline,
            press: (){
              context.go("/home/safe");
            }
          ),
          ProfileMenuWidget(
            text: "Devenir Ouvrier",
            icons: EvaIcons.briefcaseOutline,
            press: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => const SignUpScreenOuvrier()));
            }
          ),
          const SizedBox(height: 20,),
          const TextProfileManageWidget(text: "Autres"),
          ProfileMenuWidget(
            text: "À propos",
            icons: EvaIcons.alertCircleOutline,
            press: (){
              context.go("/home/about");
            }
          ),
          ProfileMenuWidget(
            text: "Se déconnecter",
            icons: EvaIcons.logOutOutline,
            press: () async{
              showDialog(context: context, builder: (context){
                return Center(child: CircularProgressIndicator(color: primaryColor,));
              });
              await Future.delayed(const Duration(seconds: 1));
              authProvider.logout();
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
              setState(() {
                messageBox(context, "Vous êtes déconnecté :(");
              });
            }
          ),
          const AboutVersionAppWidget()
        ]
      ),
    );
  }
}
