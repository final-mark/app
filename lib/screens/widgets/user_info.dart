import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {

  final userInfo;
  final isToggled;

  UserInfo(this.userInfo, this.isToggled);

  @override
  State<StatefulWidget> createState() {
    return _UserInfo(this.userInfo, this.isToggled);
  }
}


class _UserInfo extends State<UserInfo> {

  dynamic userInfo;
  dynamic isToggled;

  _UserInfo(this.userInfo, this.isToggled);

  @override
  Widget build(BuildContext context) {

    final initialPadding = MediaQuery.of(context).padding.top + 10;

    final width = MediaQuery.of(context).size.width;
    final textWidth = width * 0.98;
    final iconMargin = (width - textWidth) / 2;

    return GestureDetector(
      child: Column(
        children: <Widget> [
          Container(height: initialPadding, color: Colors.blue),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: iconMargin),
                child: Icon(Icons.person,
                    color: Colors.white
                  )
                ),
                Container(
                  width: textWidth * 0.85, // prevent text overflowing
                  child: Text("${this.userInfo['name']}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(color: Colors.white)),
                ),
                Container(
                  margin: EdgeInsets.only(right: iconMargin),
                  child: !this.isToggled() ?
                    Icon(Icons.keyboard_arrow_up, color: Colors.white) :
                    Icon(Icons.keyboard_arrow_down, color: Colors.white)
                )
              ]),
          Container(height: 20),
          Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: iconMargin),
                  child: Icon(Icons.assessment,
                      color: Colors.white
                  ),
                ),
                Container(width: 10),
                Text("CRA:",
                    style: TextStyle(color: Colors.white)),
                Container(width: 5),
                Text("${this.userInfo['cra']}",
                    style: TextStyle(color: Colors.white)),
                Container(width: 15),
                Text("Concluídas:",
                    style: TextStyle(color: Colors.white)),
                Container(width: 5),
                Text(this.userInfo['total_subjects'],
                    style: TextStyle(color: Colors.white)),
                Container(width: 15),
                Text("Períodos:",
                    style: TextStyle(color: Colors.white)),
                Container(width: 5),
                Text("${this.userInfo['semesters']}/${this.userInfo['max_semesters']}",
                    style: TextStyle(color: Colors.white))
              ]),
        ]
      )
    );

  }

}
