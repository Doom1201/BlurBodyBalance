import 'package:charts_flutter/flutter.dart' as charts;
import 'package:blurbodybalance/pages/weightTracker.dart';

class LineGraph {
  static getTimeSeriesChart(data, GraphLineColor lineColor) {
    return charts.TimeSeriesChart(
      _createDateTimeData(data, lineColor),
      animate: true,
    );
  }
}

List<charts.Series<WeightDataObject, DateTime>> _createDateTimeData(
    List<WeightDataObject> data, GraphLineColor lineColor) {
  return [
    new charts.Series<WeightDataObject, DateTime>(
      id: 'weight',
      colorFn: (_, __) => getLineColor(lineColor),
      domainFn: (WeightDataObject weight, _) => weight.timestamp,
      measureFn: (WeightDataObject weight, _) => weight.weight,
      data: data,
    )
  ];
}

//enumeration of different colors offered. (more are offered, add one if you like)
enum GraphLineColor { Blue, Green, Red }

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
  }

  return lineColor;
}
