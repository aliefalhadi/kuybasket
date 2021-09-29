import 'package:flutter/material.dart';
import 'package:kuybasket/configs/constants/app_router_strings.dart';
import 'package:kuybasket/configs/themes/app_themes.dart';

class CardTanding extends StatefulWidget {
  final String name;
  final String tgl;
  const CardTanding({Key key, this.name, this.tgl}) : super(key: key);

  @override
  _CardTandingState createState() => _CardTandingState();
}

class _CardTandingState extends State<CardTanding> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
            context, AppRouterStrings.detailTanding);
      },
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                //                    <--- top side
                color: Colors.grey.withOpacity(0.2),
              ),
            )),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                      radius: 16,
                      child: Icon(
                        Icons.person,
                        size: 20,
                      )),
                  hSpace(8),
                  Text(
                    widget.name,
                    style: Theme.of(context)
                        .textTheme
                        .headline6,
                  ),
                ],
              ),
              vSpace(8),
              Text("Ayo tanding bersamaku"),
              vSpace(8),
              Row(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today_outlined,
                            size: 18),
                        hSpace(4),
                        Text(widget.tgl.substring(0,9)),
                      ],
                    ),
                  ),
                  hSpace(16),
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.access_alarm,
                          size: 18,
                        ),
                        hSpace(4),
                        Text("${widget.tgl.substring(11,16)} WIB"),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
