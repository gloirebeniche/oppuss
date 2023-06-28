// ignore_for_file: unnecessary_brace_in_string_interps, use_build_context_synchronously
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:oppuss/api/api.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/widget/button_widget_app.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;
import '../../../api/auth_provider.dart';
import '../../../models/gestion_offres.dart';
import '../../../models/ref_btp.dart';

class UpdateOfferPage extends StatefulWidget {
  final dynamic idOffre;
  const UpdateOfferPage({super.key, this.idOffre}); //required this.idDomaine;

  @override
  State<UpdateOfferPage> createState() => _UpdateOfferPageState();
}

class _UpdateOfferPageState extends State<UpdateOfferPage> {
  
  DateTime today = DateTime.now();
  
  TimeOfDay time = TimeOfDay.now();
  
  final TextEditingController _descriptionController = TextEditingController();
  
  final TextEditingController _adressController = TextEditingController();

  String nom_travaux = "";

  int id_domaine = 0;
  int id_travaux = 0;
  
  //final TextEditingController _telController = TextEditingController();


  Future<Offre> fetchData(String token) async {
    final response = await http.get(
      Uri.parse("$apiOffres${widget.idOffre}/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      //permettre au donnée d'accepter les caractère spéciaux
      final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
      
      Offre offre = Offre.fromJson(jsonData);
      
      var r1 = await http.get(Uri.parse("$apiTravaux/${offre.idTravaux}/"));
      
      Travaux travaux = Travaux.fromJson(jsonDecode(utf8.decode(r1.bodyBytes)));
      
      setState(() { nom_travaux = travaux.nomtravaux!; });

      return offre;

    }else{
      throw Exception('Erreur de récupération des données depuis l\'API');
    }
  }

  void _onDaySelected(DateTime day, DateTime focusedDay){
    setState(() {
      today = day;
    });
  }

  @override
  void initState() {
    super.initState();
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    fetchData(authProvider.accessToken!).then((offre) {
      setState(() {
        _adressController.text = offre.lieu;
        _descriptionController.text = offre.description;
        today = offre.jour;
        time = offre.heure;
        id_domaine = offre.idDomaine;
        id_travaux = offre.idTravaux;
      });
    }).catchError((error) {
      // Handle any potential errors
    });
  }


  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade600,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey.shade600,
      ),
      body: ListView(
        children: [
          // JOUR DE L'OFFRE
          Container(
            padding: padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customeTextStyle("Quels jours vous convient le mieux ?" , white, fontWeight: FontWeight.bold, size: 18),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: TableCalendar(
                    locale: "fr_FR",
                    headerStyle: const HeaderStyle(formatButtonVisible: false, titleCentered: true),
                    availableGestures: AvailableGestures.all,
                    selectedDayPredicate: (day) => isSameDay(day, today),
                    focusedDay: DateTime.now(), 
                    firstDay: DateTime.now(), 
                    lastDay: DateTime.utc(2025),
                    onDaySelected: _onDaySelected,
                  ),
                )
              ],
            ),
          ),

          // HEURE DU RENDEZ-VOUS
          Container(
            padding: padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customeTextStyle("Nous estimons l'heure du rendez-vous, cela vous convient-il ?", white, fontWeight: FontWeight.bold, size: 18),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: customeTextStyle("${time.hour}:${time.minute}", white, fontWeight: FontWeight.bold, size: 20)
                ),

                SizedBox(
                  height: 40,
                  width: 120,
                  child: defaultButton("Choisir", () async { 
                    TimeOfDay? newTime = await showTimePicker(
                      context: context, 
                      initialTime: time);

                    if (newTime == null) return;

                    setState(() { time = newTime; });
                  }),
                )
              ],
            ),
          ),

          // ADRESSE DE L'OFFRE
          Container(
            padding: padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customeTextStyle("Quelle est l'adresse de la prestation ?", white, fontWeight: FontWeight.bold, size: 18),
                Container(
                  height: 50,
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Column(
                    children:  [
                      Expanded(
                        child: TextField(
                          controller: _adressController,
                          cursorColor: black,
                          cursorHeight: 20,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "246 rue Bandza, Brazzaville",
                            hintStyle: GoogleFonts.lato(textStyle: TextStyle(fontSize: headingTextSize, color: grey2)),
                            border: const OutlineInputBorder(borderSide: BorderSide.none)
                          ),
                        )
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          // // NUMERO DE TELEPHONE DE L'OFFRE
          // Container(
          //   padding: padding,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       customeTextStyle("À quel numéro de téléphone l'ouvrier pourra-t-l vous joindre ?", white, fontWeight: FontWeight.bold, size: 18),
          //       Container(
          //         height: 50,
          //         margin: const EdgeInsets.only(top: 10),
          //         decoration: BoxDecoration(
          //           color: white,
          //           borderRadius: BorderRadius.circular(5)
          //         ),
          //         child: Column(
          //           children:  [
          //             Expanded(
          //               child: TextField(
          //                 controller: _telController,
          //                 cursorColor: black,
          //                 cursorHeight: 20,
          //                 keyboardType: TextInputType.phone,
          //                 decoration: InputDecoration(
          //                   hintText: "06 483 8870",
          //                   hintStyle: GoogleFonts.lato(textStyle: TextStyle(fontSize: headingTextSize, color: grey2)),
          //                   border: const OutlineInputBorder(borderSide: BorderSide.none)
          //                 ),
          //               )
          //             ),
          //           ],
          //         ),
          //       )
          //     ],
          //   ),
          // ),

          // DESCRIPTION ICI
          Container(
            padding: padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customeTextStyle("Quel est votre besoins ?", white, fontWeight: FontWeight.bold, size: 17),
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Column(
                    children:  [
                      Expanded(
                        child: TextField(
                          controller: _descriptionController,
                          cursorColor: black,
                          cursorHeight: 20,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            hintText: "Votre description...",
                            hintStyle: GoogleFonts.lato(textStyle: TextStyle(fontSize: headingTextSize, color: grey2)),
                            border: const OutlineInputBorder(borderSide: BorderSide.none)
                          ),
                        )
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          

          // BOUTON PUBLIER
          Container(
            margin: margin,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Expanded(child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: defaultButton("Modifier", () async {
                    if (_adressController.text.isNotEmpty) {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      final response = await http.put(
                        Uri.parse("$apiOffres${widget.idOffre}/"),
                        headers: <String, String>{
                          'Content-Type': 'application/json; charset=UTF-8',
                          'Authorization': 'Bearer ${authProvider.accessToken}',
                        },
                        body: jsonEncode(<String, dynamic>{
                          'jour': DateFormat("yyyy-MM-dd").format(today),
                          'heure': TimeOfDay(hour: time.hour, minute: time.minute).format(context),
                          'id_domaine': id_domaine,
                          'id_travaux': id_travaux,
                          'lieu': _adressController.text,
                          'description': _descriptionController.text
                        }),
                      );

                     
                      if (response.statusCode == 200) {
                        messageBoxSuccess(context, "L'offre a été modifier avec succès :)");
                        context.go('/home/offer_detail/${widget.idOffre}');
                      } else {
                        messageBox(context, "ERROR: Impossible de créer l'offre");
                      }
                    } else {
                      messageBox(context, "Adresse ou numero de telephone invalid");
                    }
                  }),
              ))
              
            ],)
          )
        ],
      )
    );
  }

}