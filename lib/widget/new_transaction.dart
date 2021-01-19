
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

  class NewTransaction  extends StatefulWidget {
  final Function fun;
  NewTransaction(this.fun);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titlecontroller = TextEditingController();
  final amountcontroller=TextEditingController(); 
  DateTime _selectedDate;
void submitData() {
    final enteredTitle = titlecontroller.text;
    final enteredAmount = double.parse(amountcontroller.text);
    
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    if (_selectedDate == null){
      _selectedDate=DateTime.now();
    }
    widget.fun(
        titlecontroller.text,
        double.parse( amountcontroller.text),
        _selectedDate
        );
     Navigator.of(context).pop();
}
     void _packedDate(){
        showDatePicker(
         context: context,
         initialDate: DateTime.now(),
         firstDate: DateTime(2020),
         lastDate: DateTime.now(),
         ).then((packedDate){
            if (packedDate==null){
              return;
            }
            setState(() {
              _selectedDate=packedDate;
            });
         });
     }

  @override
  Widget build(BuildContext context) {
    return 
        SingleChildScrollView(
             child: Card(
              elevation: 40, //shadow
              child: Container(
                padding: EdgeInsets.only(
                  top:10,
                  left: 10,
                  right: 10,
                  bottom: MediaQuery.of(context).viewInsets.bottom +10
                  ),//da space ll7waf
                //margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'title'),
                      controller: titlecontroller,
                      onSubmitted: (_) => submitData(),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'price'),
                      controller: amountcontroller,
                      keyboardType: TextInputType.number,
                      onSubmitted: (_) => submitData(),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                           child: Text( _selectedDate==null ? 'No date chosen !': 
                           DateFormat().add_yMd().format(_selectedDate),
                            style: TextStyle(
                              color:Colors.grey,
                              fontSize: 15
                            ),),
                          ),
                          FlatButton(
                             child:Text('choose date',
                             style: TextStyle(
                               color:Theme.of(context).primaryColor,
                               fontWeight: FontWeight.bold
                             ),
                             ),
                             onPressed:_packedDate ,
                           )
                        ],
                      ),
                    )
                    ,
                    RaisedButton(
                      color: Theme.of(context).primaryColor,
                      onPressed:submitData,
                      child: Text('Add transaction',
                      style:TextStyle(
                      fontWeight: FontWeight.bold
                      )
                      ),
                    ),
                  ],
                ),
              ),
            ),
        );
  }
}