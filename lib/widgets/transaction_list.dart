import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopping_app/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTX;

  TransactionList(this.transactions, this.deleteTX);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text('No Transactions added yet!',
                    style: Theme.of(context).textTheme.title),
                SizedBox(
                  height: 30,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, id) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text('\$${transactions[id].amount}')),
                      ),
                    ),
                    title: Text(transactions[id].title,
                        style: Theme.of(context).textTheme.title),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[id].date),
                    ),
                    trailing: IconButton(onPressed: () => deleteTX(transactions[id].id), icon: Icon(Icons.delete), color: Theme.of(context).errorColor),
                  ),
                );
              },
              itemCount: transactions.length,
            );
  }
}
