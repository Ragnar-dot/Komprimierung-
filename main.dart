import 'dart:io';

void main() {
  String? input;

  while (true) { // Endlosschleife, die solange läuft, bis eine gültige Eingabe erfolgt ist
    print('Geben Sie einen String ein:'); // Aufforderung zur Eingabe eines Strings
    input = stdin.readLineSync(); // Eingabe des Strings

    if (input == null || input.isEmpty) { // Wenn keine Eingabe erfolgt ist oder der eingegebene String leer ist
      print('Keine Eingabe erkannt.');
      continue; // Schleife erneut starten
    }

    if (!input.contains(RegExp(r'^[a-zA-Z]+$'))) {  // info. im read.md      Wenn der eingegebene String nicht nur aus Buchstaben besteht
      print('Eingabe ist ungültig. Der String darf nur aus Buchstaben bestehen.');
      continue; // Schleife erneut starten
    }

    break; // Schleife beenden, wenn die Eingabe gültig ist
  }

  String compressed = compressString(input!); // Aufruf der Funktion compressString mit dem eingegebenen String als Argument
  print('Komprimierter String: $compressed');// Ausgabe des komprimierten Strings
}

String compressString(String input) {
  StringBuffer compressed = StringBuffer(); // StringBuffer ist eine Klasse, die eine veränderbare Sequenz von Zeichen darstellt.
  int count = 0; // Zähler für die Anzahl der aufeinanderfolgenden Zeichen
  for (int i = 0; i < input.length; i++) { // Schleife, die den Eingabestring durchläuft
    count++; // Zähler erhöhen
    if (i + 1 == input.length || input[i] != input[i + 1]) { // Wenn das aktuelle Zeichen das letzte Zeichen ist oder das aktuelle Zeichen ungleich dem nächsten Zeichen ist
      if (count >= 3) { // Wenn die Anzahl der aufeinanderfolgenden Zeichen größer oder gleich 3 ist
        compressed.write('${input[i]}$count'); // Füge das Zeichen und die Anzahl der aufeinanderfolgenden Zeichen hinzu
      } else { // Wenn die Anzahl der aufeinanderfolgenden Zeichen kleiner als 3 ist
        compressed.write(input[i] * count); // Füge das Zeichen so oft hinzu, wie es aufeinanderfolgende Zeichen gibt
      }
      count = 0; // Zähler zurücksetzen
    }
  }
  return compressed.toString(); // Gibt den komprimierten String zurück
}