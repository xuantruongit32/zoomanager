import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:zoo/data/data.dart';
import 'package:zoo/network/fire_store.dart';
import 'package:zoo/services/models/transaction.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final TextEditingController _amountController = TextEditingController();
  bool _transactionSuccess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 250,
                width: 250,
              ),
              const Gap(20),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Amount (USD)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.attach_money),
                ),
              ),
              const Gap(20),
              ElevatedButton.icon(
                onPressed: () async {
                  int amount = int.tryParse(_amountController.text) ?? 0;
                  if (amount <= 0) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Please enter a valid amount.'),
                    ));
                    return;
                  }

                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => UsePaypal(
                      sandboxMode: true,
                      clientId: "ARNPpOudVsEFOwQXa8vTyhxFncwow7DZJSOUAjMgYczjUF43plAdrsC3xMkYsx58p8opBE-3j-3wNdeq",
                      secretKey: "EMa3JJBTZroOmw5ujAaza43SHQSCaB5lbMchubiskUaL8qMi8xpwra2294nahlB13agxPVb1aNSxFwvf",
                      returnURL: "success.snippetcoder.com",
                      cancelURL: "cancel.snippetcoder.com",
                      transactions: [
                        {
                          "amount": {
                            "total": amount.toString(),
                            "currency": "USD",
                            "details": {"subtotal": amount.toString(), "shipping": '0', "shipping_discount": 0}
                          },
                        }
                      ],
                      note: "Contact us for any questions on your order.",
                      onSuccess: (Map params) async {
                        setState(() {
                          Trans tran = Trans(
                            amount: double.parse(_amountController.text),
                            date: DateTime.now(),
                          );
                          DataManager.trans.add(tran);
                          FireStore().addTransactionToFireStore(tran);
                          _transactionSuccess = true;
                        });
                        DataManager.money += amount;
                        FireStore().updateMoney();
                        print("onSuccess: $params");
                      },
                      onError: (error) {
                        print("onError: $error");
                        Navigator.pop(context);
                      },
                      onCancel: () {
                        print('cancelled:');
                      },
                    ),
                  ));
                },
                icon: const Icon(Icons.shopping_cart),
                label: const Text('Checkout'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  textStyle: const TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const Gap(20),
              if (_transactionSuccess || DataManager.trans.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: DataTable(
                    columnSpacing: 20,
                    columns: const [
                      DataColumn(
                        label: Text('     Date', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      DataColumn(
                        label: Text('Amount (USD)', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                    rows: [
                      ...DataManager.trans.map(
                        (e) => DataRow(
                          cells: [
                            DataCell(
                              Text(DateFormat('dd-MM-yyyy').format(e.date)),
                            ),
                            DataCell(
                              Text(
                                '      ' + e.amount.toStringAsFixed(2),
                              ),
                            ),
                          ],
                        ),
                      ),
                      DataRow(cells: [
                        const DataCell(
                          Text('     Total', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        DataCell(
                          Text(
                            '      ' + DataManager().getTotalTrans().toStringAsFixed(2),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ])
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }
}
