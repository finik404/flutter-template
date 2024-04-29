/*
  Получить правильную форму слова ----------------
 */
String getCorrectWordForm(int number, String word) {
  if (number % 10 == 1 && number % 100 != 11) {
    return '$number $word';
  } else if (number % 10 >= 2 &&
      number % 10 <= 4 &&
      (number % 100 < 10 || number % 100 >= 20)) {
    return '$number ${word}а';
  } else {
    return '$number ${word}ов';
  }
}
