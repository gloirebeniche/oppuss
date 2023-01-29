import 'package:flutter/material.dart';
import 'package:oppuss/views/particulars/notification_view.dart';
import 'package:oppuss/views/particulars/profile_edit_view.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/views/auth/sign_up_ouvrier.dart';
import 'package:oppuss/widget/particular/app_widgets.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: bgColor,
          automaticallyImplyLeading: false,
          title:const Text("Compte", style: TextStyle(color: textColor, fontSize: 25),),
      ),
      body: ListView(
        children: [
          const ProfilePictureWidget(),
          const SizedBox(height: 10,),
          const TextProfileManageWidget(text: "Gérer mon compte"),
          ProfileMenuWidget(
            text: "Informations personnelles",
            icon: Icons.person,
            press: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => const EditProfilePage()));
            }
          ),
          ProfileMenuWidget(
            text: "Notifications",
            icon: Icons.notifications_active,
            press: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => const NotificationView()));
            }
          ),
          const SizedBox(height: 20,),
          const TextProfileManageWidget(text: "Informations utiles"),
          ProfileMenuWidget(
            text: "Paramètre",
            icon: Icons.settings,
            press: (){}
          ),
          ProfileMenuWidget(
            text: "Centre d'aide",
            icon: Icons.help,
            press: (){}
          ),
          ProfileMenuWidget(
            text: "Confiance et sécurité",
            icon: Icons.safety_check,
            press: (){}
          ),
          ProfileMenuWidget(
            text: "Devenir Ouvrier",
            icon: Icons.work,
            press: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => const SignUpScreenOuvrier()));
            }
          ),
          const SizedBox(height: 20,),
          const TextProfileManageWidget(text: "Autres"),
          ProfileMenuWidget(
            text: "À propos",
            icon: Icons.info_rounded,
            press: (){}
          ),
          ProfileMenuWidget(
            text: "Se déconnecter",
            icon: Icons.logout,
            press: (){}
          ),
          const AboutVersionAppWidget()
        ]
      ),
    );
  }
}
