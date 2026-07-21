import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction({super.key, required this.onAddTx});

  final Function onAddTx;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController amountController = TextEditingController();
  DateTime? selectedDate;

  void handleOnSubmit() {
    final String title = titleController.text;

    final int amount = int.parse(amountController.text);

    if (title.isEmpty || amount <= 0 || selectedDate == null) {
      return;
    }

    widget.onAddTx(
      title,
      amount,
      selectedDate,
    ); // Pass the selected date to the callback
    // Navigator.of(context).pop()

    Navigator.of(context).pop(); // Close the modal after submission
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
      // Handle the selected date here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
              onSubmitted: (_) => handleOnSubmit(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              onSubmitted: (_) => handleOnSubmit(),
              keyboardType: TextInputType.number,
            ),

            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  selectedDate == null
                      ? "No Date Chosen"
                      : "Picked Date: ${DateFormat('yyyy-MM-dd').format(selectedDate!)}",
                  // Or friendly formats like DateFormat('MMM d, yyyy') -> "Jul 21, 2026"
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    _presentDatePicker();
                  },
                  icon: Icon(Icons.calendar_today),
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
            SizedBox(height: 20),

            TextButton(
              onPressed: () {
                handleOnSubmit();
              },
              child: Text(
                "Add Expense",
                style: TextStyle(color: Colors.deepPurple, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
