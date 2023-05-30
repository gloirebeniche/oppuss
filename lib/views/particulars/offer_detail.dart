import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oppuss/api/api.dart';
import 'package:oppuss/models/gestion_offres.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/widget/button_widget_app.dart';
import 'package:oppuss/widget/particular/app_widgets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../api/auth_provider.dart';



class OfferDetailView extends StatefulWidget {
  final dynamic id_offre;
  const OfferDetailView({super.key, required this.id_offre});

  @override
  // ignore: no_logic_in_create_state
  State<OfferDetailView> createState() => _OfferDetailViewState(id_offre);
}

class _OfferDetailViewState extends State<OfferDetailView> {

  late Offre monOffres = Offre.defaultValues();
  dynamic id = 0;
  _OfferDetailViewState(id_offre){id = id_offre;}

  Future<bool>fetchData(String token) async {
    try {
      final response = await http.get(
        Uri.parse(apiOffres + id),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        //permettre au donnée d'accepter les caractère spéciaux
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
        setState(() {
          monOffres = Offre.fromJson(jsonData);
          print(monOffres);
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
  void initState() {
    super.initState();
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    fetchData(authProvider.accessToken!);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.20,
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image:AssetImage("images/undraw_electricity_k2ft.png"),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  Positioned(
                    top: 2,
                    left: 0, 
                    child: IconButton(
                      onPressed: (){Navigator.pop(context);},
                      icon: icon(EvaIcons.arrowBackOutline)
                    ),
                  )
                ],
              )
            ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: customeTextStyle(monOffres.idTravaux.nomtravaux ??'', size:18, black, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: customeTextStyle("${formatDateString(monOffres.jour)} à partir de ${monOffres.heure}", black),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: [
                      icon(EvaIcons.pin, color: textColorImportant),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: customeTextStyle(monOffres.lieu, black),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: [
                      icon(EvaIcons.person, color: textColorImportant),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: customeTextStyle("1 ouvrier demandé", black),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  child: Center(child: defaultButtonOutlined("Detail", (){context.go("/home/offer_detail/$id/view/$id");}))
                ),
                Container(
                  margin: const EdgeInsets.only(top: 2),
                  child: Center(child: defaultButton("Modifer", (){context.go("/home/offer_detail/$id/update_offer/");}))
                ),
                Container( margin: const EdgeInsets.only(top: 20), child: const Divider(height: 5, thickness: 1,),),
                TextButton(
                  onPressed: () {context.go("/home/offer_detail/$id/coments/$id");},
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      children: [
                        icon(EvaIcons.messageCircleOutline, color: textColorImportant),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: customeTextStyle("Voir les commentaires (${monOffres.commentaires.length})", black),
                          ),
                        ),
                        icon(EvaIcons.arrowIosForwardOutline)
                      ],
                    ),
                  ),
                ),
                Container( margin: const EdgeInsets.only(top: 10), child: const Divider(height: 5, thickness: 1,),),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 15),
                  child: customeTextStyle("Offres (10)", size:17, black),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  color: bgColor,
                  child: Column(
                    children: [
                      cardOffer(context),
                      cardOffer(context),
                      cardOffer(context),
                      cardOffer(context),
                      cardOffer(context),
                      cardOffer(context),
                      cardOffer(context),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}