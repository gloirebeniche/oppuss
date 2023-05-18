import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oppuss/api/api.dart';
import 'package:oppuss/models/ref_btp.dart';
import 'package:oppuss/models/service_home_page.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageParticular extends StatefulWidget {
  const HomePageParticular({super.key});
  @override
  State<HomePageParticular> createState() => _HomePageParticularState();
}

class _HomePageParticularState extends State<HomePageParticular> {
  
  int selectedService = -1;

  List<Domaine> domaines = [];


  List<Domaine> domaineFilters = [];

  void updateList(String value){
    //this is the function that filter our liste
    setState(() {
      domaineFilters = domaines.where(
        (element) => element.nomdomaine!.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

  Future<void> fetchData() async {
    // Appel API pour récupérer les données
    var response = await http.get(Uri.parse(apiDomaines));
    if (response.statusCode == 200) {
      // Permettre au donnée d'accepter les caractère spéciaux
      var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
      List<Domaine> newData = [];
      for (var item in jsonData) {
        newData.add(Domaine.fromJson(item));
      }
      setState(() {
        domaines = newData; // Mettre à jour l'état avec les nouvelles données
        domaineFilters = domaines;
      });
      print(domaineFilters);
    } else {
      // Gérer les erreurs lors de l'appel à l'API
      print('Erreur de récupération des données depuis l\'API');
    }
  }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: CustomScrollView(
          slivers: [
            // IMAGE COVER
            const SliverAppBar(
              backgroundColor: white,
              pinned: true,
              elevation: 0,
              expandedHeight: 300.0,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: [StretchMode.zoomBackground],
                background: Image(
                  image: AssetImage("assets/home.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //SEARCH BAR
            SliverAppBar(
              backgroundColor: white,
              elevation: 0,
              pinned: true,
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(-10.0), child: SizedBox(),
              ),
              flexibleSpace: Container(
                margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
                height: 50,
                child: TextField(
                    onChanged: (value) => updateList(value),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      prefixIcon: icon(EvaIcons.searchOutline),
                      contentPadding: const EdgeInsets.all(0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      hintStyle: GoogleFonts.lato(textStyle: TextStyle(fontSize: 11, color: grey2)),
                      hintText: "Quelle travaux souhaitez vous réalisé ?"
                    ),
                  ),
              ),
              
            ),
            
            // LISTE DES DOMAINE METIER
              SliverList(delegate: SliverChildBuilderDelegate(
                ((context, index) {
                  //recuperation d'un domaine metier
                  final domaine = domaineFilters[index];
                  return GestureDetector(
                    onTap: (){},
                    child: Container(
                      //decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),  color: white,),
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(top: 10),
                      child: Stack(
                        children: [
                          ColorFiltered(
                            colorFilter: const ColorFilter.mode(
                              Colors.black,
                              BlendMode.dstATop,
                            ),
                            child: Image.network(domaine.image!, fit: BoxFit.cover,),),
                          Positioned.fill(child: Center(
                            child: customeTextStyle(domaine.nomdomaine!, white, fontWeight: FontWeight.bold, size: 22),
                          ))
                        ],
                      )
                    ),
                  );
                }),
                childCount: domaineFilters.length
              )
              )
          ],
        ),
      ),
    );
  }

  serviceContainer(String image, String name, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {

        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: selectedService == index
              ? Colors.blue.shade50
              : Colors.grey.shade100,
          border: Border.all(
            color: selectedService == index
                ? Colors.blue
                : Colors.blue.withOpacity(0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(image, height: 80),
              SizedBox(
                height: 20,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 20),
              )
            ]),
      ),
    );
  }
}



// Scaffold(
//       backgroundColor: Colors.grey,
//         appBar: CustomAppBar("Acceuil", context),
//         body: Container(
//           child: Padding(
//             padding: const EdgeInsets.all(30.0),
//             child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   childAspectRatio: 1.0,
//                   crossAxisSpacing: 25.0,
//                   mainAxisSpacing: 25.0,
//                 ),
//                 itemCount: services.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return serviceContainer(
//                       services[index].imageURL, services[index].name, index);
//                 }),
              
//         ))
//         );