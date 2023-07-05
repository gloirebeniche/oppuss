/// ICI SE TROUVE TOUS LES WIDGETS CONCERNANT LES CARDS VIEW
/// DE TOUS LES INTERFACE QUI NECESSITE UN CARD VIEW POUR LE PARTICULIER

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/views/particulars/demande/offer_detail.dart';
import 'package:oppuss/widget/button_widget_app.dart';
import 'package:oppuss/widget/particular/app_widgets.dart';

Container CardOfferView(BuildContext context, String nom_travaux, String day, String hours, int id){
  return Container(
      margin: const EdgeInsets.only(top: 5),
      width: double.infinity,
      color: white,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("images/undraw_electricity_k2ft.png"),
                          fit: BoxFit.cover))),
            ),
            customeTextStyle(
                nom_travaux, size:headingTextSize, black,
                fontWeight: FontWeight.bold),
            
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: customeTextStyle(
                  "${formatDateString(day)} à partir de $hours",grey2),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(10),
              color: Colors.transparent,
              child: Row(
                children: [
                  const Icon(
                    EvaIcons.bellOutline,
                    size: 20,
                    color: textColorImportant,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: customeTextStyle("Vous avez reçu 13 offres",
                        textColorImportant,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            
            Row(
              children: [
                Expanded(
                  child: defaultButton("Gérer ma demande", (){
                    Get.to(() => OfferDetailView(id_offre: id,), transition: Transition.rightToLeftWithFade, duration: const Duration(milliseconds: durationAnime));
                  })
                ),
              ],
            )
          ],
        ),
      ),
    );
}

Container CardOfferAchivedView(BuildContext context, String nom_travaux, String day, String hours, int id){
  return Container(
      margin: const EdgeInsets.only(top: 5),
      width: double.infinity,
      color: white,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("images/undraw_electricity_k2ft.png"),
                          fit: BoxFit.cover))),
            ),
            customeTextStyle(
                nom_travaux, size:headingTextSize, black,
                fontWeight: FontWeight.bold),
            
            customeTextStyle("${formatDateString(day)} à partir de $hours",grey2),
            
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Expanded(
                    child: defaultButtonOutlined("Voir ma demande", (){context.go("/home/offer_detail/$id/");})
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
}


class SearchWorkerCardView extends StatelessWidget {
  const SearchWorkerCardView({
    Key? key,
    required this.fullname,
    required this.avis,
    required this.jobs,
  }) : super(key: key);
  final String fullname;
  final int avis;
  final int jobs;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          SizedBox(
            height: 70,
            width: 70,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircleAvatar(backgroundColor: grey),
                // Positioned(
                //   right: 0,
                //   top: 0,
                //   child: SizedBox(
                //     height: 22,
                //     width: 22,
                //     child: MaterialButton(
                //       onPressed: (){},
                //       padding: EdgeInsets.zero,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(15),
                //         side: const BorderSide(color: white)
                //       ),
                //       color: white,
                //       child: const Icon(Icons.check_circle, color: Colors.green,),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          Padding(
            padding: padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: customeTextStyle(fullname, black,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      EvaIcons.star,
                      color: Colors.amber,
                      size: 17,
                    ),
                    customeTextStyle("4,95", black),
                    customeTextStyle(" ($avis avis)", grey2,
                        fontWeight: FontWeight.bold),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: customeTextStyle("Membre depuis 4 mois", grey2),
                ),
                customeTextStyle("$jobs jobs réalisés", black,fontWeight: FontWeight.bold),
                verifyWorker(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationCardView extends StatelessWidget {
  const NotificationCardView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: padding,
      color: white,
      elevation: 0,
      animationDuration: Duration(seconds: 160),
      onPressed: () {},
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customeTextStyle('"il y a 12 heures"', grey2),
                customeTextStyle(
                    "Walter a commenté votre annonce 'Pose de prise RJ45'",

                    black,
                    fontWeight: FontWeight.bold)
              ],
            ),
          ),
          icon(EvaIcons.arrowIosForwardOutline),
        ],
      ),
    );
  }
}
