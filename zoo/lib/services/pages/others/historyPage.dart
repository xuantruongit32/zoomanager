import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:zoo/data/data.dart';
import 'package:zoo/services/pages/others/housePage.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key, required this.addFollow, required this.removeFollow});
  final Function addFollow;
  final Function removeFollow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DataManager.donateList.isEmpty
          ? const Center(
              child: Text(
                'Please donate...',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: DataTable(
                  columns: const [
                    DataColumn(
                      label: Text('Date'),
                    ),
                    DataColumn(
                      label: Text('Gift'),
                    ),
                    DataColumn(
                      label: Text('Price'),
                    ),
                    DataColumn(
                      label: Text('Donate'),
                    ),
                    DataColumn(
                      label: Text('Before'),
                    ),
                    DataColumn(
                      label: Text('After'),
                    ),
                  ],
                  rows: DataManager.donateList
                      .map(
                        (e) => DataRow(
                          cells: [
                            DataCell(
                              Text(
                                DateFormat('dd-MM-yyyy').format(e.date),
                              ),
                            ),
                            DataCell(
                              Text(
                                e.giftName,
                              ),
                            ),
                            DataCell(
                              Text(
                                '\$${e.giftPrice.toStringAsFixed(2)}',
                              ),
                            ),
                            DataCell(
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          HousePage(house: e.who, addFollow: addFollow, removeFollow: removeFollow),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      e.who.name!,
                                    ),
                                    const Gap(10),
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(e.who.avatar!),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            DataCell(
                              Text('\$${e.beforeMoney.toStringAsFixed(2)}'),
                            ),
                            DataCell(
                              Text(
                                '\$${e.afterMoney.toStringAsFixed(2)}',
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
    );
  }
}
