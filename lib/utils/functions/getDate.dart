/*
  Преобразование даты ----------------
 */
String getDate(String date, {String? format}) {
  DateTime dateTime = DateTime.parse(date);

  String formattedDate = _formatDate(dateTime, format ?? 'yyyy-MM-dd HH:mm:ss');

  return formattedDate;
}

String _formatDate(DateTime dateTime, String format) {
  String year = dateTime.year.toString().padLeft(4, '0');
  String month = dateTime.month.toString().padLeft(2, '0');
  String day = dateTime.day.toString().padLeft(2, '0');
  String hour = dateTime.hour.toString().padLeft(2, '0');
  String minute = dateTime.minute.toString().padLeft(2, '0');
  String second = dateTime.second.toString().padLeft(2, '0');

  String formattedDate = format
      .replaceAll('yyyy', year)
      .replaceAll('MM', month)
      .replaceAll('dd', day)
      .replaceAll('HH', hour)
      .replaceAll('mm', minute)
      .replaceAll('ss', second);

  return formattedDate;
}
