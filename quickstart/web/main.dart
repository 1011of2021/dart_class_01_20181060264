import 'dart:html';
import 'dart:convert';

// 异步编程依赖
import 'dart:async';
import 'dart:html';
import 'dart:convert';

// 输入字段
late final InputElement favoriteNumber;
late final InputElement valueOfPi;
late final InputElement horoscope;
late final InputElement favOne;
late final InputElement favTwo;
late final InputElement favThree;
late final RadioButtonInputElement loveChocolate;
late final RadioButtonInputElement noLoveForChocolate;

// 结果字段
late final TextAreaElement intAsJson;
late final TextAreaElement doubleAsJson;
late final TextAreaElement stringAsJson;
late final TextAreaElement listAsJson;
late final TextAreaElement boolAsJson;
late final TextAreaElement mapAsJson;

late final UListElement wordList = querySelector('#wordList') as UListElement;

void main() {
  // 表单和JSON
  form_and_json();

  // 异步实例
  querySelector('#getWords')!.onClick.listen(makeRequest);
}

void form_and_json() {
    // 将表单数据转为JSON格式.
  favoriteNumber = querySelector('#favoriteNumber') as InputElement;
  valueOfPi = querySelector('#valueOfPi') as InputElement;
  horoscope = querySelector('#horoscope') as InputElement;
  favOne = querySelector('#favOne') as InputElement;
  favTwo = querySelector('#favTwo') as InputElement;
  favThree = querySelector('#favThree') as InputElement;
  loveChocolate = querySelector('#loveChocolate') as RadioButtonInputElement;
  noLoveForChocolate =
      querySelector('#noLoveForChocolate') as RadioButtonInputElement;

  // 设置数据显示元素，展示转为JSON格式的数据
  intAsJson = querySelector('#intAsJson') as TextAreaElement;
  doubleAsJson = querySelector('#doubleAsJson') as TextAreaElement;
  boolAsJson = querySelector('#boolAsJson') as TextAreaElement;
  stringAsJson = querySelector('#stringAsJson') as TextAreaElement;
  listAsJson = querySelector('#listAsJson') as TextAreaElement;
  mapAsJson = querySelector('#mapAsJson') as TextAreaElement;

  // 设置监听，callback函数为 _showJson
  favoriteNumber.onKeyUp.listen(_showJson);
  valueOfPi.onKeyUp.listen(_showJson);
  loveChocolate.onClick.listen(_showJson);
  noLoveForChocolate.onClick.listen(_showJson);
  horoscope.onKeyUp.listen(_showJson);
  favOne.onKeyUp.listen(_showJson);
  favTwo.onKeyUp.listen(_showJson);
  favThree.onKeyUp.listen(_showJson);

  _populateFromJson();
  _showJson();
}

// 第一次打开网页的默认数据
void _populateFromJson() {
  const jsonDataAsString = '''{
    "favoriteNumber": 73,
    "valueOfPi": 3.141592,
    "chocolate": true,
    "horoscope": "Cancer",
    "favoriteThings": ["monkeys", "parrots", "lattes"]
  }''';

  Map jsonData = json.decode(jsonDataAsString) as Map;

  favoriteNumber.value = jsonData['favoriteNumber'].toString();
  valueOfPi.value = jsonData['valueOfPi'].toString();
  horoscope.value = jsonData['horoscope'].toString();
  final favoriteThings = jsonData['favoriteThings'] as List<String>;
  favOne.value = favoriteThings[0];
  favTwo.value = favoriteThings[1];
  favThree.value = favoriteThings[2];

  final chocolateRadioButton =
      jsonData['chocolate'] == false ? noLoveForChocolate : loveChocolate;
  chocolateRadioButton.checked = true;
}

/// Display all values as JSON.
void _showJson([Event? _]) {
  // Grab the data that will be converted to JSON.
  final favNum = int.tryParse(favoriteNumber.value ?? '');
  final pi = double.tryParse(valueOfPi.value ?? '');
  final chocolate = loveChocolate.checked;
  final sign = horoscope.value;
  final favoriteThings = <String>[
    favOne.value ?? '',
    favTwo.value ?? '',
    favThree.value ?? '',
  ];

  final formData = {
    'favoriteNumber': favNum,
    'valueOfPi': pi,
    'chocolate': chocolate,
    'horoscope': sign,
    'favoriteThings': favoriteThings
  };

  // Convert to JSON and display results.
  intAsJson.text = json.encode(favNum);
  doubleAsJson.text = json.encode(pi);
  boolAsJson.text = json.encode(chocolate);
  stringAsJson.text = json.encode(sign);
  listAsJson.text = json.encode(favoriteThings);
  mapAsJson.text = json.encode(formData);
}

Future<void> makeRequest(Event _) async {
  // const path = 'https://api.bilibili.com/x/space/arc/search?mid=229733301&ps=30&tid=0&pn=1&keyword=&order=pubdate&jsonp=jsonp';
  const path = 'https://dart.dev/f/portmanteaux.json';
  final httpRequest = HttpRequest();
  httpRequest
    ..open('GET', path)
    ..onLoadEnd.listen((e) => requestComplete(httpRequest))
    ..send('');
}

void requestComplete(HttpRequest request) {
  if (request.status == 200) {
    final response = request.responseText;
    if (response != null) {
      processResponse(response);
      return;
    }
  }

  // The GET request failed. Handle the error.
  final li = LIElement()..text = 'Request failed, status=${request.status}';
  wordList.children.add(li);
}

void processResponse(String jsonString) {
  for (final portmanteau in json.decode(jsonString)) {
    wordList.children.add(LIElement()..text = portmanteau as String);
  }
}

