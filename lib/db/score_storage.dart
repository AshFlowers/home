import 'dart:io';
import 'package:path_provider/path_provider.dart';

class ScoreStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get scoresFile async {
    final path = await _localPath;
    return File('$path/scores.json');
  }

  Future<String> readScores() async {
      final file = await scoresFile;

      // Read the file
      final contents = await file.readAsString();
      return contents;
  }

  Future<File> write(String jsonString) async {
    final file = await scoresFile;
    return file.writeAsString(jsonString);
  }
}