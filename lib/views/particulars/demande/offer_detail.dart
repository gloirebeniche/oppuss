// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:oppuss/api/api.dart';
import 'package:oppuss/api/auth_provider.dart';
import 'package:oppuss/models/gestion_offres.dart';
import 'package:oppuss/models/ref_btp.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/views/particulars/demande/offer_more_detail.dart';
import 'package:oppuss/views/particulars/demande/offer_update.dart';
import 'package:oppuss/views/particulars/home_screen.dart';
import 'package:oppuss/widget/button_widget_app.dart';
import 'package:oppuss/widget/particular/app_widgets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'coments.dart';


class OfferDetailView extends StatefulWidget {
  final dynamic id_offre;
  const OfferDetailView({super.key, required this.id_offre});

  @override
  // ignore: no_logic_in_create_state
  State<OfferDetailView> createState() => _OfferDetailViewState(id_offre);
}

class _OfferDetailViewState extends State<OfferDetailView> {

  late Offre monOffres = Offre.defaultValues();
  late bool isLoading;
  
  dynamic id = 0;
  _OfferDetailViewState(id_offre){id = id_offre;}

  String nom_travaux = "";

  Future<bool>fetchData(String token) async {
    setState(() {
      isLoading = true;
    });
    try {
      final response = await http.get(
        Uri.parse(apiOffres + id.toString()),
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
        });
        var reponse = await http.get(Uri.parse("$apiTravaux/${monOffres.idTravaux}/"));
        Travaux travaux = Travaux.fromJson(jsonDecode(utf8.decode(reponse.bodyBytes)));
        setState(() {
          nom_travaux = travaux.nomtravaux!;
          isLoading = false;
        });
        return true;
      }else{
        
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
    fetchData(authProvider.accessToken!);
  }
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: white,
      body: isLoading? Center(child: LoadingAnimationWidget.staggeredDotsWave(color: primaryColor, size: 50),): ListView(
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
                  child: customeTextStyle(nom_travaux, size:18, black, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: customeTextStyle("${formatDateString(monOffres.jour.toString())} à partir de ${monOffres.heure.hour}:${monOffres.heure.minute}", black),
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(5),
                        child: Center(child: defaultButtonOutlined("Detail", (){
                          Get.to(() => OfferMoreDetailPage(idOffre: id,), transition: Transition.rightToLeft, duration: const Duration(milliseconds: durationAnime));
                        }))
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(5),
                        child: Center(child: defaultButton("Modifer", (){
                          Dialogs.bottomMaterialDialog(
                            //msg: 'Are you sure? you can\'t undo this action',
                            title: 'Modifier',
                            context: context,
                            actions: [
                              Column(
                                children: [
                                  Divider(height: 1, thickness: 1, color: grey,),
                                  TextButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                      Get.to(() => UpdateOfferPage(idOffre: id,), transition: Transition.rightToLeftWithFade, duration: const Duration(milliseconds: durationAnime));
                                    },
                                    child: Row(
                                      children: [
                                        icon(EvaIcons.edit2Outline),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 15),
                                          child: customeTextStyle("Modifier ma demande", black, size: 15),
                                        )
                                      ],
                                    ),
                                  ),
                                  
                                  Divider(height: 1, thickness: 1, color: grey,),

                                  TextButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                      Dialogs.materialDialog(
                                        msg: "Êtes-vous sûr de vouloir supprimer ??",
                                        title: "Suppression",
                                        color: Colors.white,
                                        context: context,
                                        actions: [
                                          IconsOutlineButton(
                                            onPressed: () {Navigator.pop(context);},
                                            text: 'Annuler',
                                            iconData: EvaIcons.closeCircleOutline,
                                            textStyle: const TextStyle(color: Colors.grey),
                                            iconColor: Colors.grey,
                                          ),
                                          IconsButton(
                                            onPressed: () async {
                                              setState(() {
                                                Center(child: LoadingAnimationWidget.staggeredDotsWave(color: primaryColor, size: 50),);
                                              });
                                              final response = await http.delete(
                                                Uri.parse("${apiOffres + id.toString()}/"),
                                                headers: <String, String>{
                                                  'Content-Type': 'application/json; charset=UTF-8',
                                                  'Authorization': 'Bearer ${authProvider.accessToken}',
                                                },
                                              );
                                              if (response.statusCode == 204) {
                                                showDialog(context: context, builder:(context) {
                                                  return Center(child: LoadingAnimationWidget.inkDrop(color: primaryColor, size: 50),);
                                                },);
                                                await Future.delayed(const Duration(seconds: 2));
                                                setState(() {
                                                  messageBoxSuccess(context, "Offre supprimer avec succès");
                                                 
                                                  Get.off(() => const HomeScreen(), transition: Transition.fadeIn, duration: const Duration(milliseconds: durationAnime));
                                                });
                                              } else {
                                                
                                              }
                                            },
                                            text: 'Supprimer',
                                            iconData: EvaIcons.trash2Outline,
                                            color: Colors.red,
                                            textStyle: const TextStyle(color: Colors.white),
                                            iconColor: Colors.white,
                                          ),
                                        ]);
                                      },
                                    child: Row(
                                      children: [
                                        icon(EvaIcons.trash2Outline, color: Colors.red),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 15),
                                          child: customeTextStyle("Annuler ma demande", Colors.red, size: 15),
                                        )
                                      ],
                                    ),
                                  ),
                                  Divider(height: 1, thickness: 1, color: grey,),
                                ],
                              )
                            ]);
                        }))
                      ),
                    ),
                  ],
                ),
                Container( margin: const EdgeInsets.only(top: 20), child: const Divider(height: 5, thickness: 1,),),
                
                TextButton(
                  onPressed: () {
                    //context.go("/home/offer_detail/$id/coments/$id");
                    Get.to(() => ComentView(idOffre: id,), transition: Transition.rightToLeftWithFade, duration: const Duration(milliseconds: durationAnime));
                    },
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