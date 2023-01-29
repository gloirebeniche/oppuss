import 'package:flutter/material.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/widget/particular/card_view.dart';


class Demandes extends StatefulWidget {
  const Demandes({super.key});

  @override
  State<Demandes> createState() => _DemandesState();
}

class _DemandesState extends State<Demandes> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: white,
            automaticallyImplyLeading: false,
            title:const Text("Mes demandes", style: TextStyle(color: textColor, fontSize: 25),),
          ),
          body: Column(
            children: [
              const TabBar(
                tabs: [
                  Tab(
                    child:  Text("En cours", style: TextStyle(color: primaryColor, fontSize: 15),),
                  ),
                  Tab(
                    child:  Text("Terminé", style: TextStyle(color: primaryColor, fontSize: 15),),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                      child: ListView(
                        children: const[
                          CardOfferView(),
                          SizedBox(height: 20,),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.amberAccent,
                      child: Center(child: Text("Hello Walter"),),
                    ),
                  ],
                ),
              )
            ],
          )
        ));
  }
}
