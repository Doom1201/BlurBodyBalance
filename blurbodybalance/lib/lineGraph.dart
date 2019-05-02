import 'package:charts_flutter/flutter.dart' as charts;
import 'package:blurbodybalance/pages/weightTracker.dart';

class LineGraph {
  //this chart uses DateTime for X axis
  static getTimeSeriesWeightChart(
      double goal, List<WeightDataObject> data, GraphLineColor lineColor) {
    return charts.TimeSeriesChart(
      _createDateTimeWeightData(goal, data, lineColor),
      animate: true,
    );
  }

  //this chart uses int as X axis
  // static getChart(data, GraphLineColor lineColor) {
  //   return charts.TimeSeriesChart(
  //     _createData(data, lineColor),
  //     animate: true,
  //   );
  // }
}

List<charts.Series<WeightDataObject, DateTime>> _createDateTimeWeightData(
    double goal, List<WeightDataObject> data, GraphLineColor lineColor) {
      //create data for goal line
      var goalData = new List<WeightDataObject>();
      data.forEach((element) {
        goalData.add(new WeightDataObject(goal, element.timestamp));
      });

  return [
    new charts.Series<WeightDataObject, DateTime>(
      id: 'weight',
      colorFn: (_, __) => getLineColor(lineColor),
      domainFn: (WeightDataObject weight, _) => weight.timestamp,
      measureFn: (WeightDataObject weight, _) => weight.weight,
      data: data,
    ),
    new charts.Series<WeightDataObject, DateTime>(
      id: 'goal',
      colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
      domainFn: (WeightDataObject goal, _) => goal.timestamp,
      measureFn: (WeightDataObject goal, _) => goal.weight,
      data: goalData,
    )
  ];
}

//template function
// List<charts.Series<YOURDATACLASS, int>> _createData(
//     List<YOURDATACLASS> data, GraphLineColor lineColor) {
//   return [
//     new charts.Series<YOURDATACLASS, int>(
//       id: 'id',
//       colorFn: (_, __) => getLineColor(lineColor),
//       domainFn: (YOURDATACLASS dataClass, _) => dataClass.x,
//       measureFn: (YOURDATACLASS dataClass, _) => dataClass.y,
//       data: data,
//     )
//   ];
// }

//enumeration of different colors offered. (more are offered, add one if you like)
enum GraphLineColor { Blue, Green, Red, LightGreen }

charts.Color getLineColor(GraphLineColor color) {
  var lineColor;

  switch (color) {
    case GraphLineColor.Blue:
      {
        lineColor = charts.MaterialPalette.blue.shadeDefault;
      }
      break;

    case GraphLineColor.Green:
      {
        lineColor = charts.MaterialPalette.green.shadeDefault;
      }
      break;

    case GraphLineColor.Red:
      {
        lineColor = charts.MaterialPalette.red.shadeDefault;
      }
      break;

    case GraphLineColor.LightGreen:
      {
        lineColor = charts.MaterialPalette.lime.shadeDefault;
      }
  }

  return lineColor;
}
