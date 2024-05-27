import 'dart:io';
import 'package:path_provider/path_provider.dart';

class EntryStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get entriesFile async {
    final path = await _localPath;
    return File('$path/entries.json');
  }

  Future<String> read() async {
    final file = await entriesFile;
    return file.readAsString();
  }

  Future<File> write(String jsonString) async {
    final file = await entriesFile;
    return file.writeAsString(jsonString);
  }
}