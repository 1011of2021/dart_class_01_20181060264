import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';

void grep(String path, String key_word) {
  Stream<List<int>> stream = new File(path).openRead();
  stream.transform(const Utf8Decoder())
        .transform(const LineSplitter())
        .listen((line) {
          if (line.contains(key_word)) {
            stdout.write(line);
            stdout.write("\n");
          }
        })
        .asFuture()
        .catchError((_) => print(_));
}

void main(List<String> arguments) {
  final parser = ArgParser()
                ..addOption('filePath', abbr: 'p')
                ..addOption('keyWord', abbr: 'k');

  ArgResults argResults = parser.parse(arguments);
  final path = argResults['filePath'];
  final key = argResults['keyWord'];

  grep(path, key);
}
