import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oppuss/models/worker.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/widget/button_widget_app.dart';
import 'package:oppuss/widget/particular/app_widgets.dart';
import 'package:oppuss/widget/particular/card_view.dart';



class SearchWorkerView extends StatefulWidget {
  const SearchWorkerView({super.key});

  @override
  State<SearchWorkerView> createState() => _SearchWorkerViewState();
}


class _SearchWorkerViewState extends State<SearchWorkerView> {
  //create a dummy list
  static List<ProfileWorkerModel> workers = [
    ProfileWorkerModel(name: "Walter", firstname: "Elijah", avis: 50, jobs: 100),
    ProfileWorkerModel(name: "UZUMAKI", firstname: "Naruto", avis: 500, jobs: 250),
    ProfileWorkerModel(name: "IYUGA", firstname: "Néji", avis: 5, jobs: 100),
    ProfileWorkerModel(name: "PAMBOU", firstname: "Grâce", avis: 10, jobs: 10),
    ProfileWorkerModel(name: "PAMBOU", firstname: "Adry Athony", avis: 75, jobs: 80),
    ProfileWorkerModel(name: "MAPASSI", firstname: "Dony Glène", avis: 50, jobs: 50),
    ProfileWorkerModel(name: "NGATSÉ", firstname: "Béniche", avis: 25, jobs: 70),
    ProfileWorkerModel(name: "NZIHOU", firstname: "Michel Jennifer", avis: 50, jobs: 50),
  ];

  List<ProfileWorkerModel> display_list = List.from(workers);


  void updateList(String value){
    //this is the function that filter our liste
    setState(() {
      display_list = workers.where(
        (element) => element.name.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        title: Container(
          margin: const EdgeInsets.only(top: 5),
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
                  borderRadius: BorderRadius.circular(50)
                ),
                hintStyle: GoogleFonts.lato(textStyle: const TextStyle(fontSize: textSizeH2, color: grey2)),
                hintText: "Recherchez un ouvrier"
              ),
            ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
              Expanded(
                child: display_list.isEmpty ?
                const Center(
                  child: Text("Aucun ouvrier ne correspond "),
                )
                :ListView.builder(
                  itemCount: display_list.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, bottom: 10),
                      color: white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          cardWorker("${display_list[index].firstname} ${display_list[index].name}"),
                          // SearchWorkerCardView(
                          //   fullname: "${display_list[index].firstname} ${display_list[index].name}",
                          //   avis: display_list[index].avis,
                          //   jobs: display_list[index].jobs,
                          // ),
                          defaultButton("Voir le profil", (){context.go("/home/worker_profile");})
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/**
 * 
 * MaterialButton(
                    onPressed: (){},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: const BorderSide(color: Colors.white)
                    ),
                    elevation: 0,
                    color: Colors.white,
                    child: const profile_card_view(),
                  ),
 */

