import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

// Todo: New Transaction
// Todo: User Transaction
// Todo:  Transaction List

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [
    Transaction(id: 1, title: 'New Shoes', amount: 70, date: DateTime.now()),
    Transaction(id: 2, title: 'Old Bag', amount: 200, date: DateTime.now()),
    Transaction(id: 3, title: 'MacBook', amount: 900, date: DateTime.now()),
  ];
  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 10,
        title: Text('Expense Tracker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Card(
            elevation: 10,
            color: Colors.deepOrange,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                color: Colors.deepOrange,
                width: double.infinity,
                child: Text(
                  "Chart",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
          ),

          Card(
            elevation: 5,
            // margin: EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: "Name"),
                    controller: titleController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: "Amount"),
                    controller: amountController,
                  ),
                  SizedBox(height: 20),

                  TextButton(
                    onPressed: () {
                      print(titleController.text);
                    },
                    child: Text(
                      "Add Expense",
                      style: TextStyle(color: Colors.deepPurple, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Column(
            children: [
              ...transactions.map((item) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "\$ ${item.amount}",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            DateFormat.yMMMEd().format(item.date),
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
              // Card(
              //   child: Row(
              //     children: [
              //       Text("\$ 20"),
              //       Column(children: [Text("Expense title"), Text("date")]),
              //     ],
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
