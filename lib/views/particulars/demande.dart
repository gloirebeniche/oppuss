import 'package:flutter/material.dart';
import 'package:oppuss/api/api.dart';
import 'package:oppuss/api/auth_provider.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/views/auth/login_screen.dart';
import 'package:oppuss/widget/customized_appbar.dart';
import 'package:oppuss/widget/particular/app_widgets.dart';
import 'package:oppuss/widget/particular/card_view.dart';
import 'package:provider/provider.dart';


class Demandes extends StatefulWidget {
  const Demandes({super.key});

  @override
  State<Demandes> createState() => _DemandesState();
}

class _DemandesState extends State<Demandes> {

  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context);
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: white,
          appBar: CustomAppBar("Mes demandes",context),
          body: Column(
            children: [
              Container(
                color: white,
                child: TabBar(
                  tabs: [
                    Tab(
                      child:  titleTextStyle("En cours", color: primaryColor),
                    ),
                    Tab(
                      child:  titleTextStyle("Terminé", color: primaryColor),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: 
                      //!authProvider.isAuthenticated? cardOfferAuth(context):
                      ListView(
                          children: const[
                            CardOfferView(),
                            CardOfferView(),
                            CardOfferView(),
                            CardOfferView(),
                            CardOfferView(),
                            CardOfferView(),
                            CardOfferView(),
                            CardOfferView(),
                            CardOfferView(),
                            CardOfferView(),
                        ],
                      ),
                    ),
                    Container(
                     padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                      child: //!authProvider.isAuthenticated? cardOfferAuth(context): 
                      ListView(
                        children: const[
                          CardOfferView2(),
                          spacingHeight2,
                          CardOfferView2(),
                           spacingHeight2,
                          CardOfferView2(),
                           spacingHeight2,
                          CardOfferView2(),
                           spacingHeight2,
                          CardOfferView2(),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ));
  }
}
