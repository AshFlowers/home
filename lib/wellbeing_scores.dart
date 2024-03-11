import 'package:charts_flutter/flutter.dart' as charts;

class WellbeingScore {
  final String month;
  final double score;
  final charts.Color barColor;

  WellbeingScore(
      {
        required this.month,
        required this.score,
        required this.barColor
      }
  );

}