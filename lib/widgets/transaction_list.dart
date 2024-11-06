import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children:  [
         const  Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Бүгін, 21 қазан"),
                Row(
                  children: [
                    Text("Барлық транзакциялар"),
                  ],
                ),
              ],
            ),
          ),
          const ListTile(
            leading: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 239, 243, 245),
              child: Icon(
                Icons.fitness_center,
                color: Colors.purpleAccent,
              ),
            ),
            title: Text("Спортзал"),
            subtitle: Text("Төлем"),
            trailing: Text(
              "-\₸15 000",
              // style: TextStyle(color: Colors.red),
            ),
          ),
          Divider(color: Colors.grey[200],),
          const ListTile(
            leading: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 239, 243, 245),
              child: Icon(
                Icons.account_balance,
                color: Colors.teal,
              ),
            ),
            title: Text("Keremet Bank"),
            subtitle: Text("Депозит"),
            trailing: Text(
              "+\₸105 000",
              style: TextStyle(color: Colors.teal),
            ),
          ),
          Divider(color: Colors.grey[200],),
          const ListTile(
            leading: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 239, 243, 245),
              child: Icon(
                Icons.send,
                color: Colors.orangeAccent,
              ),
            ),
            title: Text("Murat Abdilda"),
            subtitle: Text("Жіберілді"),
            trailing: Text(
              "-\₸10 000",
              // style: TextStyle(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
