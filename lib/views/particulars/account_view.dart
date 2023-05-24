// ignore_for_file: use_build_context_synchronously

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oppuss/api/api.dart';
import 'package:oppuss/api/auth_provider.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/views/auth/login_screen.dart';
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
    return !authProvider.isAuthenticated? const LoginScreen()
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
              if (await authProvider.logout()) {
                
                Navigator.pop(context);
                setState(() {
                  messageBoxSuccess(context, "Vous êtes déconnecté ");
                });
              }else{
                Navigator.pop(context);
                setState(() {
                  messageBox(context, "ERROR : impossible de se déconnecter");
                });
              }
              
            }
          ),
          const AboutVersionAppWidget()
        ]
      ),
    );
  }
}
