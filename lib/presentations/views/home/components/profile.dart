import 'package:flutter/material.dart';
import 'package:kuybasket/configs/constants/app_router_strings.dart';
import 'package:kuybasket/providers/login_provider.dart';
import 'package:kuybasket/providers/pemesanan_provider.dart';

import '../../base_view.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  LoginProvider loginProvider = LoginProvider();
  bool isSwitched = true;

  Widget build(BuildContext context) {
    return BaseView<PemesananProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Profile"),
          ),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [

                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.grey.withOpacity(0.2)))),
                  child: ListTile(
                    onTap: () {
                      loginProvider.logOut();
                      Navigator.pushNamedAndRemoveUntil(context, AppRouterStrings.onboard, (route) => false);
                    },
                    leading: Icon(Icons.logout),
                    title: Text("Keluar"),
                    trailing: Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 18,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      });
  }

}

// class showAlertDialogs extends StatefulWidget {
//   const showAlertDialogs({Key key}) : super(key: key);
//
//   @override
//   __showAlertDialogState createState() => __showAlertDialogState();
// }

// class __showAlertDialogState extends State<showAlertDialogs> {
//   bool isSwitched = true;
//
//   @override
//   Widget build(BuildContext context) async {
//     return await showDialog(
//       context: context,
//       builder: (context) {
//         return  AlertDialog(
//           title: Text("Ubah Status Lapangan"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Switch(
//                 value: isSwitched,
//                 onChanged: (value) {
//                   setState(() {
//                     isSwitched = !isSwitched;
//                     print(isSwitched);
//
//                   });
//                 },
//                 activeTrackColor: Colors.lightGreenAccent,
//                 activeColor: Colors.green,
//
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

class _Container extends StatelessWidget {
  const _Container({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.2)))),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, 'ganti-nohp');
        },
        leading: Icon(Icons.person),
        title: Text("Ganti Nomor HP"),
        trailing: Icon(
          Icons.arrow_forward_ios_sharp,
          size: 18,
        ),
      ),
    );
  }
}
