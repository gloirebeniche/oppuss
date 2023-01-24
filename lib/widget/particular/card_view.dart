/// ICI SE TROUVE TOUS LES WIDGETS CONCERNANT LES CARDS VIEW
/// DE TOUS LES INTERFACE QUI NECESSITE UN CARD VIEW POUR LE PARTICULIER

import 'package:flutter/material.dart';


class CardOfferView extends StatelessWidget {
  const CardOfferView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: Container(
                decoration: const BoxDecoration(
                  image:  DecorationImage(
                    image: AssetImage("images/undraw_electricity_k2ft.png"),
                    fit: BoxFit.cover)
                )
              ),
            ),
            const SizedBox(height: 20,),
            const Text("Pose de lampes et luminaire", style: TextStyle(
                color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 10,),
            const Text("Jeudi 25 janvier 2013 de 12 à 15:30", style: TextStyle(
                color: Colors.black54, fontSize: 14
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(15),
              color: const Color.fromARGB(255, 218, 229, 248),
              child: Row(
                children: const [
                  Icon(Icons.notifications_active_outlined, size: 20, color: Color.fromARGB(255, 44, 154, 245),),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Vous avez reçu 13 offres", style: TextStyle(
                      color: Color.fromARGB(255, 44, 154, 245), fontSize: 13, fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Row(
               children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {  },
                    child:  const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('Gérer ma demande', style: 
                      TextStyle(fontSize: 15),),
                    ),
                  ),
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
    Key? key, required this.fullname, required this.avis, required this.jobs,
  }) : super(key: key);
  final String fullname;
  final int avis;
  final int jobs;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children:  [
          SizedBox(
            height: 60,
            width: 60,
            child: Stack(
              fit: StackFit.expand,
              children: [
                const CircleAvatar(backgroundColor: Colors.grey),
                Positioned(
                  right: 0,
                  top: 0,
                  child: SizedBox(
                    height: 22,
                    width: 22,
                    child: MaterialButton(
                      onPressed: (){},
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(color: Colors.white)
                      ),
                      color: Colors.white,
                      child: const Icon(Icons.check_circle, color: Colors.green,),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Text(fullname,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 17,),
                    const Text("4,95",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber),
                    ),
                    Text(" ($avis avis)",
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                    ),
                  ],
                ),
                const Text("Membre depuis 4 mois",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45),
                ),
                Text("$jobs jobs réalisés",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
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
      padding: const EdgeInsets.all(20),
      color: const Color.fromARGB(255, 215, 220, 228),
      elevation: 0,
      onPressed: () {  },
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "il y a 12 heures",
                  style: TextStyle(color: Colors.black54),),
                Text(
                  "Walter a commenté votre annonce 'Pose de prise RJ45'",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.keyboard_arrow_right_sharp,
            size: 30,
            color: Colors.grey
          ),
        ],
      ),
    );
  }
}
