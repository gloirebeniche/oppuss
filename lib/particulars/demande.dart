import 'package:flutter/material.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/widget/card_offer_view.dart';


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
          backgroundColor: KbackgroundColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Kwhite,
            automaticallyImplyLeading: false,
            title:const Text("Mes demandes", style: TextStyle(color: KTextColor, fontSize: 25),),
          ),
          body: Column(
            children: [
              const TabBar(
                tabs: [
                  Tab(
                    child:  Text("En cours", style: TextStyle(color: kPrimaryColor, fontSize: 18),),
                  ),
                  Tab(
                    child:  Text("Terminé", style: TextStyle(color: kPrimaryColor, fontSize: 18),),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                      child: ListView(
                        children: const[
                           CardOfferView(),
                           SizedBox(height: 20,),
                           CardOfferView(),
                           SizedBox(height: 20,),
                           CardOfferView(),
                           SizedBox(height: 20,),
                           CardOfferView(),
                           SizedBox(height: 20,),
                           CardOfferView(),
                           SizedBox(height: 20,),
                           CardOfferView(),
                           SizedBox(height: 20,),
                           CardOfferView(),
                           SizedBox(height: 20,),
                           CardOfferView(),
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
