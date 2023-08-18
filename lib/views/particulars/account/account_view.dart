// ignore_for_file: use_build_context_synchronously

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:oppuss/api/auth_provider.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/views/particulars/home_screen.dart';
// import 'package:oppuss/views/particulars/account/about.dart';
// import 'package:oppuss/views/particulars/account/help.dart';
// import 'package:oppuss/views/particulars/account/safe.dart';
// import 'package:oppuss/views/particulars/account/settings.dart';
import 'package:oppuss/widget/customized_appbar.dart';
import 'package:oppuss/widget/particular/app_widgets.dart';
import 'package:provider/provider.dart';
import 'notification_view.dart';
import 'profile_edit_view.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  String? username;

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context, listen: false);
    setState(() {
      username = authProvider.currentUser?.username;
    });
    return Scaffold(
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
              Get.to(() => const EditProfilePage(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: durationAnime));
            },
          ),
          ProfileMenuWidget(
            text: "Notifications",
            icons: EvaIcons.bellOutline,
            press: (){
              Get.to(() => const NotificationView(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: durationAnime));
            }
          ),
          const SizedBox(height: 20,),
          const TextProfileManageWidget(text: "Informations utiles"),
          ProfileMenuWidget(
            text: "Paramètre",
            icons: EvaIcons.options2Outline,
            press: (){
              toast(context, "Coming Soon");
              //Get.to(() => const SettingsView(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: durationAnime));
            }
          ),
          ProfileMenuWidget(
            text: "Centre d'aide",
            icons: EvaIcons.questionMarkCircleOutline,
            press: (){
              toast(context, "Coming Soon");
              //Get.to(() => const HelpView(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: durationAnime));
            }
          ),
          ProfileMenuWidget(
            text: "Confidentialité et sécurité",
            icons: EvaIcons.shieldOutline,
            press: (){
              toast(context, "Coming Soon");
              //Get.to(() => const SafeView(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: durationAnime));
            }
          ),
          ProfileMenuWidget(
            text: "Devenir Ouvrier",
            icons: EvaIcons.briefcaseOutline,
            press: (){
              toast(context, "Coming Soon");
            }
          ),
          const SizedBox(height: 20,),
          const TextProfileManageWidget(text: "Autres"),
          ProfileMenuWidget(
            text: "À propos",
            icons: EvaIcons.alertCircleOutline,
            press: (){
              toast(context, "Coming Soon");
              //Get.to(() => const AboutView(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: durationAnime));
            }
          ),
          ProfileMenuWidget(
            text: "Se déconnecter",
            icons: EvaIcons.logOutOutline,
            press: () async{
              showDialog(context: context, builder: (context){
                return Center(child: LoadingAnimationWidget.inkDrop(color: primaryColor, size: 50),);
              });
              await Future.delayed(const Duration(seconds: 1));
              if (await authProvider.logout()) {
                
                Navigator.pop(context);
                setState(() {
                  messageBox(context, "Vous êtes déconnecté ");
                  authProvider = Provider.of<AuthProvider>(context, listen: false);
                });
                Get.offAll(() => const HomeScreen(), transition: Transition.fadeIn, duration: const Duration(milliseconds: durationAnime));
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
