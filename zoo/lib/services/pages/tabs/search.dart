import 'package:flutter/material.dart';
import 'package:zoo/data/data.dart';
import 'package:zoo/services/models/house.dart';
import 'package:zoo/services/pages/reuseable/live_video.dart';
import 'package:zoo/services/pages/reuseable/offline_house.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _searchQuery = '';
  List<House> _filteredHouses = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
                _filteredHouses = filterHouses();
              });
            },
            decoration: InputDecoration(
              hintText: 'Search...',
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredHouses.length,
              itemBuilder: (context, index) {
                final house = _filteredHouses[index];
                return Column(
                  children: [
                    house.online ? LiveVideo(house: house) : OfflineHouse(house: house),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<House> filterHouses() {
    if (_searchQuery.isEmpty) {
      return [];
    } else {
      return DataManager.listHouse
          .where((house) => house.name.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }
  }
}
