import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoo/data/data.dart';
import 'package:zoo/services/pages/others/fullLiveVideoList.dart';
import 'package:zoo/services/pages/others/speciesList.dart';

class BrowsePage extends StatefulWidget {
  BrowsePage({Key? key, required this.addFollow, required this.removeFollow, required this.donate}) : super(key: key);

  final Function addFollow;
  final Function removeFollow;
  final Function donate;

  @override
  _BrowsePageState createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  final _controller = PageController(initialPage: 0);
  int _selectedPage = 0;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _selectedPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              _controller.animateToPage(
                0,
                duration: const Duration(
                  milliseconds: 500,
                ),
                curve: Curves.easeInOut,
              );
              setState(() {
                _selectedPage = 0;
              });
            },
            child: Text(
              'Species',
              style: TextStyle(
                color: _selectedPage == 0 ? Colors.deepPurple : Colors.black,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              _controller.animateToPage(
                1,
                duration: const Duration(
                  milliseconds: 500,
                ),
                curve: Curves.easeInOut,
              );
              setState(() {
                _selectedPage = 1;
              });
            },
            child: Text(
              'Total Live House',
              style: TextStyle(
                color: _selectedPage == 1 ? Colors.deepPurple : Colors.black,
              ),
            ),
          ),
          const Gap(50),
        ],
      ),
      body: PageView(
        onPageChanged: _onPageChanged,
        controller: _controller,
        scrollDirection: Axis.horizontal,
        children: [
          SpeciesList(
            donate: widget.donate,
            addFollow: widget.addFollow,
            removeFollow: widget.removeFollow,
          ),
          FullLiveVideoList(
            donate: widget.donate,
            houseList: DataManager.listHouse,
            addFollow: widget.addFollow,
            removeFollow: widget.removeFollow,
          )
        ],
      ),
    );
  }
}
