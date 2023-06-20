// ignore_for_file: unnecessary_brace_in_string_interps
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/widget/button_widget_app.dart';


class AddDay extends StatefulWidget {
  //final dynamic idDomaine;
  AddDay({super.key}); //required this.idDomaine};

  @override
  State<AddDay> createState() => _AddDayState();
}

class _AddDayState extends State<AddDay> {
  late PageController _pageController;
  DateTime today = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

  void _onDaySelected(DateTime day, DateTime focusedDay){
    setState(() {
      today = day;
    });
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    List<Widget> widget = [

      Container(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customeTextStyle("Quel est votre besoins ?", white, fontWeight: FontWeight.bold, size: 28),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              margin: const EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Column(
                children:  [
                  Expanded(
                    child: TextField(
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

      // Container(
      //   padding: padding,
      //   child: Column(
      //     children: [
      //       customeTextStyle("Souhaitez-vous ajouter des photo?", white, fontWeight: FontWeight.bold, size: 28)
      //     ],
      //   ),
      // ),

      // Container(
      //   padding: padding,
      //   child: Column(
      //     children: [
      //       customeTextStyle("Quels jours vous convient le mieux ?" , white, fontWeight: FontWeight.bold, size: 28),
      //       Container(
      //         margin: const EdgeInsets.only(top: 50),
      //         decoration: BoxDecoration(
      //           color: white,
      //           borderRadius: BorderRadius.circular(10)
      //         ),
      //         child: TableCalendar(
      //           locale: "fr_FR",
      //           headerStyle: const HeaderStyle(formatButtonVisible: false, titleCentered: true),
      //           availableGestures: AvailableGestures.all,
      //           selectedDayPredicate: (day) => isSameDay(day, today),
      //           focusedDay: DateTime.now(), 
      //           firstDay: DateTime.now(), 
      //           lastDay: DateTime.utc(2025),
      //           onDaySelected: _onDaySelected,
      //         ),
      //       )
      //     ],
      //   ),
      // ),


      Container(
        padding: padding,
        child: Column(
          children: [
            customeTextStyle("Nous estimons l'heure du rendez-vous, cela vous convient-il ?", white, fontWeight: FontWeight.bold, size: 28),

            Container(
              margin: const EdgeInsets.only(top: 100, bottom: 10),
              child: customeTextStyle("${time.hour}:${time.minute}", white, fontWeight: FontWeight.bold, size: 30)
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

      Container(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customeTextStyle("Quelle est l'adresse de la prestation ?", white, fontWeight: FontWeight.bold, size: 28),
            Container(
              height: 50,
              margin: const EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Column(
                children:  [
                  Expanded(
                    child: TextField(
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

      Container(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customeTextStyle("À quel numéro de téléphone l'ouvrier pourra-t-l vous joindre ?", white, fontWeight: FontWeight.bold, size: 28),
            Container(
              height: 50,
              margin: const EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Column(
                children:  [
                  Expanded(
                    child: TextField(
                      cursorColor: black,
                      cursorHeight: 20,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "06 483 8870",
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

    ];
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade600,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey.shade600,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: widget,
            )
          ),
          Container(
            margin: margin,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Expanded(child: Padding(
                padding: const EdgeInsets.all(2),
                child: defaultButtonOutlined("Precedent", () { 
                  _pageController.previousPage(duration: const Duration(milliseconds: 300),
                    curve: Curves.ease);
                }),
              )),
              Expanded(child: Padding(
                padding: const EdgeInsets.all(2),
                child: defaultButton("Suivant", () {
                  _pageController.nextPage(duration: const Duration(milliseconds: 300),
                    curve: Curves.ease
                  );
                 }),
              ))
            ],)
          )
        ],
      )
    );
  }
}