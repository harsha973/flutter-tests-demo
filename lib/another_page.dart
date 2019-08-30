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
            SizedBox(height: 16,),
            if(messageFromPreviousPage != null)
              Text(messageFromPreviousPage)
          ],
        )
      ),
    );
  }

}