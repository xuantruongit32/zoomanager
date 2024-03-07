import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoo/services/pages/others/fullLiveVideoList.dart';
import 'package:zoo/services/pages/others/speciesList.dart';

class BrowsePage extends StatefulWidget {
  BrowsePage({Key? key}) : super(key: key);

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
                color: _selectedPage == 0 ? Colors.black : Colors.deepPurple,
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
                color: _selectedPage == 1 ? Colors.black : Colors.deepPurple,
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
        children: [SpeciesList(), FullLiveVideoList()],
      ),
    );
  }
}
