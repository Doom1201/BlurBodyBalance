/// Example of a simple line chart.
/// Still working on making this a generalized graph
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;
  final xAxis = [];
  final yAxis = [];


  SimpleLineChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory SimpleLineChart.withInputData() {
    return new SimpleLineChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(seriesList, animate: animate);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearData, int>> _createSampleData() {
    final data = [
      new LinearData(0, 5),
      new LinearData(1, 25),
      new LinearData(2, 100),
      new LinearData(3, 75),
    ];

    return [
      new charts.Series<LinearData, int>(
        id: 'Data',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearData sales, _) => sales.xAxis,
        measureFn: (LinearData sales, _) => sales.yAxis,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class LinearData {
  final int xAxis;
  final int yAxis;

  LinearData(this.xAxis, this.yAxis);
}