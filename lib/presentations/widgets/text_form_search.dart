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