import 'dart:io';

void main() {
  print('Geben Sie einen String ein:');
  String? input = stdin.readLineSync();

  if (input == null || input.isEmpty) {
    print('Keine Eingabe erkannt.');
    return;
  }

  if (!input.contains(RegExp(r'^[a-zA-Z]+$'))) {
    print('Eingabe ist ungültig. Der String darf nur aus Buchstaben bestehen.');
    return;
  }

  String compressed = compressString(input);
  print('Komprimierter String: $compressed');
}

String compressString(String input) {
  StringBuffer compressed = StringBuffer();
  int count = 0;
  for (int i = 0; i < input.length; i++) {
    count++;
    if (i + 1 == input.length || input[i] != input[i + 1]) {
      if (count >= 3) {
        compressed.write('${input[i]}$count');
      } else {
        compressed.write(input[i] * count);
      }
      count = 0;
    }
  }
  return compressed.toString();
  dfa
}