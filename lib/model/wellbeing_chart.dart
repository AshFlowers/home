import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:home/model/wellbeing_scores.dart';
import 'package:home/themes.dart';

class WellbeingChart extends StatelessWidget {
  final List<WellbeingScore> data;

  WellbeingChart({required this.data});

  @override
  Widget build(BuildContext context) {
    final staticTicks = <charts.TickSpec<int>>[
      new charts.TickSpec(0),
      new charts.TickSpec(1),
      new charts.TickSpec(2),
      new charts.TickSpec(3),
      new charts.TickSpec(4),
      new charts.TickSpec(5)
    ];


    List<charts.Series<WellbeingScore, String>> scores = [
      charts.Series(
          id: "Wellbeing",
          data: data,
          domainFn: (WellbeingScore scores, _) => scores.month,
          measureFn: (WellbeingScore scores, _) => scores.score,
          colorFn: (WellbeingScore scores, _) => charts.ColorUtil.fromDartColor(AppColors.primary),
      )
    ];
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      height: 300,
      padding: const EdgeInsets.all(20),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                "WELLBEING SCORES",
                style: Theme.of(context).textTheme.titleSmall,
              ),

              Expanded(
                child: charts.BarChart(
                  scores,
                  animate: true,
                  primaryMeasureAxis: charts.NumericAxisSpec(
                      renderSpec: charts.GridlineRendererSpec(
                        labelStyle: charts.TextStyleSpec(color: charts.ColorUtil.fromDartColor(AppColors.primary))
                      ),
                      tickProviderSpec: new charts.StaticNumericTickProviderSpec(staticTicks),
                  ),
                  domainAxis: charts.OrdinalAxisSpec(
                    renderSpec: charts.GridlineRendererSpec(
                        labelStyle: charts.TextStyleSpec(color: charts.ColorUtil.fromDartColor(AppColors.primary))
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}

