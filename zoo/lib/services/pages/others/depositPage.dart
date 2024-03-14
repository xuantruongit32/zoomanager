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
      appBar: AppBar(
        title: const Text(
          "PayPal Checkout",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
              if (_transactionSuccess)
                DataTable(
                  columns: const [
                    DataColumn(label: Text('Transaction ID')),
                    DataColumn(label: Text('Amount (USD)')),
                  ],
                  rows: [
                    ...DataManager.trans.map(
                      (e) => DataRow(
                        cells: [
                          DataCell(Text(DateFormat('dd-MM-yyyy').format(e.date))),
                          DataCell(
                            Text(
                              e.amount.toStringAsFixed(2),
                            ),
                          ),
                        ],
                      ),
                    ),
                    DataRow(cells: [
                      const DataCell(
                        Text('Total'),
                      ),
                      DataCell(
                        Text(
                          DataManager().getTotalTrans().toStringAsFixed(2),
                        ),
                      ),
                    ])
                  ],
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
