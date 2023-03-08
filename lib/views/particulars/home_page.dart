import 'dart:convert';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oppuss/models/service_home_page.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/widget/customized_appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageParticular extends StatefulWidget {
  const HomePageParticular({super.key});
  @override
  State<HomePageParticular> createState() => _HomePageParticularState();
}

class _HomePageParticularState extends State<HomePageParticular> {
  final List<Map> myList =
      List.generate(100000, (index) => {"id": index, "name": "Card $index"})
          .toList();
  List<ServiceHomePage> services = [
    ServiceHomePage('Cleaning',
        'https://img.icons8.com/external-vitaliy-gorbachev-flat-vitaly-gorbachev/2x/external-cleaning-labour-day-vitaliy-gorbachev-flat-vitaly-gorbachev.png'),
    ServiceHomePage('Plumber',
        'https://img.icons8.com/external-vitaliy-gorbachev-flat-vitaly-gorbachev/2x/external-plumber-labour-day-vitaliy-gorbachev-flat-vitaly-gorbachev.png'),
    ServiceHomePage('Electrician',
        'https://img.icons8.com/external-wanicon-flat-wanicon/2x/external-multimeter-car-service-wanicon-flat-wanicon.png'),
    ServiceHomePage('Painter',
        'https://img.icons8.com/external-itim2101-flat-itim2101/2x/external-painter-male-occupation-avatar-itim2101-flat-itim2101.png'),
    ServiceHomePage('Carpenter', 'https://img.icons8.com/fluency/2x/drill.png'),
    ServiceHomePage('Gardener',
        'https://img.icons8.com/external-itim2101-flat-itim2101/2x/external-gardener-male-occupation-avatar-itim2101-flat-itim2101.png'),
    ServiceHomePage(
        'Tailor', 'https://img.icons8.com/fluency/2x/sewing-machine.png'),
    ServiceHomePage(
        'Maid', 'https://img.icons8.com/color/2x/housekeeper-female.png'),
    ServiceHomePage('Driver',
        'https://img.icons8.com/external-sbts2018-lineal-color-sbts2018/2x/external-driver-women-profession-sbts2018-lineal-color-sbts2018.png'),
    ServiceHomePage('Cook',
        'https://img.icons8.com/external-wanicon-flat-wanicon/2x/external-cooking-daily-routine-wanicon-flat-wanicon.png'),
  ];

  int selectedService = -1;


  List<dynamic> _domaines = [];


  List<dynamic> display_domaine = [];

  void updateList(String value){
    //this is the function that filter our liste
    setState(() {
      display_domaine = _domaines.where(
        (element) => element["nom_domaine"].toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

  Future<void> fill_domaine() async {

    SharedPreferences  prefs =  await SharedPreferences.getInstance();

    setState(() {
      _domaines = jsonDecode(prefs.getString("domaines")!);
      display_domaine = List.from(_domaines);
    });
    
  }

  @override
  void initState()  {
    super.initState();
    try {
       fill_domaine();
    } catch (e) {
      print(e); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: CustomScrollView(
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
                    prefixIcon: icon2(EvaIcons.searchOutline),
                    contentPadding: const EdgeInsets.all(0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    hintStyle: GoogleFonts.lato(textStyle: const TextStyle(fontSize: textSizeH2, color: grey2)),
                    hintText: "Construction"
                  ),
                ),
            ),
            
          ),

          // LISTE DES DOMAINE METIER
          SliverList(delegate: SliverChildBuilderDelegate(
            ((context, index) {
              //recuperation d'un domaine metier
              final domaine = display_domaine[index];
              return GestureDetector(
                child: Container(
                  //decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),  color: white,),
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(top: 20),
                  child: Stack(
                    children: [
                       ColorFiltered(
                        colorFilter: const ColorFilter.mode(
                          Colors.black,
                          BlendMode.dstATop,
                        ),
                        child: Image.network(domaine["image"], fit: BoxFit.cover,),),
                      Positioned.fill(child: Center(
                        child: customeTextStyle(domaine["nom_domaine"], 22, white, fontWeight: FontWeight.bold),
                      ))
                    ],
                  )
                ),
              );
            }),
            childCount: display_domaine.length
          ))
        ],
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