import 'package:flutter/material.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/widget/particular/card_view.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey1,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 1,
        title: const Text("Notification", style: TextStyle(color: Colors.black),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: primaryColor,
          onPressed: () { Navigator.pop(context); },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 10),
        children: const [
           NotificationCardView()
        ],
      )
    );
  }
}



