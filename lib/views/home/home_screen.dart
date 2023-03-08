import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oppuss/api/api.dart';
import 'package:oppuss/views/particulars/account_view.dart';
import 'package:oppuss/views/particulars/search_worker_view.dart';
import 'package:oppuss/views/particulars/demande.dart';
import 'package:oppuss/views/particulars/publications.dart';
import 'package:oppuss/utils/theme.dart';
import '../particulars/home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
      HomePageParticular(),
      SearchWorkerView(),
      AddOffer(),
      Demandes(), 
      AccountView()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDomaines(context);
    // fetchTravaux();
    // fetchMetier();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: icon(EvaIcons.homeOutline),
            label: 'Acceuil',
            activeIcon: icon(EvaIcons.home)
          ),
           BottomNavigationBarItem(
            icon: icon(EvaIcons.searchOutline),
            label: 'Recherche',
            activeIcon: icon(EvaIcons.search)
          ),
          BottomNavigationBarItem(
            icon: icon(EvaIcons.plusSquareOutline),
            label: '',
            activeIcon: icon(EvaIcons.plusSquare)
          ),
          BottomNavigationBarItem(
            icon: icon(EvaIcons.bookmarkOutline),
            label: 'Demandes',
            activeIcon: icon(EvaIcons.bookmark)
          ),
          BottomNavigationBarItem(
            icon: icon(EvaIcons.personOutline),
            label: 'Compte',
            activeIcon: icon(EvaIcons.person)
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: textColor,
        unselectedItemColor: grey2,
        onTap: _onItemTapped,
      ),
    );
  }
}
