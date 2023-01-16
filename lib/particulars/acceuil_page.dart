import 'package:flutter/material.dart';
import 'package:oppuss/views/home/home_screen.dart';

import '../utils/theme.dart';

class AcceuilePage extends StatefulWidget {
  const AcceuilePage({super.key});

  @override
  State<AcceuilePage> createState() => _AcceuilePageState();
}

class _AcceuilePageState extends State<AcceuilePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
         appBar: AppBar(
        elevation: 0,
        backgroundColor: kglobalColor,
        automaticallyImplyLeading: false,
        
        actions: [
           Padding(  padding: const EdgeInsets.only(right: 10),
          child:IconButton( icon : const Icon( Icons.messenger_rounded, color: kPrimaryColor,),
           onPressed: () {     Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  const HomeScreen()));},),)
        ],
      ),
      body: Center(
        child: Text("Acceuil Page"),
      ),
    );
  }
}