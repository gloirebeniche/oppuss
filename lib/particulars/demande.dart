import 'package:flutter/material.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/widget/customized_appbar.dart';

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
          appBar: AppBar(
            elevation: 0,
            backgroundColor: kglobalColor,
            automaticallyImplyLeading: false,
            title:const Text("Mes demandes", style: TextStyle(color: KTextColor),),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              children: [
                Container(
                  height: 48,
                    decoration: BoxDecoration(
                        color: KTextColorSecondary,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TabBar(
                          indicator: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          tabs: [
                            Tab(
                              text: 'Annonces',
                            ),
                            Tab(
                              text: 'Projet',
                            )
                          ]),
                    )),
                  
              ],
            ),
          ),
        ));
  }
}
