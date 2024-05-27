class Entry {
  String? title;
  String? entry;

  Entry({
    required this.title,
    required this.entry,
  });

  Map<String, dynamic> toJson() {
    final map = new Map<String, dynamic>();
    map['title'] = title;
    map['entry'] = entry;
    return map;
  }

  factory Entry.fromMap(Map<String, dynamic> data) {
    return new Entry(
        title: data['title'],
        entry: data['entry'],
    );
  }
}