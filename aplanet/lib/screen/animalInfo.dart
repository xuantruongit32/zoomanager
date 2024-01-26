import 'package:flutter/material.dart';

class AnimalInfoWidget extends StatelessWidget {
  final String image;
  final String species;
  final String name;
  final int age;
  final String gender;

  AnimalInfoWidget({
    required this.image,
    required this.species,
    required this.name,
    required this.age,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animal Information'),
      ),
      body: Center(
        child: Column(
          children: [
            Card(
              elevation: 5.0,
              margin: EdgeInsets.all(16.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        image,
                        width: 120.0,
                        height: 120.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    // Display information
                    Text(
                      'Species: $species',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    Text('Name: $name'),
                    Text('Age: $age'),
                    Text('Sex: $gender'),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Card(
                  elevation: 5.0,
                  margin: EdgeInsets.all(16.0),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            image,
                            width: 120.0,
                            height: 120.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        // Display information
                        Text(
                          'Species: $species',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        Text('Name: Luxi'),
                        Text('Age: 2'),
                        Text('Sex: $gender'),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 5.0,
                  margin: EdgeInsets.all(16.0),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            image,
                            width: 120.0,
                            height: 120.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        // Display information
                        Text(
                          'Species: $species',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        Text('Name: Baby Lu'),
                        Text('Age: 1'),
                        Text('Sex: Female'),
                      ],
                    ),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
