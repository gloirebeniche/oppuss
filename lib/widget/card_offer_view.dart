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