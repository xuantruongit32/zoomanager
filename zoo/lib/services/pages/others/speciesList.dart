import 'package:flutter/material.dart';
import 'package:zoo/data/data.dart';
import 'package:zoo/services/pages/reuseable/speciesShow.dart';

class SpeciesList extends StatelessWidget {
  const SpeciesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [for (var species in DataManager.listSpecies) SpeciesShow(species: species)],
      ),
    );
  }
}
