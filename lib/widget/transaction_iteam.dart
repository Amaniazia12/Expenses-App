import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
class TransactionIteam extends StatelessWidget {
  const TransactionIteam({
    Key key,
    @required  transaction,
    @required this.deletefun,
  }) : transaction = transaction, super(key: key);

  final Transaction transaction;
  final Function deletefun;

  @override
  Widget build(BuildContext context) {
    return Card (
      elevation: 3,
      child:Container( 
       child: Row ( 
         mainAxisAlignment: MainAxisAlignment.start,
           children: <Widget>[
             Container(
               height: 60,
               width: 60,
               margin: EdgeInsets.symmetric(
                 vertical: 10,
                 horizontal: 15
               ),
               decoration: BoxDecoration(
                 shape: BoxShape.circle,
                 color: Theme.of(context).primaryColor,
               ),
               padding: EdgeInsets.all(10),
               child: FittedBox(
                 child: Text(
                 '\$${transaction.amont.toStringAsFixed(2)}',
                 style:TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                    ) ,
                   ), 
                  ) 
                 ),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                     Text(
                       transaction.title,
                       
                       style: TextStyle(
                         fontSize: 18,
                         fontWeight: FontWeight.normal,
                       ),
                     ),
                      Text(
                       DateFormat().format(transaction.date),
                       style: TextStyle(
                         fontSize: 10,
                         fontWeight: FontWeight.normal,
                         color: Colors.grey
                       ),
                     ),
                     
                   ],
                   
                 ),
                 SizedBox(
                 width: MediaQuery.of(context).size.width-290,
                 ),
                  IconButton(
                     icon: Icon( 
                     Icons.delete,
                     color: Colors.grey,
                     ),
                   onPressed:()=> deletefun(transaction.id)
                    ),
                ]
           ),
     )
    );
  }
}