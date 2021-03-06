import 'package:characters/characters.dart';

typedef IntList = List<int>;

// unicode å­ç¬¦æ¯æ
void graphemeClusters() {
  var hi = "Hi, ð¨ð³";
  print(hi);
  print("æåä¸ä¸ªå­ç¬¦: ${hi.substring(hi.length - 1)}");
  print("æåä¸ä¸ªå­ç¬¦: ${hi.characters.last}");
}


// èªå®ä¹æ³¨è§£ï¼è®©æäººåæäº
class Todo {
  final String who;
  final String what;

  const Todo(this.who, this.what);
}


// å¼æ­¥çæå¨ è¿åå¼ä¸º Stream<Type> å¹¶ä½¿ç¨ async* å³é®å­
Stream<int> asynchronousNaturalsTo(int n) async* {
  int k = 0;
  while (k < n) yield k++;
}

// çæå¨ä½¿ç¨ yield æåºå¼ï¼å Python
// åæ­¥çæå¨ è¿åå¼ä¸ºIterator<Type> å¹¶ä½¿ç¨ sync* å³é®å­
// å¦æçæå¨æéå½è°ç¨ï¼ä½¿ç¨ yield* æåæ§è¡æ§è½
Iterable<int> naturalsTo(int n) sync* {
  int k = 0;
  while (k < n) yield k++;
}


// ä½¿ç¨ extends å³é®å­ä½¿å¾æ³ååªæ¯ææå®çèå´
// extends Object å¸¸ç¨äºæå®éç©ºç±»å
class Foo<T extends Object> {
  // Any type provided to Foo for T must be non-nullable.
}


// æ³åæ¥å£
abstract class Cache<T> {
  T getByKey(String key);
  void setByKey(String key, T value);
}


class Point {
  double? x; // Declare instance variable x, initially null.
  double? y; // Declare y, initially null.
  double? z; // Declare z, initially 0.

  Point(double? x, double? y) {
    this.x = x;
    this.y = y;
  }

  // æé å½æ°éå®å
  Point.alongXAxis(double x) : this(x, 0);

  double distanceTo(Point other) {
    return 10.0;
  }
}


class Vector {
  final int x, y;

  Vector(this.x, this.y);

  // æä½ç¬¦éè½½
  // éè½½ +
  Vector operator +(Vector v) => Vector(x + v.x, y + v.y);
  // éè½½ -
  Vector operator -(Vector v) => Vector(x - v.x, y - v.y);
}


class Rectangle {
  double left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  double get right => left + width;
  set right(double value) => left = value - width;
  double get bottom => top + height;
  set bottom(double value) => top = value - height;
}


abstract class Doer {
  // ä½¿ç¨ abstract å³é®å­å®ä¹æ¥å£

  void doSomething(); // å®ä¹æ¥å£çæ¹æ³
}


class EffectiveDoer extends Doer {
  void doSomething() {
    // å®ç°ç»§æ¿çæ¥å£çæ¹æ³
    print("è¿æ¯æ¥å£å®ç°ç print æ¹æ³");
  }
}


// ä¸ä¸ª person ç±»ï¼ å®ç°äº greet() æ¹æ³
class Person {
  final String _name;

  Person(this._name);

  // Perdon å®ç°ç greet æ¹æ³
  String greet(String who) => 'Hello, $who. I am $_name.';
}

// å®ç°äº Person ç±» API çç±»
class Impostor implements Person {
  String get _name => '';

  String greet(String who) => 'Hi $who. Do you know who I am?';
}

String greetBob(Person person) => person.greet('Bob');


class Performer {
  String name = "1";
 }


class Musician extends Performer with Musical {
  // Â·Â·Â·
}

class Maestro extends Musician with Musical {
  Maestro(String maestroName) {
    name = maestroName;
    canConduct = true;
  }
}


mixin Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }
}


// å®ä¹æä¸¾
enum Color { red, green, blue }


// ä¸ä¸ªç®åç DART ç¨åº
void printInteger(int aNumber) {
  print(' This number is $aNumber. ');
}


int _readThermometer() {
  return 42;
}

// åéç»ä¹ 
void variable() {
  // åé
  var name1 = 'Bob';
  Object name2 = 'Bob';
  String name3 = 'Bob';

  print(' We got a var name $name1, Object name $name2, String name $name3');

  // ç©ºå®å¨
  int? lineCount;
  assert(lineCount == null);
  print(' ç©ºå®å¨æ­è¨éè¿ ');

  // å»¶è¿èµå¼
  late String desc;
  desc = 'å±±æ¬';
  print(' å»¶è¿èµå¼ $desc ');

  // æåå§å
  late int temperature = _readThermometer();
  print(' Lazily Initialized: $temperature ');

  // å¸¸é
  final name4 = 'Bob';
  print(' We got final name: $name4 ');

  // ç¼è¯æ¶å¸¸é
  const bar1 = 10000;
  double atm = 3.14 * bar1;
  print(' We got 3.14 x const bar = $atm ');

  // å¸¸éä¸å¯å
  var foo = [];
  final bar2 = const [];
  const baz = [];  // ç­ä»·äº const []

  foo = [1, 2, 3, 4];
  print(' Only var foo can change: $foo ');

  // ç±»åæ£æ¥ä¸å¼ºå¶ç±»åè½¬æ¢
  const Object i = 42;
  const list = [i as int];
  print(' å¼ºå¶ç±»åè½¬æ¢ i as int: $list ');

  // map çæåç±»åæ£æ¥
  const map = {if (i is int) i: 'int'};
  print(' ç±»åæ£æ¥ map: $map ');

  // éåçæä¸ç±»åæ£æ¥
  const set = {if (list is List<int>) ...list};
  print(' ç±»åæ£æ¥ éå: $set ');
}

// åç½®ç±»åç»ä¹ 
void builtIn() {
  // æ´æ°ï¼åå­è¿å¶åææ°(ç§å­¦è®¡æ°æ³)
  var x = 1;
  var f = 1.2;
  var hex = 0xDFA45236;
  var exponent = 8e5;

  print(' Integer: $x, Float: $f,  HEX: $hex, EXPONET: $exponent ');

  // num ç±»åå¯ä»¥æ¯æ´æ°ä¹å¯ä»¥æ¯æµ®ç¹æ°
  num n = 1;
  print(' Num ç±»ååéï¼å­æ´æ°ï¼: n = $n ');
  n = 1.2;
  print(' Num ç±»ååéï¼å­æµ®ç¹æ°ï¼: n = $n ');

  // å­ç¬¦ä¸²è½¬num
  num a = int.parse('128');
  print(' å­ç¬¦ä¸² \'128\' è½¬ æ´æ° 128: $a ');

  // æ°å­è½¬å­ç¬¦ä¸²
  int b = 128;
  String tmp = b.toString();
  print(' æ°å­ 128 è½¬ å­ç¬¦ä¸² \'128\': $b ');

  int bitCalc1 = 3; // äºè¿å¶ 0011
  int bitCalc2 = 4; // äºè¿å¶ 0100

  // å·¦ç§»ä¸ä½
  assert((bitCalc1 << 1) == 6);
  print("3 << 1 == 6");

  // æä½æ
  assert((bitCalc1 | bitCalc2) == 7);
  print("3 | 4 == 7");

  // æä½ä¸
  assert((bitCalc1 & bitCalc2) == 0);
  print("3 & 4 == 0");

  // ç¼è¯æ¶å¸¸éç¥ï¼åCè¯­è¨é¢ç¼è¯å¸¸éä¼ éåå¸¸éåå¹¶
  print("ç¼è¯æ¶å¸¸éç¥ï¼åCè¯­è¨é¢ç¼è¯å¸¸éä¼ éåå¸¸éåå¹¶");

  var strEx = "åå¼å·æåå¼å·å¯ä»¥èªå¨åå»º String åé";
  print(strEx);

  // å­ç¬¦ä¸²æå¼
  var strInsert = " 'insert string'";
  print("ä½¿ç¨ \$ ç¬¦å·åå­ç¬¦ä¸²ä¸­æå¥ $strInsert å­ç¬¦ä¸²ï¼ä¸åå¸¸éå­ç¬¦ä¸²ç­ä»·");

  var strOld = "'old str'";
  var strTest = "å¯ä»¥ä½¿ç¨ '+' è¿è¡å­ç¬¦ä¸²çæ¼æ¥ï¼" + strOld + strInsert + "ï¼ä¹å¯ä»¥å¤è¡å­ç¬¦ä¸²èªå¨æ¼æ¥ï¼æ¯æpythonçå¤è¡å­ç¬¦ä¸²è¡¨è¾¾å¼";
  print(strTest);

  print("éè½¬ä¹å­ç¬¦ä¸²åpython");

  // è¿åboolå¼çè¡¨è¾¾å¼ææ¹æ³
  // ç©ºå­ç¬¦ä¸²å¤å®
  var fullName = '';
  assert(fullName.isEmpty);

  // å¤é¶
  var hitPoints = 0;
  assert(hitPoints <= 0);

  // ç©ºæ£æ¥
  var unicorn;
  assert(unicorn == null);

  // NaNï¼éæ°å­ï¼æ£æ¥
  var iMeantToDoThis = 0 / 0;
  assert(iMeantToDoThis.isNaN);

  // list
  var constantList = const [1, 2, 3];
  print("å¨ List çå­é¢å¼åæ·»å  const å³é®å­å¯ä»¥åå»ºç¼è¯æ¶å¸¸é: var constantList = cosnt [1, 2, 3]; åå»ºåæ¹æ³ç±»ä¼¼pythonï¼åç´ å¯ä»¥ç¨ifè¯­å¥ï¼æ [for (var i in List)] è¿è¡åè¡¨çæåæ·»å ");

  // list ç©ºå®å¨
  var nullList;
  var testList = [0, ...? nullList];
  print("ä½¿ç¨ ...? æä½ç¬¦è§£å List å¯ä»¥é¿å List ä¸ºç©ºå¯¼è´çå¼å¸¸");

  // Set ç±»ä¼¼python
  print("""
  ====================================================================
  Set ä½¿ç¨ <T>{} å£°æï¼æ .add æ·»å åç´ ï¼æ .addAll åå¹¶ Setã
  var s = const {1, 2, 3} åå»ºç¼è¯æ¶å¸¸éã
  """);

  // Map ç±»ä¼¼ Python ç dict, ä¸æ¯ä¸æ ·
  Map mapTest = <int, String> { 1: "æ", 2: "ä½ ", };
  print("""
  ====================================================================
  Example: $mapTest, mapTest[1] = ${mapTest[1]}, map_test[2] = ${mapTest[2]}
  var gifts = Map<String, String>(); åå»ºç©º Mapã
  ä¸ Python ä¸åï¼key ä¸å­å¨æ¶ gifs[key] ä¼è¿å nullï¼ä¸ä¼æåºå¼å¸¸ã
  final constantMap = const { 2: 'helium', 10: 'neon', 18: 'argon', }; åå»ºç¼è¯æ¶å¸¸é
  Map å¯ä»¥å List ä¸æ ·æ¯æä½¿ç¨æ©å±æä½ç¬¦ï¼... å ...?ï¼ä»¥åéåç if å for æä½ã
  """);
}

// ä¸ä¸ªå®ä¾ç±»
class A {
  static void bar() {} // ç±»çéææ¹æ³
  void baz() {} // å®ä¾çæ¹æ³
}

 // ä¸ä¸ªé¡¶çº§å½æ°å®ä¾
void foo() {}

// ç¨äºå±ç¤ºå½æ°åæ°çå®ä¹
void function_params({required String name}) {
  void say([String? gender]) {
    if (gender != null) {
      print("è½ç¶ $name æ¯ $genderï¼ä½æ¯ ä»/å¥¹ç½ªå¤§æ¶æ");
    }
    else {
      print("$name ç½ªå¤§æ¶æ");
    }
  }

  // å¯éä½ç½®åæ°è°ç¨
  say("ç·");
  say();
}

// å½æ°
void function_block() {
  // åæ°
  // ä¼ å¥å¯éå½ååæ°ï¼å½æ°åé¨åµå¥å®ä¹æå¯éä½ç½®åæ°çå½æ°

  function_params(name: "çäº");
  print("""
  ====================================================================
  å¿è¦åæ°ï¼åæ°ç±»ååæ·»å  required å³é®å­
  void function (required bool isFinished) {}

  æé»è®¤å¼çåæ°ï¼ä½¿ç¨ '=' ä¸ºå½¢åæ·»å é»è®¤å¼
  void function (bool isFinished = false) {}

  å¯éåæ°
    |ââ å¯éçä½ç½®åæ°ï¼ä½¿ç¨ [] åè£¹ä¸ç³»ååæ°ææå¯éåæ°ï¼å¯éåæ°å¿é¡»ä½äºå¿è¦åæ°åã
    |   void function (String from, [String? msg, String? private) {}
    |
    |ââ å¯éçå½ååæ°ï¼ä½¿ç¨ {arg1, arg2} æ¥æå®å½ååæ°ãå½ååæ°é»è®¤ä¸ºå¯éåæ°ï¼é¤éæ¾å¼å£°æä¸ºå¿è¦åæ°ã
        void function ({required bool isFinished, bool isShowDetails}) {}
        è°ç¨æ¶ä½¿ç¨ function(isFinished: true) æå®å½ååæ°
  """);

  // main å½æ°
  print("main å½æ°ä¸ºç¨åºå¥å£ï¼æå¯éä½ç½®åæ° List<String> argsï¼ç±»ä¼¼ Java çå½ä»¤è¡ä¼ åï¼ç¥ã");

  // å½æ°æ¯ä¸çº§å¯¹è±¡ï¼åpythonä¸æ ·
  print("å°å½æ°èµå¼ç»åéï¼var loudify = (msg) => { msg.toUpperCase() }; å Kotlin");
  void printElement(int element) {
    print(element);
  }

  var list = [1, 2, 3];

  // å°å½æ° printElement ä»¥åæ°çå½¢å¼ä¼ å¥ List ç forEach æ¹æ³
  list.forEach(printElement);

  // è¯æ³ä½ç¨å
  bool topLevel = true;

  void main() {
    var insideMain = true;

    void myFunction() {
      var insideFunction = true;

      void nestedFunction() {
        var insideNestedFunction = true;

        assert(topLevel);
        assert(insideMain);
        assert(insideFunction);
        assert(insideNestedFunction);
      }
    }
  }

    // é­å
  print("å½æ°é­åä¸ Python çé­åä¸è´ï¼åè Python è£é¥°å¨åç");
  Function makeAdder(int addBy) {
    return (int i) => addBy + i;
  }

  // ä¼ å¥ 2 å¹¶å°è¿åçå¿åå½æ°èµå¼ç» add2
  var add2 = makeAdder(2);
  assert(add2(3) == 5);
  assert(add2(5) == 7);

  // å½æ°æ¯å¦ç¸ç­
  



  Function x;

  // æ¯è¾é¡¶çº§å½æ°
  x = foo;
  assert(foo == x);

  // æ¯è¾éææ¹æ³
  x = A.bar;
  assert(A.bar == x);

  // æ¯è¾å®ä¾æ¹æ³
  var v = A(); // class A çç¬¬1ä¸ªå®ä¾
  var w = A(); // class A çç¬¬2ä¸ªå®ä¾
  var y = w;
  x = w.baz;

  // å®ä»¬é½æååä¸ä¸ªå®ä¾çåä¸ä¸ªæ¹æ³
  assert(y.baz == x);

  // å®ä»¬æåä¸åçå®ä¾
  assert(v.baz != w.baz);

  // è¿åå¼
  print("æ²¡ææ¾ç¤ºæ æ³¨è¿åç±»åçå½æ°é»è®¤ return null;");
}

// è¿ç®ç¬¦é¨å
void operator_block() {
  int a;
  int b;

  // èªå¢ï¼è¡¨è¾¾å¼è®¡ç®åï¼
  a = 0;
  b = ++a;
  assert(a == b); 

  // èªå¢ï¼è¡¨è¾¾å¼è®¡ç®åï¼
  a = 0;
  b = a++;
  assert(a != b);

  // èªåï¼è¡¨è¾¾å¼è®¡ç®åï¼
  a = 0;
  b = --a;
  assert(a == b); 

 // èªåï¼è¡¨è¾¾å¼è®¡ç®åï¼
  a = 0;
  b = a--; 
  assert(a != b); 

  // å³ç³»è¿ç®
  assert(2 == 2);
  assert(2 != 3);
  assert(3 > 2);
  assert(2 < 3);
  assert(3 >= 3);
  assert(2 <= 3);

  // å¼ºå¶ç±»åè½¬æ¢
  assert((1 as double) is double);

  // ç±»åå¤æ­
  assert(1 is int);

  // èµå¼è¿ç®ç¬¦
  // å°ä¸ä¸ªå¼èµç»åé a
  a = 2;
  // è¥ value ä¸ä¸º nullï¼åèµå¼ç» bï¼è¥ value ä¸º nullï¼å b ä¿æåæå¼
  // b ??= value;

  // å¤åèµå¼è¿ç®ç¬¦
  a *= 3; // ä¸åæ¹è¡¨è¾¾å¼ç­æ: a = a * 3
  assert(a == 6);

  // é»è¾è¿ç®ç¬¦
  var col = 0;
  if (!false && (col == 0 || col == 3)) {
    assert(true);
  }

  // ä½è¿ç®åç§»ä½è¿ç®ç¬¦
  final value = 0x22;
  final bitmask = 0x0f;

  assert((value & bitmask) == 0x02); // ä¸
  assert((value & ~bitmask) == 0x20); // ä¸é
  assert((value | bitmask) == 0x2f); // æ
  assert((value ^ bitmask) == 0x2d); // å¼æ
  assert((value << 4) == 0x220); // å·¦ç§»
  assert((value >> 4) == 0x02); // å³ç§»
  assert((value >>> 4) == 0x02); // é»è¾å³ç§»
  assert((-value >> 4) == -0x03); // ç®æ°å³ç§»
  assert((-value >>> 4) > 0); // æ ç¬¦å·å³ç§»

  // æ¡ä»¶è¡¨è¾¾å¼
  var visibility = true ? 'public' : 'private';
  String playerName(String? name) => name ?? 'Guest';

  // ä»¥ä¸ä¸¤ç§å¯ä»¥åæä»¥ä¸å½¢å¼
  // ä½¿ç¨ä¸åè¿ç®ç¬¦æ¿ä»£èè¿ç if-else ç return ç»æ
  // String playerName(String? name) => name != null ? name : 'Guest';

  // ä½¿ç¨ if-else çèè¿å½¢å¼
  // String playerName(String? name) {
  //   if (name != null) {
  //     return name;
  //   } else {
  //     return 'Guest';
  //   }
  // }

  // çº§èè¿ç®ç¬¦ï¼å½æ°å¼ç¼ç¨ï¼ï¼
  // çº§èæä½å¯ä»¥åµå¥
  var paint = 3
      ..toString();
  
  // ä½¿ç¨ ?.. é¿åå¯¹å¯è½ä¸ºç©ºçè¿åå¼ä½¿ç¨çº§è
  paint
  ?..toString();

  // å¶ä»è¿ç®ç¬¦
  // ()	ä½¿ç¨æ¹æ³	ä»£è¡¨è°ç¨ä¸ä¸ªæ¹æ³
  // []	è®¿é® List	è®¿é® List ä¸­ç¹å®ä½ç½®çåç´ 
  // .	è®¿é®æå	æåè®¿é®ç¬¦
  // ?.	æ¡ä»¶è®¿é®æå	ä¸ä¸è¿°æåè®¿é®ç¬¦ç±»ä¼¼ï¼ä½æ¯å·¦è¾¹çæä½å¯¹è±¡ä¸è½ä¸º nullï¼ä¾å¦ foo?.barï¼å¦æ foo ä¸º null åè¿å null ï¼å¦åè¿å bar
}

void process_control_block() {
    // If å Else
  if (true) {
    print("true branch");
  } else {
    print("false branch");
  }

  // For å¾ªç¯
  var message = StringBuffer('Dart is fun');
  for (var i = 0; i < 5; i++) {
    message.write('!');
  }

  var callbacks = [];
  for (var i = 0; i < 2; i++) {
    callbacks.add(() => print("For : $i"));
  }
  callbacks.forEach((c) => c());

  // For-In éå
  List for_in = [1, 2, 3, 4, 5, 6];
  for (final item in for_in) {
    print("For-In : $item");
  }

  print("forEach æ¹æ³: ");
  for_in.forEach(print);

  // while, break and continue
  int while_flag = 0;
  while (while_flag < 10) {
    if (while_flag == 5) {
      print("å½ while flag == 5ï¼ä½¿ç¨ continue ä¸æå° while å¾ªç¯å­æ ·");
      while_flag++;
      continue;
    }
    else if (while_flag == 9) {
      print("å½ while flag == 9 æ¶ä½¿ç¨ break ç»æ while å¾ªç¯");
      break;
    }
    else {
      print("while å¾ªç¯ $while_flag");
    }
    while_flag++;
  }

  // å¯è¿­ä»£å¯¹è±¡çå½æ°å¼ while å¾ªç¯ï¼æå°æ¯ä¸ª >= 2 çå¼
  for_in
    .where((c) => c >= 2)
    .forEach((c) => print(c));
  
  // Switch-Case
  var command = 'OPEN';
  switch (command) {
    case 'CLOSED':
      break;
    case 'PENDING':
      break;
    case 'APPROVED':
      break;
    case 'DENIED':
      break;
    case 'OPEN':
      print("Switch Case found OPEN");
      break;
    default:
      print("Switch Case æ å¹é");
  }

  // æ­è¨
  assert(100 > 15, "è¿ä¸ªæ­è¨ä¸å®è½æ­£å¸¸éè¿");
  print("æ­è¨ 100 > 15 æ­£å¸¸éè¿");

  // å¼å¸¸
  // throw FormatException('Expected at least 1 section');
  // å¯ä»¥æåºä»»ä½ä¸è¥¿
  // throw 'Out of llamas!';
  // å¯ä»¥æ¬æ finally å³é®å­ï¼ææå Python

  // æé å½æ°ï¼å¯ä»¥ä½¿ç¨ C++ çæ¹å¼å¨å½æ°ååå½æ°ä½ä¹é´åå§ååé
  var p = Point(2, 2);

  // è·åå®ä¾ä¸­ yçå¼
  assert(p.y == 2);

  // è°ç¨å®ä¾æ¹æ³
  double distance = p.distanceTo(Point(4, 4));

  // å¯ä»¥ä½¿ç¨æé å½æ°è¿åæé å¥½çå®ä¾
  var point = Point(1, 2);
  point.x = 4; 
  assert(point.x == 4);
  assert(point.z == null);
  print("æ²¡æä¼ å¼çå±æ§ä½¿ç¨ç©ºå®å¨ç¹æ§å¯ä»¥ç´æ¥åå§åä¸ºNull");

  // æä½ç¬¦éè½½
  print("æä½ç¬¦éè½½");
  final v = Vector(2, 3);
  final w = Vector(2, 2);

  assert(v + w == Vector(4, 5));
  print("Vector(2, 3) + Vector(2, 2) = Vector(4, 5)ï¼éè½½äº +");
  assert(v - w == Vector(0, 1));

  // Getter å Setter
  var rect = Rectangle(3, 4, 20, 15);
  assert(rect.left == 3);
  rect.right = 12;
  assert(rect.left == -8);
  print("ä½¿ç¨ type get property_name => {} å®ä¹Getter\nä½¿ç¨ set property_name(params) => {} å®ä¹Setter");

  // å®ä¹æ¥å£ï¼æ½è±¡ï¼
  print("ä½¿ç¨ abstract å³é®å­å®ä¹æ¥å£");

  // éå¼æ¥å£
  print("ä½¿ç¨ class ClassName implements OtherClass1, OtherClass2, ... {} æ¥å®ç°å¶ä»ç±»çæ¥å£ï¼é¿åç´æ¥ç»§æ¿ OtherClass");

  // æ©å±ä¸ä¸ªç±»
  print("ä½¿ç¨ class ClassName extends OtherClass {} å¯ä»¥æ©å±ä¸ä¸ªç±»ï¼ä½¿ç¨ super å¼ç¨ç¶ç±»ï¼ä½¿ç¨ @override éåç¶ç±»æå");

  // æ³åç¤ºä¾å¨ä¸è¾¹å¿

  // ä½¿ç¨åº
  print("""
import 'package:lib1/lib1.dart';
import 'package:lib2/lib2.dart' as lib2;


ä¸æ¹åºåç¼ï¼package
// åªå¯¼å¥ foo
import 'package:lib1/lib1.dart' show foo;

// ä¸å¯¼å¥ foo
import 'package:lib2/lib2.dart' hide foo;


å»¶è¿å¯¼å¥åªæ¯æ dart2jsï¼ä¾å¦ï¼import 'package:greetings/hello.dart' deferred as hello;
ä½¿ç¨ API æ¶ä½¿ç¨ .loadLibrary() æ¹æ³å è½½åº
Future<void> greet() async {
  await hello.loadLibrary();
  hello.printGreeting();
}
""");

  // å¼æ­¥æ¯æ
  print("""
å¼æ­¥ç¼ç¨ä½¿ç¨ async await å³é®å­ï¼ä¹å¯ä»¥ä½¿ç¨ Future API
ä½¿ç¨ try-catch-finally å¤ç await å¯¼è´çå¼å¸¸
ä½¿ç¨ Future<String> lookUpVersion() async => '1.0.0'; å£°æä¸ä¸ªå¼æ­¥å½æ°

ä½¿ç¨ await for å¤çå¼æ­¥ Stream
await for (varOrType identifier in expression) {
  // Executes each time the stream emits a value.
}
""");

  // çæå¨
  // åæ­¥çæå¨è¿å Iterator å¯¹è±¡ï¼å¼æ­¥çæå¨è¿å Stream å¯¹è±¡

  // å¯è°ç¨ç±»ï¼å®ç° Type call() æ¹æ³ï¼å Python ç __call__() é­æ³æ¹æ³

  // isolate ä»£æ¿çº¿ç¨

  // å«å
  IntList il = [1, 2, 3];
  print("å«åä¸º IntList ç List<int> ç±»åçåé: $il");

  // åæ°æ® @+ç¼è¯æ¶å¸¸éï¼ä½¿ç¨åå°å¨è¿è¡æ¶è·ååæ°æ®ä¿¡æ¯
  @Todo('ç³æ´', 'è®©è¿ä¸ªå½æ°æå° do something')
  void doSomething() {
    print('do something');
  }

  doSomething();

  // åè¡æ³¨é
  
  /**
   * å¤è¡æ³¨é
  */

  /// ææ¡£æ³¨éç¤ºä¾
  void docExample() {

  }
  
}

void main(List<String> arguments) {
  var number = 42;
  printInteger(number);

  variable();
  graphemeClusters();
  builtIn();
  function_block();
  operator_block();
  process_control_block();
}
