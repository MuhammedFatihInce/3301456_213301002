import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartPage extends StatefulWidget {

  @override
  _ChartPageState createState() => _ChartPageState();
}

class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = charts.Color(
      r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

class _ChartPageState extends State<ChartPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter+=1000;
    });
  }
  void _decreaseCounter() {
    setState(() {
      _counter-=1000;
    });
  }

  @override
  Widget build(BuildContext context) {
    var data = [
      ClicksPerYear('2021', 120000, Colors.red),
      ClicksPerYear('2022', 123000, Colors.yellow),
      ClicksPerYear('2023', _counter, Colors.green),
    ];

    var series = [
      charts.Series(
        domainFn: (ClicksPerYear clickData, _) => clickData.year,
        measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
        colorFn: (ClicksPerYear clickData, _) => clickData.color,
        id: 'Tıklama Sayısı',
        data: data,
      ),
    ];

    var chart = charts.BarChart(
      series,
      animate: true,
    );

    var chartWidget = Padding(
      padding: EdgeInsets.all(32.0),
      child: SizedBox(
        height: 200.0,
        child: chart,
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text("Yıllara Göre Satış Grafiği")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Toplam Gelir"),
            Text('$_counter', style: Theme.of(context).textTheme.displaySmall),
            chartWidget,
          ],
        ),
      ),
      floatingActionButton:
         Align(
           alignment: Alignment.bottomRight,
           child: Container(
             padding: EdgeInsets.symmetric(vertical: 200),
             child: Column(
               children: [
                 FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Artış',
                  child: Icon(Icons.add),
        ),
                 FloatingActionButton(
                   onPressed: _decreaseCounter,
                   tooltip: 'Azalış',
                   child: Icon(Icons.remove),
                 ),
               ],
             ),
           ),
         ),
    );
  }
}