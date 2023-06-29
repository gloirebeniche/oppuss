import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oppuss/api/auth_provider.dart';
import 'package:oppuss/views/auth/login_screen.dart';
import 'package:oppuss/views/particulars/search/search_worker_view.dart';
import 'package:oppuss/views/particulars/demande/demande.dart';
import 'package:oppuss/views/particulars/publier/publications.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:provider/provider.dart';
import 'account/account_view.dart';
import 'home/home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  
  late AuthProvider authProvider;

  static const List<Widget> _widgetOptions = <Widget>[
      HomePageParticular(),
      SearchWorkerView(),
      AddOffer(),
      Demandes(), 
      AccountView()
  ];

  void _onItemTapped(int index) {
    setState(() {
      if (index == 2) {
        if (!authProvider.isAuthenticated) {
          Get.to(() => const LoginScreen(), transition: Transition.fadeIn, duration: const Duration(milliseconds: durationAnime));
        }else{
          //context.go('/home/add_offer');
          Get.to(() => const AddOffer(), transition: Transition.zoom, duration: const Duration(milliseconds: durationAnime));
        }
      }else if(index == 3){
        if (!authProvider.isAuthenticated) {
          //context.go("/home/login");
          Get.to(() => const LoginScreen(), transition: Transition.fadeIn, duration: const Duration(milliseconds: durationAnime));
        }else{
          setState(() {
            _selectedIndex = 3;
          });
        }
        
      }else if(index == 4){
        if (!authProvider.isAuthenticated) {
          //context.go("/home/login");
          Get.to(() => const LoginScreen(), transition: Transition.fadeIn, duration: const Duration(milliseconds: durationAnime));
        }else{
          setState(() {
            _selectedIndex = 4;
          });
        }
        
      }else{
        _selectedIndex = index;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authProvider = Provider.of<AuthProvider>(context, listen: false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: black,
        selectedItemColor: primaryColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: white,
            icon: icon(EvaIcons.homeOutline),
            label: 'Acceuil',
            activeIcon: icon(EvaIcons.home, color: primaryColor)
          ),
           BottomNavigationBarItem(
            icon: icon(EvaIcons.searchOutline),
            label: 'Ouvrier',
            activeIcon: icon(EvaIcons.search, color: primaryColor)
          ),
          BottomNavigationBarItem(
            icon: icon(EvaIcons.plusSquareOutline),
            label: 'Publier',
            activeIcon: icon(EvaIcons.plusSquare, color: primaryColor)
          ),
          BottomNavigationBarItem(
            icon: icon(EvaIcons.bookmarkOutline),
            label: 'Mes Travaux',
            activeIcon: icon(EvaIcons.bookmark, color: primaryColor)
          ),
          BottomNavigationBarItem(
            icon: icon(EvaIcons.personOutline),
            label: 'Compte',
            activeIcon: icon(EvaIcons.person, color: primaryColor)
          ),
        ],
      ),
    );
  }
}
