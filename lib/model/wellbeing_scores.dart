class WellbeingScore {
  final String month;
  final double? score;

  WellbeingScore({
    required this.month,
    required this.score,
  });

  Map<String, dynamic> toJson() {
    final map = new Map<String, dynamic>();
    map["month"] = month;
    map["score"] = score;
    return map;
  }

  factory WellbeingScore.fromMap(Map<String, dynamic> data) {
    return new WellbeingScore(
        month: data['month'],
        score: data['score']
    );
  }
}



