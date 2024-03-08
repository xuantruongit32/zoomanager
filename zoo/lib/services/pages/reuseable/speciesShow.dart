import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoo/data/data.dart';
import 'package:zoo/services/models/species.dart';
import 'package:zoo/services/pages/others/fullLiveVideoList.dart';

class SpeciesShow extends StatelessWidget {
  const SpeciesShow({Key? key, required this.species}) : super(key: key);

  final Species species;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FullLiveVideoList(
                        houseList: DataManager.getHousesBySpeciesId(species.id),
                      )));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
            color: Colors.white,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: AspectRatio(
                    aspectRatio: 9 / 16,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12.0),
                          bottomLeft: Radius.circular(12.0),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(species.avatar),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(10),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          species.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          species.des,
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
