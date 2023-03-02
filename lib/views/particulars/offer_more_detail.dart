import 'package:flutter/material.dart';
import 'package:oppuss/widget/customized_appbar.dart';

class OfferMoreDetailPage extends StatelessWidget {
  const OfferMoreDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2("Detail de l'offre", context),
    );
  }
}