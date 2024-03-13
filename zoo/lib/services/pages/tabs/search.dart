import 'package:flutter/material.dart';
import 'package:zoo/data/data.dart';
import 'package:zoo/services/models/house.dart';
import 'package:zoo/services/pages/reuseable/live_video.dart';
import 'package:zoo/services/pages/reuseable/offline_house.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.addFollow, required this.removeFollow, required this.donate});

  final Function addFollow;
  final Function removeFollow;
  final Function donate;

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _searchQuery = '';
  List<House> _filteredHouses = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                    _filteredHouses = filterHouses();
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredHouses.length,
                itemBuilder: (context, index) {
                  final house = _filteredHouses[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    child: house.online
                        ? LiveVideo(
                            house: house,
                            donate: widget.donate,
                          )
                        : OfflineHouse(
                            house: house,
                            addFollow: widget.addFollow,
                            removeFollow: widget.removeFollow,
                          ),
                  );
                },
              ),
            ),
          ],
        ),
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
