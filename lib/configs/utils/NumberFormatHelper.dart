import 'package:intl/intl.dart';

String valueRupiah(int value)=>NumberFormat.currency(
    locale: 'id',
    decimalDigits: 0,
    symbol: "")
    .format(value);

String convertJam(String time)=> time.substring(0,5);