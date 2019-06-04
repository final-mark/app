import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {
  final String name;
  SubjectCard(@required this.name);
  // final String content = 'content';

  @override
  Widget build(BuildContext context) {
    final content = 'hello';

    return Center(
      child: Card(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.book),
              title: Text(this.name),
              subtitle: Text('Just a Test.'),
            ),
            // ButtonTheme.bar(
            //   // make buttons use the appropriate styles for cards
            //   child: ButtonBar(
            //     children: <Widget>[
            //       FlatButton(
            //         child: const Text('SEE MORE'),
            //         onPressed: () {/* ... */},
            //       ),
            //       FlatButton(
            //         child: const Text('CLICK'),
            //         onPressed: () {/* ... */},
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
