
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_iteam.dart';

class TransactionList extends StatelessWidget {
   @override
  final List <Transaction> _transactionList;
  final Function deletefun;
  TransactionList(this._transactionList,this.deletefun);
  @override
  Widget build(BuildContext context) {
    final isLandScape= MediaQuery.of(context).orientation==Orientation.landscape;
    return _transactionList.isEmpty ? 
      LayoutBuilder(builder: (ctx,constrains){
        return Column (
            children :[ 
              if (isLandScape) 
                 SizedBox(
                height: 50,
                ),
              if (!isLandScape)
                 const SizedBox(
                height: 110,
                ),
               Container(
                  padding:EdgeInsets.all(10),
                  height:constrains.maxHeight*0.4,
                  //width: constrains.maxWidth*0.2,
                  child: Image.asset('assets/images/waiting.png',fit: BoxFit.cover,)
                  ),
              SizedBox(
                  height: 50,
                ),
               const Text('No transactions added yet!',
                   textAlign: TextAlign.center,
                   style:TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color:Colors.grey,
                    )
                    ),
              ]
              );
      })
      :ListView.builder(
        
        itemBuilder: (ctx , index){
           return TransactionIteam(transaction: _transactionList[index], deletefun: deletefun);
        },
        itemCount: _transactionList.length,
      );
    
  }
}

