import 'package:blurbodybalance/pages/Setup/crud.dart';
import 'package:blurbodybalance/pages/home.dart';
import 'package:flutter/material.dart';

class UserrInfo extends StatefulWidget {
  _UserrInfoState createState() => _UserrInfoState();
}

class _UserrInfoState extends State<UserrInfo> {
  String _weight, _age, _height, _gender;

  CrudMethods crudObj = new CrudMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Gender'),
              onChanged: (value) {
                this._gender = value;
              },
            ),
            SizedBox(height: 5.0),
            TextField(
              decoration: InputDecoration(hintText: 'Age'),
              onChanged: (value) {
                this._age = value;
              },
            ),
            SizedBox(height: 5.0),
            TextField(
              decoration: InputDecoration(hintText: 'Weight'),
              onChanged: (value) {
                this._weight = value;
              },
            ),
            SizedBox(height: 5.0),
            TextField(
              decoration: InputDecoration(hintText: 'Height'),
              onChanged: (value) {
                this._height = value;
              },
            ),
            FlatButton(
              child: Text('Add'),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pop();
                crudObj.addData({
                  'Gender': this._gender,
                  'Age': this._age,
                  'Weight': this._weight,
                  'Height': this._height
                });
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
