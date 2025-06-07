class ServiceResult<T> {
  ServiceResult({this.content, this.error = ''});
  final String error;
  final T? content;
  bool get success => content != null && error.isEmpty;

  String getErrorMessage() => error.isEmpty ? "Unknown error occurred" : error;
}