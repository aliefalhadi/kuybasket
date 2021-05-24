import 'package:flutter/material.dart';
import 'package:kuybasket/configs/themes/app_colors.dart';
import 'package:kuybasket/configs/themes/app_themes.dart';

class SetJamPemesanan extends StatelessWidget {
  const SetJamPemesanan({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('Pilih Jam'),
          ),
          Divider(),
          Container(
            height: 200,
            child: Scrollbar(
              child: ListView(
                children: [
                  CheckboxListTile(
                      title: Text("07.00"),
                      value: false,
                      onChanged: (value) {
                        return true;
                      }),
                  CheckboxListTile(
                      title: Text("08.00"),
                      value: false,
                      onChanged: (value) {
                        return true;
                      }),
                  CheckboxListTile(
                      title: Text("09.00"),
                      value: false,
                      onChanged: (value) {
                        return true;
                      }),
                  CheckboxListTile(
                      title: Text("09.00"),
                      value: false,
                      onChanged: (value) {
                        return true;
                      }),
                  CheckboxListTile(
                      title: Text("09.00"),
                      value: false,
                      onChanged: (value) {
                        return true;
                      }),
                  CheckboxListTile(
                      title: Text("09.00"),
                      value: false,
                      onChanged: (value) {
                        return true;
                      }),
                  CheckboxListTile(
                      title: Text("09.00"),
                      value: false,
                      onChanged: (value) {
                        return true;
                      }),
                  CheckboxListTile(
                      title: Text("09.00"),
                      value: false,
                      onChanged: (value) {
                        return true;
                      }),
                  CheckboxListTile(
                      title: Text("09.00"),
                      value: false,
                      onChanged: (value) {
                        return true;
                      }),
                  CheckboxListTile(
                      title: Text("09.00"),
                      value: false,
                      onChanged: (value) {
                        return true;
                      }),
                  CheckboxListTile(
                      title: Text("09.00"),
                      value: false,
                      onChanged: (value) {
                        return true;
                      }),
                  CheckboxListTile(
                      title: Text("09.00"),
                      value: false,
                      onChanged: (value) {
                        return true;
                      }),
                  CheckboxListTile(
                      title: Text("09.00"),
                      value: false,
                      onChanged: (value) {
                        return true;
                      }),
                  CheckboxListTile(
                      title: Text("09.00"),
                      value: false,
                      onChanged: (value) {
                        return true;
                      }),
                  CheckboxListTile(
                      title: Text("109.00"),
                      value: false,
                      onChanged: (value) {
                        return true;
                      })
                ],
              ),
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RaisedButton(
                  child: Text("Pilih", style: textWhite,),
                  color: primaryColor,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
