import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alert App',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Alert Sample')),
        body: Center(
          child: HomePage(),
        ),
      ));
  }
}

class HomePage extends StatefulWidget {
  @override
  StartScreen createState()  => StartScreen();
}
int cnt=0;
String msg='';
String add(){
  cnt++;
  if(cnt==1) {
    msg='You pressed the button $cnt time!';
  }
  else {
    msg='You pressed the button $cnt times!';
  }
  return msg;
}


class StartScreen extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Alert'),
          content: Text(add()),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Ok'),
              child: const Text('Ok'),
            ),
          ],
        ),
      ),
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Colors.cyan,
        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0))),
      ),
      child: const Text('Press'),
    );
  }
}
