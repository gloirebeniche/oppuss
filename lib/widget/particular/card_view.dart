/// ICI SE TROUVE TOUS LES WIDGETS CONCERNANT LES CARDS VIEW
/// DE TOUS LES INTERFACE QUI NECESSITE UN CARD VIEW POUR LE PARTICULIER

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/widget/button_widget_app.dart';
import 'package:oppuss/widget/particular/app_widgets.dart';

class CardOfferView extends StatelessWidget {
  const CardOfferView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            spacingHeight2,
            customeTextStyle(
                "Pose de lampes et luminaire", headingTextSize, textColor,
                fontWeight: FontWeight.bold),
            spacingHeight,
            customeTextStyle(
                "Jeudi 25 janvier 2013 de 12 à 15:30", textSize, grey2),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: padding,
              color: bgContainerColor,
              child: Row(
                children: [
                  const Icon(
                    EvaIcons.bellOutline,
                    size: 20,
                    color: textColorImportant,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: customeTextStyle("Vous avez reçu 13 offres",
                        textSize, textColorImportant,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            spacingHeight2,
            Row(
              children: [
                Expanded(
                  child: defaultButton("Gérer ma demande", (){context.go("/home/offer_detail");})
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CardOfferView2 extends StatelessWidget {
  const CardOfferView2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            spacingHeight2,
            customeTextStyle(
                "Pose de lampes et luminaire", headingTextSize, textColor,
                fontWeight: FontWeight.bold),
            spacingHeight,
            customeTextStyle(
                "Jeudi 25 janvier 2013 de 12 à 15:30", textSize, grey2),
            
            spacingHeight2,
            Column(
              children: [
                Container(
                  width: double.infinity,
                  child: defaultButtonOutlined("Voir ma demande", () {context.go("/home/offer_detail");})
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
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
              children: const [
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
                  child: customeTextStyle(fullname, textSizeH2, textColor,
                      fontWeight: FontWeight.bold),
                ),
                spacingHeight0,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      EvaIcons.star,
                      color: Colors.amber,
                      size: 17,
                    ),
                    customeTextStyle("4,95", 12, starColor),
                    customeTextStyle(" ($avis avis)", 12, grey2,
                        fontWeight: FontWeight.bold),
                  ],
                ),
                spacingHeight0,
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: customeTextStyle("Membre depuis 4 mois", 12, grey2),
                ),
                spacingHeight0,
                customeTextStyle("$jobs jobs réalisés", textSize, textColor,fontWeight: FontWeight.bold),
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
      color: bgContainerColor,
      elevation: 0,
      onPressed: () {},
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customeTextStyle('"il y a 12 heures"', smallTextSize, grey2),
                customeTextStyle(
                    "Walter a commenté votre annonce 'Pose de prise RJ45'",
                    14,
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


