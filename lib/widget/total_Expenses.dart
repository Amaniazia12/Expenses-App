import 'package:flutter/material.dart';
class TotalExpenses extends StatelessWidget {
  final double _totalExpenses;
  TotalExpenses(this._totalExpenses);
  @override
  Widget build(BuildContext context) {
    return  Card(
             elevation: 15,
             child: Container(
               padding: EdgeInsets.all(15),
               child: Column(
                children:[ 
                  Text('Total Expenses :',
                    style: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.bold,
                   //color: Theme.of(context).primaryColor,
                 ),
                 ),
                 Padding(
                   padding: EdgeInsets.all(10),
                   child: Text('\$${_totalExpenses.toStringAsFixed(2)}',
                   style: TextStyle(
                       fontSize: 20,
                   ),
                   ),
                 ),
                 ]
               ),
             ),
            );
  }
}