import 'package:blurbodybalance/pages/Setup/crud.dart';
import 'package:blurbodybalance/pages/Setup/pagehandler.dart';
import 'package:blurbodybalance/pages/Setup/crud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserrInfo extends StatefulWidget {
  const UserrInfo({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  _UserrInfoState createState() => _UserrInfoState();
}

class _UserrInfoState extends State<UserrInfo> {
  //String _weight, _age, _height, _gender;
  String _selectedAge = "July 24, 1980";
  String _selectedGender = "Male";
  String _selectedWeight = "160 lb";
  String _selectedHeight = "6'1\"";
  CrudMethods crudObj = new CrudMethods();
  Color bordCol = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(110, 150.0, 0.0, 0.0),
                    child: Text('About You',
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(40, 220.0, 0.0, 0.0),
                    child: Text("This information lets us estimate calories",
                        style: TextStyle(
                          fontSize: 15.0,
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(75, 240.0, 0.0, 0.0),
                    child: Text("and workouts tailored for you",
                        style: TextStyle(
                          fontSize: 15.0,
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(270, 240.0, 0.0, 0.0),
                    child: Text(".",
                        style: TextStyle(fontSize: 15.0, color: Colors.green)),
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(60, 280, 0, 0),
                      child: OutlineButton(
                        child: new Text(_selectedGender),
                        onPressed: () {
                          bordCol = Theme.of(context).accentColor;
                        },
                        borderSide: BorderSide(color: bordCol),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0)),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(200, 280, 0, 0),
                      child: OutlineButton(
                        child: new Text(_selectedAge),
                        onPressed: () {
                          bordCol = Theme.of(context).accentColor;
                        },
                        borderSide: BorderSide(color: bordCol),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0)),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(60, 350, 0, 0),
                      child: OutlineButton(
                        child: new Text(_selectedWeight),
                        onPressed: () {
                          bordCol = Theme.of(context).accentColor;
                        },
                        borderSide: BorderSide(color: bordCol),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0)),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(200, 350, 0, 0),
                      child: OutlineButton(
                          child: new Text(_selectedHeight),
                          onPressed: () {
                            bordCol = Theme.of(context).accentColor;
                          },
                          borderSide: BorderSide(
                            color: bordCol,
                          ),
                          shape: new StadiumBorder())),
                  Container(
                      padding: EdgeInsets.fromLTRB(230, 650, 0, 0),
                      child: RaisedButton(
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          "Get Started",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new PageHandler()));
                          CrudMethods().addData("userData");
                        },
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}
