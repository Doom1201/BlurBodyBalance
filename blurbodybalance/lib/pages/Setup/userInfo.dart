import 'package:blurbodybalance/pages/Setup/crud.dart';
import 'package:blurbodybalance/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserrInfo extends StatefulWidget {
  const UserrInfo({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  _UserrInfoState createState() => _UserrInfoState();
}

class _UserrInfoState extends State<UserrInfo> {
  //String _weight, _age, _height, _gender;
  String _selectedAge = null;
  CrudMethods crudObj = new CrudMethods();
  @override
  Widget build(BuildContext context) {
    Widget titleSelection = Container(
        padding: const EdgeInsets.fromLTRB(120, 150, 0, 0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("About you",
                      style: TextStyle(
                        fontSize: 26.0,
                      )),
                ],
              ),
            )
          ],
        ));

    Widget titleDescSelection = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(45, 50, 0, 0),
                child: Text("This information lets us estimate calories",
                    style: TextStyle(fontSize: 15.0, color: Colors.grey)),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(18, 75, 0, 0),
                child: Text(
                    "and workout routines that are specifically tailored to",
                    style: TextStyle(fontSize: 14.0, color: Colors.grey)),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(170, 95, 0, 0),
                child: Text("you.",
                    style: TextStyle(fontSize: 14.0, color: Colors.grey)),
              )
            ],
          ),
        )
      ],
    );

    return MaterialApp(
        home: Scaffold(
      body: ListView(
        children: <Widget>[
          titleSelection,
          titleDescSelection,
          new Container(
            padding: EdgeInsets.fromLTRB(50, 250, 0, 0),
            child: DropdownButton(
              value: _selectedAge,
              items: _dropDownItem(),
              onChanged: (value) {
                _selectedAge = value;
                setState(() {});
              },
              hint: Text('Select Gender'),
            ),
          )
        ],
      ),
    ));
  }
}

List<DropdownMenuItem<String>> _dropDownItem() {
  List<String> gender = ["Male", "Female", "Other"];
  return gender
      .map((value) => DropdownMenuItem(
            value: value,
            child: Text(value),
          ))
      .toList();
}

/*
   child: Container(
        padding: EdgeInsets.fromLTRB(50, 250, 0, 0),
        child: DropdownButton(
          value: _selectedAge,
          items: _dropDownItem(),
          onChanged: (value) {
            _selectedAge = value;
            setState(() {});
          },
          hint: Text('Select Gender'),
        ),
      )
*/
