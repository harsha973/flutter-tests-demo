import 'package:flutter/material.dart';

class AnotherPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String messageFromPreviousPage = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text('Another page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello, Another page'),
            _padding16(),
            if(messageFromPreviousPage != null)
              Text(messageFromPreviousPage),
            _padding16(),
            RaisedButton(
              child: Text('Take me back'),
              onPressed: () {
                Navigator.of(context).pop("Success");
              },
            ),
          ],
        )
      ),
    );
  }

  SizedBox _padding16() => SizedBox(height: 16);

}