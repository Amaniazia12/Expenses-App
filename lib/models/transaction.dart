import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
class Transaction {
 final String id; 
 final String title ;
 final double amont ;
 final DateTime date ;

Transaction({
  @required this.id,
  @required this.amont,
  @required this.title,
  @required this.date
});
}