import 'package:flutter/material.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/widget/customized_appbar.dart';

class OfferMoreDetailPage extends StatelessWidget {
  const OfferMoreDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2("Detail de l'offre", context),
      body: ListView(
        children: [
          // PARTIE CONCERNANT
          Container(
            width: double.infinity,
            color: white,
            padding: margin,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customeTextStyle("Titre", 15, grey2),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: customeTextStyle("Construction de maison", 17, black),
                ),
              ],
            ),
          ),

          // PARTIE CONCERNANT LA DESCRIPTION
          Container(
            margin: const EdgeInsets.only(top: 3),
            width: double.infinity,
            color: white,
            padding: margin,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customeTextStyle("Description", 15, grey2),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: customeTextStyle("« Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non ferment um diam nisl sit amet erat.", 
                  17, black),
                ),
              ],
            ),
          ),

          // PARTIE CONCERNANT LA DATE
          Container(
            width: double.infinity,
            color: white,
            padding: margin,
            margin: const EdgeInsets.only(top: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customeTextStyle("Date", 15, grey2),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: customeTextStyle("25/01/2023", 17, black),
                ),
              ],
            ),
          ),

          // PARTIE CONCERNANT L'HEURE
          Container(
            width: double.infinity,
            color: white,
            padding: margin,
            margin: const EdgeInsets.only(top: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customeTextStyle("Heure", 15, grey2),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: customeTextStyle("12:30 ", 17, black),
                ),
              ],
            ),
          ),

          // PARTIE CONCERNANT L'ADRESSE
          Container(
            width: double.infinity,
            color: white,
            padding: margin,
            margin: const EdgeInsets.only(top: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customeTextStyle("Adresse", 15, grey2),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: customeTextStyle("242 rue Bandza, Ouendze Brazzaville", 17, black),
                ),
              ],
            ),
          ),

          // PARTIE CONCERNANT LE NUMERO DE TÉLÉPHONE
          Container(
            width: double.infinity,
            color: white,
            padding: margin,
            margin: const EdgeInsets.only(top: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customeTextStyle("Numéro de téléphone", 15, grey2),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: customeTextStyle("+242 06 483 8870", 17, black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}