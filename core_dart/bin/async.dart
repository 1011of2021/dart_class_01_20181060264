import 'dart:io';
import 'package:http/http.dart' as http;

 
 Future _startMethod() async{
  print("A开始执行这个方法~");
  var content = await getHttp();
  print("A执行结束");
  return content;
}

String firstLine(String str) {
  var lists = str.split('\n');

  return lists[0];
}


Future<String> getHttp() async {
  final result = await http.get(Uri.parse('https://www.jianshu.com/'));
  return result.body.toString();
}

// 异步网络请求示例
void main(List<String> args) {
  // 链式异步编程
  _startMethod()
  .then((value) => firstLine(value))
  .then((value) => print("请求网页的第一行：$value"));
  print("C开始");
}