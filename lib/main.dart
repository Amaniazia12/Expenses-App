import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './widget/transactionlist.dart';
import './models/transaction.dart';
import './widget/new_transaction.dart';
import './widget/total_Expenses.dart';

main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]
  );
  runApp(MyApp());
}
class MyApp  extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'my Expensess',
      home: MyHomePage(),
      theme: ThemeData(
        primaryColor: Colors.limeAccent[400],
      )
    );
  }  
}
class MyHomePage  extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState() ;
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
    double totalExpenses = 0;
    int id =0;
    List<Transaction> _transactionList=[];
    @override
    void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }
    @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
       print(state);
     }
  
    @override
    void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _addnewtransaction(String txtitle , double txamount,DateTime selectedDate){
    final  _newtrans =Transaction(
      title: txtitle,
      amont: txamount ,
      date:selectedDate,
      id: id.toString()
      );
    setState(() {
     _transactionList.add(_newtrans);
     totalExpenses =totalExpenses+ txamount;
     id = id +1;
    });
   }
  void _showAddNewtransactionContenar(BuildContext ctx ){
      showModalBottomSheet(context: ctx , builder: (_){
       return GestureDetector (
         onTap: (){},
         child: NewTransaction(_addnewtransaction),
         behavior: HitTestBehavior.opaque,
         );
      },
      );
    }
  void _deleteTransaction (String id){
      setState(() {
        for (var i =0;i< _transactionList.length;i++){
          if (_transactionList[i].id==id){
            totalExpenses=totalExpenses - _transactionList[i].amont;
          }
        }
        _transactionList.removeWhere((trans) => trans.id == id ); 
        });
    }
  Widget _builderISLandScapeContent ( MediaQueryData mediaQuery , AppBar appBar){
    return Container(
              height: 
              ( mediaQuery.size.height -
              appBar.preferredSize.height-
              mediaQuery.padding.top) *0.45,
              padding: EdgeInsets.all(10),
              child: TotalExpenses(totalExpenses)
            );
  }
  Widget _builderISNotLandScapeContent ( MediaQueryData mediaQuery , AppBar appBar){
    return Container(
              height: 
              (mediaQuery.size.height -
              appBar.preferredSize.height-
              mediaQuery.padding.top) *0.2,
              padding: EdgeInsets.all(10),
              child: TotalExpenses(totalExpenses)
            );
  }
    @override
  Widget build(BuildContext context) {
    final mediaQuery= MediaQuery.of(context);
    final isLandScape= mediaQuery.orientation==Orientation.landscape;
    final appBar=AppBar( title: Text('My Expenses'),);
     return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          width: mediaQuery.size.width,
          child: Column(
          children: [
            if (isLandScape) _builderISLandScapeContent(mediaQuery, appBar),
            if (!isLandScape) _builderISNotLandScapeContent(mediaQuery, appBar),
            Container(
             height:(
              mediaQuery.size.height -
              appBar.preferredSize.height-
              mediaQuery.padding.top) *0.8,
             child: TransactionList(_transactionList,_deleteTransaction)),
           ],
          ),
        ),
      ),
   
     floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
       floatingActionButton: FloatingActionButton(
         backgroundColor: Theme.of(context).primaryColor,
         child: Icon(
           Icons.add,
           color: Colors.black,),
         onPressed: ()=>_showAddNewtransactionContenar(context),
        ),
    );
  }
}