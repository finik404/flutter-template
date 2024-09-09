class TResponse {
  int status;
  dynamic data;
  dynamic errors;
  String? message;
  bool isError;

  TResponse({
    required this.status,
    this.data,
    this.errors,
    this.message,
    required this.isError,
  });
}

class TItem {
  String label;
  dynamic value;

  TItem({
    required this.label,
    required this.value,
  });
}

class TNameItem {
  String kz;
  String? ru;

  TNameItem({
    required this.kz,
    this.ru,
  });

  factory TNameItem.fromJson(Map<String, dynamic> json) {
    return TNameItem(
      kz: json['kz'],
      ru: json['ru'],
    );
  }
}
