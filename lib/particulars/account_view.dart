import 'package:flutter/material.dart';
import 'package:oppuss/particulars/notification_view.dart';
import 'package:oppuss/particulars/profile_edit_view.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/views/auth/sign_up_ouvrier.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: kglobalColor,
          automaticallyImplyLeading: false,
          title:const Text("Compte", style: TextStyle(color: KTextColor),),
      ),
      body: ListView(
        children: [
          const ProfilePicture(),
          const SizedBox(height: 10,),
          const textProfileManage(text: "Gérer mon compte"),
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
          const textProfileManage(text: "Informations utiles"),
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
          const textProfileManage(text: "Autres"),
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
          const AboutVersionApp()
        ]
      ),
    );
  }
}

class AboutVersionApp extends StatelessWidget {
  const AboutVersionApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: const [
          Text("Oppus", style: TextStyle(color: Colors.black54, fontSize: 13,)),
          Text("v1.1.1.101", style: TextStyle(color: Colors.black54, fontSize: 13,))
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class textProfileManage extends StatelessWidget {
  const textProfileManage({
    Key? key, required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Text(
        text,
        style:  const TextStyle(color: Colors.black54, fontSize: 15,)
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key, required this.text, required this.icon, required this.press,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        onPressed: press,
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
              color: Colors.blue,),
            const SizedBox(width: 20,),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                  Text(text,
                  style: const TextStyle(color: Colors.black, fontSize: 15,)),
                  const SizedBox(height: 10,),
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

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
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
                  const CircleAvatar(backgroundColor: Colors.grey),
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
                          side: const BorderSide(color: Colors.white)
                        ),
                        color: const Color(0xFFF5F6F9),
                        child: const Icon(Icons.camera_alt_rounded, color: Colors.grey,),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("@KBjeanelie",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
} 