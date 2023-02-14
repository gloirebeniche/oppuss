import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/widget/button_widget_app.dart';
import 'package:oppuss/widget/particular/app_widgets.dart';

class OfferDetailView extends StatefulWidget {
  const OfferDetailView({super.key});

  @override
  State<OfferDetailView> createState() => _OfferDetailViewState();
}

class _OfferDetailViewState extends State<OfferDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.20,
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image:AssetImage("images/undraw_electricity_k2ft.png"),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  Positioned(
                    top: 2,
                    left: 0, 
                    child: IconButton(
                      onPressed: (){Navigator.pop(context);},
                      icon: icon(EvaIcons.arrowBackOutline)
                    ),
                  )
                ],
              )
            ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: customeTextStyle("Construction de boutique", 18, black, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: customeTextStyle("Mardi 28 février 2023 de 12h:00 à 14h:30 (2h:30)", 13, grey2),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: [
                      icon3(EvaIcons.pin),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: customeTextStyle("51 rue Nkouma, Moungali Brazzavile", 15, grey2),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: [
                      icon3(EvaIcons.person),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: customeTextStyle("1 ouvrier demandé", 15, grey2),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  child: Center(child: defaultButtonOutlined("Detail", (){}))
                ),
                Container(
                  margin: const EdgeInsets.only(top: 2),
                  child: Center(child: defaultButton("Modifer", (){}))
                ),
                Container( margin: const EdgeInsets.only(top: 20), child: const Divider(height: 5, thickness: 1,),),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: [
                      icon3(EvaIcons.messageCircleOutline),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: customeTextStyle("Voir les commentaires (5)", 15, grey2),
                        ),
                      ),
                      icon(EvaIcons.arrowIosForwardOutline)
                    ],
                  ),
                ),
                Container( margin: const EdgeInsets.only(top: 10), child: const Divider(height: 5, thickness: 1,),),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 15),
                  child: customeTextStyle("Offres (10)", 20, black, fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  color: grey,
                  child: Column(
                    children: [
                      cardOffer(context),
                      cardOffer(context),
                      cardOffer(context),
                      cardOffer(context),
                      cardOffer(context),
                      cardOffer(context),
                      cardOffer(context),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}