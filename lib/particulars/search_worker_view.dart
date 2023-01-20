// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:oppuss/utils/theme.dart';
class SearchWorkerView extends StatefulWidget {
  const SearchWorkerView({super.key});

  @override
  State<SearchWorkerView> createState() => _SearchWorkerViewState();
}


class _SearchWorkerViewState extends State<SearchWorkerView> {
  //create a dummy list
  // static List<MovieModel> main_movies = [
  //   MovieModel("Original", 2020, 9.0),
  //   MovieModel("Baby boss", 2010, 9.0),
  //   MovieModel("Dark Matter", 2009, 8.0),
  // ];

  // List<MovieModel> display_list = List.from(main_movies);


  // void updateList(String value){
  //   //this is the function that filter our liste
  //   setState(() {
  //     display_list = main_movies.where((element) => element.movie_title!.toLowerCase().contains(value.toLowerCase())).toList();

  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kglobalColor,
        automaticallyImplyLeading: false,
        title:const Text("Trouver les ouvriers", style: TextStyle(color: KTextColor),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              TextField(
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(115, 214, 212, 212),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none
                    ),
                  hintText: "ex : John Doen",
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  MaterialButton(
                    onPressed: (){},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: const BorderSide(color: Colors.white)
                    ),
                    elevation: 0,
                    color: Colors.white,
                    child: const profile_card_view(),
                  ),
                  const SizedBox( height: 10.0, ),
                  MaterialButton(
                    onPressed: (){},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: const BorderSide(color: Colors.white)
                    ),
                    elevation: 0,
                    color: Colors.white,
                    child: const profile_card_view(),
                  ),
                  const SizedBox( height: 10.0, ),
                  MaterialButton(
                    onPressed: (){},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: const BorderSide(color: Colors.white)
                    ),
                    elevation: 0,
                    color: Colors.white,
                    child: const profile_card_view(),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}


class profile_card_view extends StatelessWidget {
  const profile_card_view({
    Key? key,
  }) : super(key: key);

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
                const Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Text("Elijah Walter",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.star, color: Colors.amber, size: 17,),
                    Text("4,95",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber),
                    ),
                    Text(" (105 avis)",
                      style: TextStyle(
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
                const Text("50 jobs réalisés",
                    style: TextStyle(
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