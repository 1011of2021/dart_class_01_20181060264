String pickToughestKid() {
  return "Child";
}


class Line implements Comparable<Line> {
  final int length;
  const Line(this.length);

  @override
  int compareTo(Line other) => length - other.length;
}


class Person {
  final String firstName, lastName;

  Person(this.firstName, this.lastName);

  // Override hashCode using strategy from Effective Java,
  // Chapter 11.
  @override
  int get hashCode {
    int result = 17;
    result = 37 * result + firstName.hashCode;
    result = 37 * result + lastName.hashCode;
    return result;
  }

  // You should generally implement operator == if you
  // override hashCode.
  @override
  bool operator ==(dynamic other) {
    return other is Person &&
        other.firstName == firstName &&
        other.lastName == lastName;
  }
}


void core() {
  // print 会调用对象的 toString() 方法
  print("I drink tea.");

  // parse() 方法实现字符串转数字
  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);

  // radix 参数指定进制
  assert(int.parse('42', radix: 16) == 66);

  // Int 转 String
  assert(42.toString() == '42');

  // Double 转 String
  assert(123.456.toString() == '123.456');

  // Double 转 String 指定小数点后位数
  assert(123.456.toStringAsFixed(2) == '123.46');

  // Double 转 String 使用科学计数法
  assert(123.456.toStringAsPrecision(2) == '1.2e+2');
  assert(double.parse('1.2e+2') == 120.0);

  // 子串搜索
  assert('Never odd or even'.contains('odd'));

  // 前缀检查
  assert('Never odd or even'.startsWith('Never'));

  // 后缀检查
  assert('Never odd or even'.endsWith('even'));

  // 子串索引
  assert('Never odd or even'.indexOf('odd') == 6);

  // 字符串切片
  assert('Never odd or even'.substring(6, 9) == 'odd');

  // 指定模式的字符串切片
  var parts = 'structured web apps'.split(' ');
  assert(parts.length == 3);
  assert(parts[0] == 'structured');

  // UTF-16 编码的字符串索引（非字节，非字元）
  assert('Never odd or even'[0] == 'N');

  // split() 默认对每个字符进行分割
  for (final char in 'hello'.split('')) {
    print(char);
  }

  // 获得字符串中所有 UTF-16 编码单元
  var codeUnitList =
      'Never odd or even'.codeUnits.toList();
  assert(codeUnitList[0] == 78);

  // 消除空字符
  assert('  hello  '.trim() == 'hello');

  // 检查空串
  assert(''.isEmpty);

  // 只有空格的字符串不为空
  assert('  '.isNotEmpty);

  var greetingTemplate = 'Hello, NAME!';
  var greeting =
      greetingTemplate.replaceAll(RegExp('NAME'), 'Bob');

  // 字串替换，支持正则表达式
  assert(greeting != greetingTemplate);

  // 类似 Java？可以直接用列表添加
  var sb = StringBuffer();
  sb
  ..write('Use a StringBuffer for ')
  ..writeAll(['efficient', 'string', 'creation'], ' ')
  ..write('.');

  var fullString = sb.toString();

  assert(fullString ==
      'Use a StringBuffer for efficient string creation.');

  // 定义正则匹配模式
  var numbers = RegExp(r'\d+');

  var allCharacters = 'llamas live fifteen to twenty years';
  var someDigits = 'llamas live 15 to 20 years';

  // contains() 方法支持正则表达式
  assert(!allCharacters.contains(numbers));
  assert(someDigits.contains(numbers));

  // 将每个符合正则表达式的子串都替换掉
  var exedOut = someDigits.replaceAll(numbers, 'XX');
  assert(exedOut == 'llamas live XX to XX years');

  // 是否有匹配的子串
  assert(numbers.hasMatch(someDigits));

  // 迭代处理每个匹配的子串
  for (final match in numbers.allMatches(someDigits)) {
    print(match.group(0)); // 15, then 20
  }

  // 创建空列表 List<String>
  // List<T> 支持泛型
  var grains = <String>[];
  assert(grains.isEmpty);

  // 使用 List 表达式创建 List
  var fruits = ['apples', 'oranges'];

  // 向 List 中添加元素
  fruits.add('kiwis');

  // 向 List 中一次添加多个元素
  fruits.addAll(['grapes', 'bananas']);

  // 获取 List 长度
  assert(fruits.length == 5);

  // 移除一个元素
  var appleIndex = fruits.indexOf('apples');
  fruits.removeAt(appleIndex);
  assert(fruits.length == 4);

  // 清空 List
  fruits.clear();
  assert(fruits.isEmpty);

  // 使用构造方法生成指定的 List
  var vegetables = List.filled(99, 'broccoli');
  assert(vegetables.every((v) => v == 'broccoli'));

  fruits = ['apples', 'oranges'];

  // 使用索引查找指定位置的元素
  assert(fruits[0] == 'apples');

  // 使用 indexOf() 方法查找指定元素的索引
  assert(fruits.indexOf('apples') == 0);

  // 使用 sort() 方法排序
  fruits.sort((a, b) => a.compareTo(b));
  assert(fruits[0] == 'apples');

  // 创建空 Set<String>
  var ingredients = <String>{};

  // 添加元素
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  assert(ingredients.length == 3);

  // Set 无法添加重复的元素
  ingredients.add('gold');
  assert(ingredients.length == 3);

  // 移除一个元素
  ingredients.remove('gold');
  assert(ingredients.length == 2);

  // 可以使用 from() 构造方法构造 Set
  var atomicNumbers = Set.from([79, 22, 54]);

  ingredients = Set<String>();
  ingredients.addAll(['gold', 'titanium', 'xenon']);

  // 是否包含某个元素
  assert(ingredients.contains('titanium'));

  // 是否包含指定的所有元素
  assert(ingredients.containsAll(['titanium', 'xenon']));

  ingredients = Set<String>();
  ingredients.addAll(['gold', 'titanium', 'xenon']);

  // 创建两个集合的交集
  var nobleGases = Set.from(['xenon', 'argon']);
  var intersection = ingredients.intersection(nobleGases);
  assert(intersection.length == 1);
  assert(intersection.contains('xenon'));

  // Map 常用 String 作为 Key
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

  // 可以使用默认构造器创建 Map
  var searchTerms = Map();

  // Map 支持泛型，可以用任意类型做 Key 和 Value
  var nobleGasesMap = Map<int, String>();

  nobleGasesMap = {54: 'xenon'};

  // 使用 Key 获取 Value
  assert(nobleGasesMap[54] == 'xenon');

  // 是否有 Key == 54
  assert(nobleGasesMap.containsKey(54));

  // 移除一个键值对
  nobleGasesMap.remove(54);
  assert(!nobleGasesMap.containsKey(54));

  hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

  // 获取所有 Key，返回 Iterator
  var keys = hawaiianBeaches.keys;

  assert(keys.length == 3);
  assert(Set.from(keys).contains('Oahu'));

  // 获取所有 Key，返回 Iterator
  var values = hawaiianBeaches.values;
  assert(values.length == 3);
  assert(values.any((v) => v.contains('Waikiki')));

  // 是否包含指定的 Key
  assert(hawaiianBeaches.containsKey('Oahu'));
  assert(!hawaiianBeaches.containsKey('Florida'));

  // 使用 putIfAbsent() 方法当不存在 Key 时加入对应的键值对
  var teamAssignments = <String, String>{};
  teamAssignments.putIfAbsent(
      'Catcher', () => pickToughestKid());
  assert(teamAssignments['Catcher'] != null);

  // Map 使用 forEach() 需要两个参数来解包键值对
  hawaiianBeaches.forEach((k, v) {
    print('I want to visit $k and swim at $v');
    // I want to visit Oahu and swim at
    // [Waikiki, Kailua, Waimanalo], etc.
  });

  var teas = ['green', 'black', 'chamomile', 'earl grey'];

  bool isDecaffeinated(String teaName) =>
      teaName == 'chamomile';

  // 类似 SQL 的 where 条件查询
  var decaffeinatedTeas =
      teas.where((tea) => isDecaffeinated(tea));

  // any() 只需要一个元素满足条件 
  assert(teas.any(isDecaffeinated));

  // every() 查看是否所有元素都满足条件
  assert(!teas.every(isDecaffeinated));

  var uri_str = 'https://example.org/api?foo=some message';

  // uri 的编码和解码
  var encoded = Uri.encodeFull(uri_str);
  assert(encoded ==
      'https://example.org/api?foo=some%20message');

  var decoded = Uri.decodeFull(encoded);
  assert(uri_str == decoded);

  // 编码、解码所有的字符
  encoded = Uri.encodeComponent(uri_str);
  assert(encoded ==
      'https%3A%2F%2Fexample.org%2Fapi%3Ffoo%3Dsome%20message');

  decoded = Uri.decodeComponent(encoded);
  assert(uri_str == decoded);

  var uri =
      Uri.parse('https://example.org:8080/foo/bar#frag');

  // 获取 URI 的指定部分
  assert(uri.scheme == 'https');
  assert(uri.host == 'example.org');
  assert(uri.path == '/foo/bar');
  assert(uri.fragment == 'frag');
  assert(uri.origin == 'https://example.org:8080');

  // 通过 Uri 的各部分来构造 Uri
  uri = Uri(
      scheme: 'https',
      host: 'example.org',
      path: '/foo/bar',
      fragment: 'frag');
  assert(
      uri.toString() == 'https://example.org/foo/bar#frag');

  // 当前时间日期
  var now = DateTime.now();

  // 本地时区的 DateTime 对象
  var y2k = DateTime(2000); // January 1, 2000

  // 同上
  y2k = DateTime(2000, 1, 2); // January 2, 2000

  // UTC 时间的 DateTime 对象
  y2k = DateTime.utc(2000); // 1/1/2000, UTC

  // 时间戳转 DateTime
  y2k = DateTime.fromMillisecondsSinceEpoch(946684800000,
      isUtc: true);

  // ISO 8601 时间格式转 DateTime
  y2k = DateTime.parse('2000-01-01T00:00:00Z');

  // 比较对象
  var short = const Line(1);
  var long = const Line(100);
  assert(short.compareTo(long) < 0);

  var p1 = Person('Bob', 'Smith');
  var p2 = Person('Bob', 'Smith');
  var p3 = 'not a person';
  assert(p1.hashCode == p2.hashCode);
  assert(p1 == p2);
  assert(p1 != p3);
}


void main(List<String> args) {
  core();
}
