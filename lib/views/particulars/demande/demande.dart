import 'package:flutter/material.dart';
import 'package:oppuss/api/api.dart';
import 'package:oppuss/api/auth_provider.dart';
import 'package:oppuss/models/gestion_offres.dart';
import 'package:oppuss/utils/theme.dart';
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
  List<Offre> myOffres = [];
  List<Offre> myOffresAchived = [];

  Future<bool> fetchData(String token) async {
    try {
      final response = await http.get(
        Uri.parse(apiOffres),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      final response2 = await http.get(
        Uri.parse(apiOffreArchive),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200 && response2.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
        final jsonData2 = jsonDecode(utf8.decode(response2.bodyBytes));
        List<Offre> newData = [];
        List<Offre> newData2 = [];
        for (var offre in jsonData) {
          newData.add(Offre.fromJson(offre));
        }
        for (var offre in jsonData2) {
          newData2.add(Offre.fromJson(offre));
        }
        setState(() {
          myOffres = newData;
          myOffresAchived = newData2;
        });
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    fetchData(authProvider.accessToken ?? '');
  }
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
                      myOffres.isEmpty ? cardOfferAuth(context) :
                      ListView.builder(
                        itemCount: myOffres.length,
                        itemBuilder: (context, index) => CardOfferView(context,
                          myOffres[index].idTravaux.nomtravaux!,
                          myOffres[index].jour.toString(),
                          myOffres[index].heure.toString(),
                          myOffres[index].id
                        )
                      )
                    ),
                    Container(
                      child: myOffresAchived.isEmpty ? cardOfferAuth(context) :
                      ListView.builder(
                        itemCount: myOffres.length,
                        itemBuilder: (context, index) => CardOfferAchivedView(context,
                          myOffres[index].idTravaux.nomtravaux!,
                          myOffres[index].jour.toString(),
                          myOffres[index].heure.toString(),
                          myOffres[index].id
                        )
                      )
                    ),
                  ],
                ),
              )
            ],
          )
        ));
  }
}
