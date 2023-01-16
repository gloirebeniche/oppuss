import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AllOuvrier extends StatefulWidget {
  const AllOuvrier({super.key});

  @override
  State<AllOuvrier> createState() => _AllOuvrierState();
}

class _AllOuvrierState extends State<AllOuvrier> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Tout les Ouvriers"),
      ),
    );
  }
}
