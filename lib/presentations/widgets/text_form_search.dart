import 'package:flutter/material.dart';
import 'package:kuybasket/configs/themes/app_colors.dart';

class TextFormSearch extends StatelessWidget {
  const TextFormSearch({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Icon(Icons.search, size: 32, color: primaryColor,),
        hintText: "Cari lapangan",
        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.lightBlue.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            padding: EdgeInsets.all(8),
            child: Icon(Icons.filter_list_outlined, color: Colors.white,),
          ),
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.circular(14)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}