class Success<T> {
  final int? code;
  final T? message;

  Success({this.code, this.message});
}

class Failed {
  final int? code;
  final String? message;

  Failed({this.code, this.message});
}
