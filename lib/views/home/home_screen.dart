
import 'package:flutter/material.dart';
import 'package:oppuss/particulars/all_ouvrier.dart';
import 'package:oppuss/particulars/compte.dart';
import 'package:oppuss/particulars/demande.dart';
import 'package:oppuss/particulars/messages.dart';
import 'package:oppuss/utils/theme.dart';

import '../../particulars/acceuil_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
      AcceuilePage(),
      Demandes(), 
      AllOuvrier(),
      Messages(),
      Compte()
  
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Acceuil',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Demandes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
          label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Compte',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: KTextColorSecondary,
        
        onTap: _onItemTapped,
      ),
    );
  }
}
