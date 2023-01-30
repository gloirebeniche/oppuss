import 'package:flutter/material.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/widget/customized_appbar.dart';
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
          appBar: CustomAppBar("Mes demandes"),
          body: Column(
            children: [
               TabBar(
                tabs: [
                  Tab(
                    child:  titleTextStyle("En cours", color: primaryColor),
                  ),
                  Tab(
                    child:  titleTextStyle("Terminé", color: primaryColor),
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
                          spacingHeight2,
                          CardOfferView(),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.amberAccent,
                      child: const Center(child: Text("Hello Walter"),),
                    ),
                  ],
                ),
              )
            ],
          )
        ));
  }
}
