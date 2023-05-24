import 'package:flutter/material.dart';
import 'package:oppuss/api/api.dart';
import 'package:oppuss/api/auth_provider.dart';
import 'package:oppuss/models/gestion_offres.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/views/auth/login_screen.dart';
import 'package:oppuss/widget/customized_appbar.dart';
import 'package:oppuss/widget/particular/app_widgets.dart';
import 'package:oppuss/widget/particular/card_view.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Demandes extends StatefulWidget {
  const Demandes({super.key});

  @override
  State<Demandes> createState() => _DemandesState();
}

class _DemandesState extends State<Demandes> {
  List<Offre> my_offres = [];

  fetchData(String token) async {
    try {
      final response = await http.get(
        Uri.parse(apiOffres),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        //permettre au donnée d'accepter les caractère spéciaux
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
        List<Offre> newData = [];
        for (var offre in jsonData) {
          newData.add(Offre.fromJson(offre));
        }
        setState(() {
          my_offres = newData;
        });
        return true;
      }else{
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    setState(() {
      fetchData(authProvider.accessToken??'');
    });
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: bgColor,
          appBar: CustomAppBar("Mes demandes",context),
          body: Column(
            children: [
              Container(
                color: white,
                child: TabBar(
                  tabs: [
                    Tab(
                      child: customeTextStyle("En cours", textColorImportant, size: headingTextSize)
                    ),
                    Tab(
                      child:  customeTextStyle("Clôturé",textColorImportant, size: headingTextSize),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                      child: 
                      !authProvider.isAuthenticated? cardOfferAuth(context):
                      ListView.builder(
                        itemCount: my_offres.length,
                        itemBuilder: (context, index) => CardOfferView(context,
                          my_offres[index].idTravaux.nomtravaux!,
                          my_offres[index].jour,
                          my_offres[index].heure,
                          my_offres[index].id
                        )
                      )
                    ),
                    Container(
                      child: !authProvider.isAuthenticated? cardOfferAuth(context): 
                      ListView(
                        children: const[
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
