import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oppuss/views/particulars/notification_view.dart';
import 'package:oppuss/views/particulars/profile_edit_view.dart';
import 'package:oppuss/views/auth/sign_up_ouvrier.dart';
import 'package:oppuss/widget/customized_appbar.dart';
import 'package:oppuss/widget/particular/app_widgets.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Compte",context),
      body: ListView(
        children: [
          const ProfilePictureWidget(),
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
          ProfileMenuWidget(
            text: "Se déconnecter",
            icons: EvaIcons.logOutOutline,
            press: (){}
          ),
          const AboutVersionAppWidget()
        ]
      ),
    );
  }
}
