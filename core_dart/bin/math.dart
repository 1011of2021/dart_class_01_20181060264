import 'dart:math';


void trigonometric_function() {
  // Cos
  assert(cos(pi) == -1.0);

  // Sin
  var degrees = 30;
  var radians = degrees * (pi / 180);
  // 弧度
  var sinOf30degrees = sin(radians);
  // sin 30° = 0.5
  assert((sinOf30degrees - 0.5).abs() < 0.01);
}


void max_and_min() {
  // 最大最小值，这么常用不放到预导入里？
  assert(max(1, 1000) == 1000);
  assert(min(1, -1000) == -1000);
}


void math_cosnt() {
  // 常数，很精确
  print(e); // 2.718281828459045
  print(pi); // 3.141592653589793
  print(sqrt2);
}


void random_num() {
  // 随机数
  var random = Random();
  print("随机数：${random.nextDouble()}");  // Between 0.0 and 1.0: [0, 1)
  print("随机数：${random.nextInt(10)}");  // Between 0 and 9.
  print("随机 bool：${random.nextBool()}");  // Between 0 and 9.
}


void main(List<String> args) {
  trigonometric_function();
  max_and_min();
  math_cosnt();
  random_num();
}
