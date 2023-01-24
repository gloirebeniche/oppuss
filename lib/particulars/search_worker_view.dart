// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:oppuss/models/worker.dart';
import 'package:oppuss/utils/theme.dart';
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
        (element) => element.firstname.toLowerCase().contains(value.toLowerCase())?
        element.firstname.toLowerCase().contains(value.toLowerCase())
        :element.name.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KbackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Kwhite,
        automaticallyImplyLeading: false,
        title:const Text("Trouver des ouvriers", style: TextStyle(color: KTextColor,fontSize: 25),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: TextField(
                  onChanged: (value) => updateList(value),
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 218, 218, 218),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none
                      ),
                    hintText: "ex : John Doen",
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: display_list.isEmpty ?
                const Center(
                  child: Text("Aucun ouvrier ne correspond "),
                )
                :ListView.builder(
                  itemCount: display_list.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: MaterialButton(
                      onPressed: (){},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(color: Colors.white)
                      ),
                      elevation: 0,
                      color: Colors.white,
                      child: profile_card_view(
                        fullname: "${display_list[index].firstname} ${display_list[index].name}",
                        avis: display_list[index].avis,
                        jobs: display_list[index].jobs,
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

class profile_card_view extends StatelessWidget {
  const profile_card_view({
    Key? key, required this.fullname, required this.avis, required this.jobs,
  }) : super(key: key);
  final String fullname;
  final int avis;
  final int jobs;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children:  [
          SizedBox(
            height: 60,
            width: 60,
            child: Stack(
              fit: StackFit.expand,
              children: [
                const CircleAvatar(backgroundColor: Colors.grey),
                Positioned(
                  right: 0,
                  top: 0,
                  child: SizedBox(
                    height: 22,
                    width: 22,
                    child: MaterialButton(
                      onPressed: (){},
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(color: Colors.white)
                      ),
                      color: Colors.white,
                      child: const Icon(Icons.check_circle, color: Colors.green,),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Text(fullname,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 17,),
                    const Text("4,95",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber),
                    ),
                    Text(" ($avis avis)",
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                    ),
                  ],
                ),
                const Text("Membre depuis 4 mois",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45),
                ),
                Text("$jobs jobs réalisés",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 