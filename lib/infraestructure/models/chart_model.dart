import 'package:fl_chart/fl_chart.dart';

class SpotValue {
  final DateTime date;
  final double value;

  SpotValue({required this.date, required this.value});
}

class ChartModel {
  final List<SpotValue> values;

  ChartModel({required this.values});

  List<FlSpot> toFlSpot() {
    values.sort((a, b) => a.date.compareTo(b.date));

    return values.map<FlSpot>((value) {
      final month = value.date.month / 10;
      final year = value.date.year;

      final xValue = year + month;

      return FlSpot(xValue, value.value);
    }).toList();
  }
}
