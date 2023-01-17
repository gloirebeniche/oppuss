
import 'package:flutter/material.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key, required this.text, required this.icon, required this.press,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        onPressed: press,
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
              color: Colors.blue,),
            const SizedBox(width: 20,),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                  Text(text,
                  style: const TextStyle(color: Colors.black, fontSize: 15,)),
                  const SizedBox(height: 10,),
                  const Divider(height: 1, thickness: 2,)
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
