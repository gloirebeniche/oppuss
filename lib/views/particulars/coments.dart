import 'package:flutter/material.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/widget/customized_appbar.dart';

class ComentView extends StatefulWidget {
  const ComentView({super.key});

  @override
  State<ComentView> createState() => _ComentViewState();
}

class _ComentViewState extends State<ComentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2("Questions et réponses", context),
      backgroundColor: white,
      body: ListView(
        children: [
          Container(
            color: white,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 10),
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,// Rayon du cercle
                  backgroundColor: grey,
                  //backgroundImage: AssetImage('chemin_vers_l_image'), // Image à afficher
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Non de l'ouvrier
                            customeTextStyle("Bakary", 17, black, fontWeight: FontWeight.bold),
                            // date
                            customeTextStyle("il y a 4 jours", 13, grey2)
                          ],
                        ),
                        // contenue
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: customeTextStyle(" Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. ",
                            15, black
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ), 
          const Divider(thickness: 0.5, color: grey,),
          Container(
            color: white,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 10),
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,// Rayon du cercle
                  backgroundColor: grey,
                  //backgroundImage: AssetImage('chemin_vers_l_image'), // Image à afficher
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Non de l'ouvrier
                            customeTextStyle("Bakary", 17, black, fontWeight: FontWeight.bold),
                            // date
                            customeTextStyle("il y a 4 jours", 13, grey2)
                          ],
                        ),
                        // contenue
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: customeTextStyle(" Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. ",
                            15, black
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Divider(thickness: 0.5, color: grey,),
          Container(
            color: white,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 10),
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,// Rayon du cercle
                  backgroundColor: grey,
                  //backgroundImage: AssetImage('chemin_vers_l_image'), // Image à afficher
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Non de l'ouvrier
                            customeTextStyle("Bakary", 17, black, fontWeight: FontWeight.bold),
                            // date
                            customeTextStyle("il y a 4 jours", 13, grey2)
                          ],
                        ),
                        // contenue
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: customeTextStyle(" Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. ",
                            15, black
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Divider(thickness: 0.5, color: grey,),
          Container(
            color: white,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 10),
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,// Rayon du cercle
                  backgroundColor: grey,
                  //backgroundImage: AssetImage('chemin_vers_l_image'), // Image à afficher
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Non de l'ouvrier
                            customeTextStyle("Bakary", 17, black, fontWeight: FontWeight.bold),
                            // date
                            customeTextStyle("il y a 4 jours", 13, grey2)
                          ],
                        ),
                        // contenue
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: customeTextStyle(" Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. ",
                            15, black
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Divider(thickness: 0.5, color: grey,),
          Container(
            color: white,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 10),
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,// Rayon du cercle
                  backgroundColor: grey,
                  //backgroundImage: AssetImage('chemin_vers_l_image'), // Image à afficher
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Non de l'ouvrier
                            customeTextStyle("Bakary", 17, black, fontWeight: FontWeight.bold),
                            // date
                            customeTextStyle("il y a 4 jours", 13, grey2)
                          ],
                        ),
                        // contenue
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: customeTextStyle(" Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. ",
                            15, black
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Divider(thickness: 0.5, color: grey,),
          Container(
            color: white,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 10),
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,// Rayon du cercle
                  backgroundColor: grey,
                  //backgroundImage: AssetImage('chemin_vers_l_image'), // Image à afficher
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Non de l'ouvrier
                            customeTextStyle("Bakary", 17, black, fontWeight: FontWeight.bold),
                            // date
                            customeTextStyle("il y a 4 jours", 13, grey2)
                          ],
                        ),
                        // contenue
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: customeTextStyle(" Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. ",
                            15, black
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}