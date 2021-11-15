import 'dart:io';
import 'dart:convert';


Future<void> analysis_file() async {
  try{
    var config = File('../README.md');

    // 以 String 的形式读取文件
    var stringContents = await config.readAsString();
    print(
        'The file is ${stringContents.length} characters long.');

    // 以行为单位，生成列表
    var lines = await config.readAsLines();
    print('The file is ${lines.length} lines long.');

    // 以 Bytes 的形式读取文件
    var contents = await config.readAsBytes();
    print('The file is ${contents.length} bytes long.');
  }
  catch (e) {
    print(e);
  }

  var config = File('../README.md');
  Stream<List<int>> inputStream = config.openRead();

  var lines = utf8.decoder
      .bind(inputStream)
      .transform(const LineSplitter());
  try {
    await for (final line in lines) {
      print('Got ${line.length} characters from stream');
    }
    print('file is now closed');
  } catch (e) {
    print(e);
  }
}


void main(List<String> args) {
  analysis_file();
}