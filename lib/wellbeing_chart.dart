import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:home/wellbeing_scores.dart';

class WellbeingChart extends StatelessWidget {
  final List<WellbeingScore> data;

  WellbeingChart({required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<WellbeingScore, String>> scores = [
      charts.Series(
          id: "Wellbeing",
          data: data,
          domainFn: (WellbeingScore scores, _) => scores.month,
          measureFn: (WellbeingScore scores, _) => scores.score,
          colorFn: (WellbeingScore scores, _) => scores.barColor,
      )
    ];
    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                "WELLBEING SCORES",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: charts.BarChart(scores, animate: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}

