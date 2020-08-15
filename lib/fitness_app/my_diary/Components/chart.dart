import 'package:best_flutter_ui_templates/fitness_app/my_diary/Components/BodyProvider.dart';
import 'package:best_flutter_ui_templates/fitness_app/my_diary/Components/headContainer.dart';

/// Example of a simple line chart.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ChartProvider.dart';

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

class SimpleLineChart extends StatefulWidget {
  SimpleLineChart();

  @override
  _SimpleLineChartState createState() => _SimpleLineChartState();
}

class _SimpleLineChartState extends State<SimpleLineChart> {
  List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 5),
      new LinearSales(1, 25),
      new LinearSales(2, 25),
      new LinearSales(3, 10),
      new LinearSales(4, 25),
      new LinearSales(5, 15),
      new LinearSales(6, 0),
      new LinearSales(7, 20),
      new LinearSales(8, 30),
      new LinearSales(9, 10),
      new LinearSales(10, 50),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.Color.fromHex(code: '#1DA1A2'),
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    var buttons = Provider.of<Chart>(context);
    var tabButtons = Provider.of<Body>(context);

    List<Widget> listButton = [];
    for (int i = 0; i < buttons.buttons.length; i++) {
      listButton.add(ChangeNotifierProvider<Button>.value(
        value: buttons.buttons[i],
        child: selectButton(
          tapFunction: () {
            if (buttons.buttons[i].selected) return;
            for (var items in buttons.buttons) {
              items.selected = false;
            }
            buttons.buttons[i].selected = true;
          },
          id: i,
          text: buttons.buttons[i].text,
        ),
      ));
    }
    List<Widget> listTab = [];
    for (int i = 0; i < tabButtons.buttons.length; i++) {
      listTab.add(ChangeNotifierProvider<BodyButton>.value(
        value: tabButtons.buttons[i],
        child: selectBodyButton(
          tapFunction: () {
            if (tabButtons.buttons[i].selected) return;
            for (var items in tabButtons.buttons) {
              items.selected = false;
            }
            tabButtons.buttons[i].selected = true;
          },
          id: i,
          text: tabButtons.buttons[i].text,
        ),
      ));
    }

    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
          child: HeadContainer(),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              "Chỉ số cơ thể",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Color(0xff1da1a2),
              ),
            ),
          ),
        ),
        new Text(
          "March 10-16",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 14,
            color: Color(0xffc0c8cf),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 8.0,
          ),
          child: Row(
            children: listTab,
          ),
        ),
        new SizedBox(
          height: 375.0,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xff59CDB6),
              ),
              color: Colors.white,
            ),
            child: charts.LineChart(
              _createSampleData(),
              animate: false,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: listButton,
          ),
        ),
      ],
    );
  }

  selectBodyButton({int id, String text = "Huyết ấp", Function tapFunction}) {
    return Consumer<BodyButton>(
      builder: (context, value, _) => Expanded(
        child: InkWell(
          onTap: () {
            tapFunction();
          },
          child: new Container(
            alignment: Alignment.center,
            height: 40.00,
            width: 66.00,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  width: 2.0,
                  color: value.selected ? Color(0xff1DA1A2) : Colors.white,
                ),
              ),
            ),
            child: new Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Color(0xff1DA1A2),
              ),
            ),
          ),
        ),
      ),
    );
  }

  selectButton({int id, String text = "1T", Function tapFunction}) {
    return Consumer<Button>(
      builder: (context, value, _) => InkWell(
        onTap: () {
          tapFunction();
        },
        child: new Container(
          alignment: Alignment.center,
          height: 33.00,
          width: 66.00,
          decoration: BoxDecoration(
            color: value.selected ? Color(0xff1DA1A2) : Colors.white,
            borderRadius: BorderRadius.circular(10.00),
          ),
          child: new Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: value.selected ? Colors.white : Color(0xff1DA1A2),
            ),
          ),
        ),
      ),
    );
  }
}
