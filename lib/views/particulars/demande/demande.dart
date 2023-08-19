import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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

import '../../../models/ref_btp.dart';


class Demandes extends StatefulWidget {
  const Demandes({super.key});

  @override
  State<Demandes> createState() => _DemandesState();
}

class _DemandesState extends State<Demandes> {
  List<Offre> myOffres = [];
  List<Offre> myOffresAchived = [];
  
  late bool isLoading;

  Future<bool> fetchData(String token) async {
    setState(() {
      isLoading = true;
    });
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
          isLoading = false;
        });
        return true;
      } else {
        return false;
      }
    } catch (e) {
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

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: grey1,
          appBar: CustomAppBar("Mes demandes",context),
          body: isLoading? Center(child: LoadingAnimationWidget.staggeredDotsWave(color: primaryColor, size: 50),): Column(
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
                        itemBuilder: (context, index) {
                          return FutureBuilder<http.Response>(
                            future: http.get(Uri.parse("$apiTravaux/${myOffres[index].idTravaux}/")),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                  Travaux travaux = Travaux.fromJson(jsonDecode(utf8.decode(snapshot.data!.bodyBytes)));
                                  return CardOfferView(
                                    context,
                                    travaux.nomtravaux!,
                                    myOffres[index].jour.toString(),
                                    "${myOffres[index].heure.hour}:${myOffres[index].heure.minute}",
                                    myOffres[index].id
                                  );
                                } else {
                                  return const Text("");
                                }
                            },
                          );
                        },
                      )

                    ),
                    Container(
                      child: myOffresAchived.isEmpty ? cardOfferAuth(context) :
                      ListView.builder(
                        itemCount: myOffres.length,
                        itemBuilder: (context, index) => CardOfferAchivedView(context,
                          "myOffres[index].idTravaux.nomtravaux!",
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
