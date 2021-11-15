import 'dart:html';


String html = """
<!-- In HTML: -->
<p>
  <span class="linux">Words for Linux</span>
  <span class="macos">Words for Mac</span>
  <span class="windows">Words for Windows</span>
</p>
""";


void html_parse() {
  const osList = ['macos', 'windows', 'linux'];
  final userOs = 'windows';

  for (final os in osList) {
  // Matches user OS?
  bool shouldShow = (os == userOs);

  // Find all elements with class=os. For example, if
  // os == 'windows', call querySelectorAll('.windows')
  // to find all elements with the class "windows".
  // Note that '.$os' uses string interpolation.
  for (final elem in querySelectorAll('.$os')) {
    elem.hidden = !shouldShow; // Show or hide.
  }
  }
}


void main(List<String> args) {
  // Warnning：dart 应用现在不能直接用 dart:html 库
  // html_parse();
}