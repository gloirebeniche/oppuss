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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar2("", context),
        body: !authProvider.isAuthenticated? cardAuth(context) :Column(
          children: const [
             ProfilePictureWorker(),
            TabBar(
              labelColor: Colors.black,
              tabs: [
                Tab(text: "À propos",),
                Tab(text: "Portofolio",),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Icon(Icons.directions_car),
                  Icon(Icons.directions_transit),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ProfilePictureWorker extends StatelessWidget {
  const ProfilePictureWorker({
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
    );
  }
} 