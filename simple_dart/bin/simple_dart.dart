import 'package:characters/characters.dart';

typedef IntList = List<int>;

// unicode 字符支持
void graphemeClusters() {
  var hi = "Hi, 🇨🇳";
  print(hi);
  print("最后一个字符: ${hi.substring(hi.length - 1)}");
  print("最后一个字符: ${hi.characters.last}");
}


// 自定义注解，让某人做某事
class Todo {
  final String who;
  final String what;

  const Todo(this.who, this.what);
}


// 异步生成器 返回值为 Stream<Type> 并使用 async* 关键字
Stream<int> asynchronousNaturalsTo(int n) async* {
  int k = 0;
  while (k < n) yield k++;
}

// 生成器使用 yield 抛出值，同 Python
// 同步生成器 返回值为Iterator<Type> 并使用 sync* 关键字
// 如果生成器有递归调用，使用 yield* 提升执行性能
Iterable<int> naturalsTo(int n) sync* {
  int k = 0;
  while (k < n) yield k++;
}


// 使用 extends 关键字使得泛型只支持指定的范围
// extends Object 常用于指定非空类型
class Foo<T extends Object> {
  // Any type provided to Foo for T must be non-nullable.
}


// 泛型接口
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

  // 构造函数重定向
  Point.alongXAxis(double x) : this(x, 0);

  double distanceTo(Point other) {
    return 10.0;
  }
}


class Vector {
  final int x, y;

  Vector(this.x, this.y);

  // 操作符重载
  // 重载 +
  Vector operator +(Vector v) => Vector(x + v.x, y + v.y);
  // 重载 -
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
  // 使用 abstract 关键字定义接口

  void doSomething(); // 定义接口的方法
}


class EffectiveDoer extends Doer {
  void doSomething() {
    // 实现继承的接口的方法
    print("这是接口实现的 print 方法");
  }
}


// 一个 person 类， 实现了 greet() 方法
class Person {
  final String _name;

  Person(this._name);

  // Perdon 实现的 greet 方法
  String greet(String who) => 'Hello, $who. I am $_name.';
}

// 实现了 Person 类 API 的类
class Impostor implements Person {
  String get _name => '';

  String greet(String who) => 'Hi $who. Do you know who I am?';
}

String greetBob(Person person) => person.greet('Bob');


class Performer {
  String name = "1";
 }


class Musician extends Performer with Musical {
  // ···
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


// 定义枚举
enum Color { red, green, blue }


// 一个简单的 DART 程序
void printInteger(int aNumber) {
  print(' This number is $aNumber. ');
}


int _readThermometer() {
  return 42;
}

// 变量练习
void variable() {
  // 变量
  var name1 = 'Bob';
  Object name2 = 'Bob';
  String name3 = 'Bob';

  print(' We got a var name $name1, Object name $name2, String name $name3');

  // 空安全
  int? lineCount;
  assert(lineCount == null);
  print(' 空安全断言通过 ');

  // 延迟赋值
  late String desc;
  desc = '山本';
  print(' 延迟赋值 $desc ');

  // 懒初始化
  late int temperature = _readThermometer();
  print(' Lazily Initialized: $temperature ');

  // 常量
  final name4 = 'Bob';
  print(' We got final name: $name4 ');

  // 编译时常量
  const bar1 = 10000;
  double atm = 3.14 * bar1;
  print(' We got 3.14 x const bar = $atm ');

  // 常量不可变
  var foo = [];
  final bar2 = const [];
  const baz = [];  // 等价于 const []

  foo = [1, 2, 3, 4];
  print(' Only var foo can change: $foo ');

  // 类型检查与强制类型转换
  const Object i = 42;
  const list = [i as int];
  print(' 强制类型转换 i as int: $list ');

  // map 生成和类型检查
  const map = {if (i is int) i: 'int'};
  print(' 类型检查 map: $map ');

  // 集合生成与类型检查
  const set = {if (list is List<int>) ...list};
  print(' 类型检查 集合: $set ');
}

// 内置类型练习
void builtIn() {
  // 整数，十六进制和指数(科学计数法)
  var x = 1;
  var f = 1.2;
  var hex = 0xDFA45236;
  var exponent = 8e5;

  print(' Integer: $x, Float: $f,  HEX: $hex, EXPONET: $exponent ');

  // num 类型可以是整数也可以是浮点数
  num n = 1;
  print(' Num 类型变量（存整数）: n = $n ');
  n = 1.2;
  print(' Num 类型变量（存浮点数）: n = $n ');

  // 字符串转num
  num a = int.parse('128');
  print(' 字符串 \'128\' 转 整数 128: $a ');

  // 数字转字符串
  int b = 128;
  String tmp = b.toString();
  print(' 数字 128 转 字符串 \'128\': $b ');

  int bitCalc1 = 3; // 二进制 0011
  int bitCalc2 = 4; // 二进制 0100

  // 左移一位
  assert((bitCalc1 << 1) == 6);
  print("3 << 1 == 6");

  // 按位或
  assert((bitCalc1 | bitCalc2) == 7);
  print("3 | 4 == 7");

  // 按位与
  assert((bitCalc1 & bitCalc2) == 0);
  print("3 & 4 == 0");

  // 编译时常量略，同C语言预编译常量传递和常量合并
  print("编译时常量略，同C语言预编译常量传递和常量合并");

  var strEx = "双引号或单引号可以自动创建 String 变量";
  print(strEx);

  // 字符串插值
  var strInsert = " 'insert string'";
  print("使用 \$ 符号向字符串中插入 $strInsert 字符串，与原常量字符串等价");

  var strOld = "'old str'";
  var strTest = "可以使用 '+' 进行字符串的拼接：" + strOld + strInsert + "，也可以多行字符串自动拼接，支持python的多行字符串表达式";
  print(strTest);

  print("非转义字符串同python");

  // 返回bool值的表达式或方法
  // 空字符串判定
  var fullName = '';
  assert(fullName.isEmpty);

  // 判零
  var hitPoints = 0;
  assert(hitPoints <= 0);

  // 空检查
  var unicorn;
  assert(unicorn == null);

  // NaN（非数字）检查
  var iMeantToDoThis = 0 / 0;
  assert(iMeantToDoThis.isNaN);

  // list
  var constantList = const [1, 2, 3];
  print("在 List 的字面值前添加 const 关键字可以创建编译时常量: var constantList = cosnt [1, 2, 3]; 创建及方法类似python，元素可以用if语句，有 [for (var i in List)] 进行列表生成和添加");

  // list 空安全
  var nullList;
  var testList = [0, ...? nullList];
  print("使用 ...? 操作符解包 List 可以避免 List 为空导致的异常");

  // Set 类似python
  print("""
  ====================================================================
  Set 使用 <T>{} 声明，有 .add 添加元素，有 .addAll 合并 Set。
  var s = const {1, 2, 3} 创建编译时常量。
  """);

  // Map 类似 Python 的 dict, 一毛一样
  Map mapTest = <int, String> { 1: "我", 2: "你", };
  print("""
  ====================================================================
  Example: $mapTest, mapTest[1] = ${mapTest[1]}, map_test[2] = ${mapTest[2]}
  var gifts = Map<String, String>(); 创建空 Map。
  与 Python 不同，key 不存在时 gifs[key] 会返回 null，不会抛出异常。
  final constantMap = const { 2: 'helium', 10: 'neon', 18: 'argon', }; 创建编译时常量
  Map 可以像 List 一样支持使用扩展操作符（... 和 ...?）以及集合的 if 和 for 操作。
  """);
}

// 一个实例类
class A {
  static void bar() {} // 类的静态方法
  void baz() {} // 实例的方法
}

 // 一个顶级函数实例
void foo() {}

// 用于展示函数参数的定义
void function_params({required String name}) {
  void say([String? gender]) {
    if (gender != null) {
      print("虽然 $name 是 $gender，但是 他/她罪大恶极");
    }
    else {
      print("$name 罪大恶极");
    }
  }

  // 可选位置参数调用
  say("男");
  say();
}

// 函数
void function_block() {
  // 参数
  // 传入可选命名参数，函数内部嵌套定义有可选位置参数的函数

  function_params(name: "王五");
  print("""
  ====================================================================
  必要参数，参数类型前添加 required 关键字
  void function (required bool isFinished) {}

  有默认值的参数，使用 '=' 为形参添加默认值
  void function (bool isFinished = false) {}

  可选参数
    |—— 可选的位置参数：使用 [] 包裹一系列参数构成可选参数，可选参数必须位于必要参数后。
    |   void function (String from, [String? msg, String? private) {}
    |
    |—— 可选的命名参数：使用 {arg1, arg2} 来指定命名参数。命名参数默认为可选参数，除非显式声明为必要参数。
        void function ({required bool isFinished, bool isShowDetails}) {}
        调用时使用 function(isFinished: true) 指定命名参数
  """);

  // main 函数
  print("main 函数为程序入口，有可选位置参数 List<String> args，类似 Java 的命令行传参，略。");

  // 函数是一级对象，和python一样
  print("将函数赋值给变量：var loudify = (msg) => { msg.toUpperCase() }; 同 Kotlin");
  void printElement(int element) {
    print(element);
  }

  var list = [1, 2, 3];

  // 将函数 printElement 以参数的形式传入 List 的 forEach 方法
  list.forEach(printElement);

  // 词法作用域
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

    // 闭包
  print("函数闭包与 Python 的闭包一致，参考 Python 装饰器原理");
  Function makeAdder(int addBy) {
    return (int i) => addBy + i;
  }

  // 传入 2 并将返回的匿名函数赋值给 add2
  var add2 = makeAdder(2);
  assert(add2(3) == 5);
  assert(add2(5) == 7);

  // 函数是否相等
  



  Function x;

  // 比较顶级函数
  x = foo;
  assert(foo == x);

  // 比较静态方法
  x = A.bar;
  assert(A.bar == x);

  // 比较实例方法
  var v = A(); // class A 的第1个实例
  var w = A(); // class A 的第2个实例
  var y = w;
  x = w.baz;

  // 它们都指向同一个实例的同一个方法
  assert(y.baz == x);

  // 它们指向不同的实例
  assert(v.baz != w.baz);

  // 返回值
  print("没有显示标注返回类型的函数默认 return null;");
}

// 运算符部分
void operator_block() {
  int a;
  int b;

  // 自增（表达式计算前）
  a = 0;
  b = ++a;
  assert(a == b); 

  // 自增（表达式计算后）
  a = 0;
  b = a++;
  assert(a != b);

  // 自减（表达式计算前）
  a = 0;
  b = --a;
  assert(a == b); 

 // 自减（表达式计算后）
  a = 0;
  b = a--; 
  assert(a != b); 

  // 关系运算
  assert(2 == 2);
  assert(2 != 3);
  assert(3 > 2);
  assert(2 < 3);
  assert(3 >= 3);
  assert(2 <= 3);

  // 强制类型转换
  assert((1 as double) is double);

  // 类型判断
  assert(1 is int);

  // 赋值运算符
  // 将一个值赋给变量 a
  a = 2;
  // 若 value 不为 null，则赋值给 b；若 value 为 null，则 b 保持原有值
  // b ??= value;

  // 复合赋值运算符
  a *= 3; // 与后方表达式等效: a = a * 3
  assert(a == 6);

  // 逻辑运算符
  var col = 0;
  if (!false && (col == 0 || col == 3)) {
    assert(true);
  }

  // 位运算和移位运算符
  final value = 0x22;
  final bitmask = 0x0f;

  assert((value & bitmask) == 0x02); // 与
  assert((value & ~bitmask) == 0x20); // 与非
  assert((value | bitmask) == 0x2f); // 或
  assert((value ^ bitmask) == 0x2d); // 异或
  assert((value << 4) == 0x220); // 左移
  assert((value >> 4) == 0x02); // 右移
  assert((value >>> 4) == 0x02); // 逻辑右移
  assert((-value >> 4) == -0x03); // 算数右移
  assert((-value >>> 4) > 0); // 无符号右移

  // 条件表达式
  var visibility = true ? 'public' : 'private';
  String playerName(String? name) => name ?? 'Guest';

  // 以上两种可以写成以下形式
  // 使用三元运算符替代臃肿的 if-else 的 return 结构
  // String playerName(String? name) => name != null ? name : 'Guest';

  // 使用 if-else 的臃肿形式
  // String playerName(String? name) {
  //   if (name != null) {
  //     return name;
  //   } else {
  //     return 'Guest';
  //   }
  // }

  // 级联运算符（函数式编程？）
  // 级联操作可以嵌套
  var paint = 3
      ..toString();
  
  // 使用 ?.. 避免对可能为空的返回值使用级联
  paint
  ?..toString();

  // 其他运算符
  // ()	使用方法	代表调用一个方法
  // []	访问 List	访问 List 中特定位置的元素
  // .	访问成员	成员访问符
  // ?.	条件访问成员	与上述成员访问符类似，但是左边的操作对象不能为 null，例如 foo?.bar，如果 foo 为 null 则返回 null ，否则返回 bar
}

void process_control_block() {
    // If 和 Else
  if (true) {
    print("true branch");
  } else {
    print("false branch");
  }

  // For 循环
  var message = StringBuffer('Dart is fun');
  for (var i = 0; i < 5; i++) {
    message.write('!');
  }

  var callbacks = [];
  for (var i = 0; i < 2; i++) {
    callbacks.add(() => print("For : $i"));
  }
  callbacks.forEach((c) => c());

  // For-In 遍历
  List for_in = [1, 2, 3, 4, 5, 6];
  for (final item in for_in) {
    print("For-In : $item");
  }

  print("forEach 方法: ");
  for_in.forEach(print);

  // while, break and continue
  int while_flag = 0;
  while (while_flag < 10) {
    if (while_flag == 5) {
      print("当 while flag == 5，使用 continue 不打印 while 循环字样");
      while_flag++;
      continue;
    }
    else if (while_flag == 9) {
      print("当 while flag == 9 时使用 break 结束 while 循环");
      break;
    }
    else {
      print("while 循环 $while_flag");
    }
    while_flag++;
  }

  // 可迭代对象的函数式 while 循环，打印每个 >= 2 的值
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
      print("Switch Case 无匹配");
  }

  // 断言
  assert(100 > 15, "这个断言一定能正常通过");
  print("断言 100 > 15 正常通过");

  // 异常
  // throw FormatException('Expected at least 1 section');
  // 可以抛出任何东西
  // throw 'Out of llamas!';
  // 可以悬挂 finally 关键字，效果同 Python

  // 构造函数，可以使用 C++ 的方式在函数名和函数体之间初始化变量
  var p = Point(2, 2);

  // 获取实例中 y的值
  assert(p.y == 2);

  // 调用实例方法
  double distance = p.distanceTo(Point(4, 4));

  // 可以使用构造函数返回构造好的实例
  var point = Point(1, 2);
  point.x = 4; 
  assert(point.x == 4);
  assert(point.z == null);
  print("没有传值的属性使用空安全特性可以直接初始化为Null");

  // 操作符重载
  print("操作符重载");
  final v = Vector(2, 3);
  final w = Vector(2, 2);

  assert(v + w == Vector(4, 5));
  print("Vector(2, 3) + Vector(2, 2) = Vector(4, 5)，重载了 +");
  assert(v - w == Vector(0, 1));

  // Getter 和 Setter
  var rect = Rectangle(3, 4, 20, 15);
  assert(rect.left == 3);
  rect.right = 12;
  assert(rect.left == -8);
  print("使用 type get property_name => {} 定义Getter\n使用 set property_name(params) => {} 定义Setter");

  // 定义接口（抽象）
  print("使用 abstract 关键字定义接口");

  // 隐式接口
  print("使用 class ClassName implements OtherClass1, OtherClass2, ... {} 来实现其他类的接口，避免直接继承 OtherClass");

  // 扩展一个类
  print("使用 class ClassName extends OtherClass {} 可以扩展一个类，使用 super 引用父类，使用 @override 重写父类成员");

  // 泛型示例在上边儿

  // 使用库
  print("""
import 'package:lib1/lib1.dart';
import 'package:lib2/lib2.dart' as lib2;


三方库前缀：package
// 只导入 foo
import 'package:lib1/lib1.dart' show foo;

// 不导入 foo
import 'package:lib2/lib2.dart' hide foo;


延迟导入只支持 dart2js，例如：import 'package:greetings/hello.dart' deferred as hello;
使用 API 时使用 .loadLibrary() 方法加载库
Future<void> greet() async {
  await hello.loadLibrary();
  hello.printGreeting();
}
""");

  // 异步支持
  print("""
异步编程使用 async await 关键字，也可以使用 Future API
使用 try-catch-finally 处理 await 导致的异常
使用 Future<String> lookUpVersion() async => '1.0.0'; 声明一个异步函数

使用 await for 处理异步 Stream
await for (varOrType identifier in expression) {
  // Executes each time the stream emits a value.
}
""");

  // 生成器
  // 同步生成器返回 Iterator 对象，异步生成器返回 Stream 对象

  // 可调用类，实现 Type call() 方法，同 Python 的 __call__() 魔法方法

  // isolate 代替线程

  // 别名
  IntList il = [1, 2, 3];
  print("别名为 IntList 的 List<int> 类型的变量: $il");

  // 元数据 @+编译时常量，使用反射在运行时获取元数据信息
  @Todo('石洋', '让这个函数打印 do something')
  void doSomething() {
    print('do something');
  }

  doSomething();

  // 单行注释
  
  /**
   * 多行注释
  */

  /// 文档注释示例
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
