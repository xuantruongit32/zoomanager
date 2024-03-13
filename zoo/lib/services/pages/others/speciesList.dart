import 'package:flutter/material.dart';
import 'package:zoo/data/data.dart';
import 'package:zoo/services/pages/reuseable/speciesShow.dart';

class SpeciesList extends StatelessWidget {
  const SpeciesList({super.key, required this.addFollow, required this.removeFollow, required this.donate});

  final Function addFollow;
  final Function removeFollow;
  final Function donate;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (var species in DataManager.listSpecies)
            SpeciesShow(
              donate: donate,
              species: species,
              addFollow: addFollow,
              removeFollow: removeFollow,
            ),
        ],
      ),
    );
  }
}
