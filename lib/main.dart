import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fuel Calculator',
        home: FuelConsumption()));

class FuelConsumption extends StatefulWidget {
  @override
  _FuelConsumptionState createState() => _FuelConsumptionState();
}

class _FuelConsumptionState extends State<FuelConsumption> {
  String dist='';
  String curren='A';
  TextEditingController calcdistance=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Fuel Consumption Calc.'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(40),

        child: Center(
          widthFactor: 100,
          child: Column(
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.number,
                controller: calcdistance,
                decoration:
                  InputDecoration(
                    hintText:'eg. 123',
                    labelText: 'Distance',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),

              ),
              RaisedButton(
                onPressed: (){
                  setState(() {
                    dist=calcdistance.text;
                  });
                },
              ),
              /*DropdownButton<String>(
                items: ['A','B','C'].map((String val){
                  return DropdownMenuItem<String>(
                    value: val,
                    child:Text(val)
                  );
                }).toList()
                , onChanged: (String val) {
                  setState(() {
                    curren=val;
                  });
              },
                value: curren,


              )*/

              Text(dist,
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold
              ),)
            ],
          ),
        ),
      ),
    );
  }
}