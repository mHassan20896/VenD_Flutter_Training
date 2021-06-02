export 'string_processor.dart';
import 'dart:io';

import 'string_processor.dart';

main(List<String> args) {
  File("${args[0]}").readAsString().then((String contents) {
    var stringProcessor = new StringManager();
    List<List<String>> output = stringProcessor.paragraphProcessor(contents);
    for (var i = 0; i < output.length; i++) {
      print("${output[i]} - line# $i");
    }
  });
}
