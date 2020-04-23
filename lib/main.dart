import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Fuel Calculator',
    home: FuelConsumption()));

class FuelConsumption extends StatefulWidget {
  @override
  _FuelConsumptionState createState() => _FuelConsumptionState();
}

class _FuelConsumptionState extends State<FuelConsumption> {
  String dist = '';
  String curren = 'Rupees';
  TextEditingController calcdistance = new TextEditingController();
  TextEditingController calcavg = new TextEditingController();
  TextEditingController calcprice = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Fuel Consumption Calc.'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
        child: Center(
          widthFactor: 100,
          child: Column(
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.number,
                controller: calcdistance,
                decoration: InputDecoration(
                    hintText: 'eg. 123',
                    labelText: 'Distance',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: calcavg,
                decoration: InputDecoration(
                    hintText: 'eg. 20',
                    labelText: 'KM per litre',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: calcprice,
                decoration: InputDecoration(
                    hintText: 'eg. 50',
                    labelText: 'Price',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 10,
              ),
              DropdownButton<String>(
                items: ['Rupees', 'Dirham', 'Dollars'].map((String val) {
                  return DropdownMenuItem<String>(value: val, child: Text(val,textScaleFactor: 1.5,));
                }).toList(),
                onChanged: (String val) {
                  setState(() {
                    curren = val;
                  });
                },
                value: curren,
              ),
              RaisedButton(
                child: Text('Calculate',style: TextStyle(color: Colors.white), textScaleFactor: 1.5),
                color: Theme.of(context).primaryColorDark,
                onPressed: () {
                  setState(() {
                    dist = _calculate();
                  });
                },
              ),
              Text(
                dist,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }

  String _calculate() {
    double _distance = double.parse(calcdistance.text);
    double _avg = double.parse(calcavg.text);
    double _price = double.parse(calcprice.text);
    double _total = _distance / _avg * _price;
    String _result = 'The total cost of your trip is ' +
        _total.toStringAsFixed(2) +
        ' ' +
        curren;
    return _result;
  }
}
