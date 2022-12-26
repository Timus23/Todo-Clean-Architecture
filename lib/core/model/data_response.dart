class DataResponse<Type> {
  final bool status;
  final String message;
  final Type? data;

  DataResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DataResponse.success(Type? data) {
    return DataResponse(status: true, message: "", data: data);
  }

  factory DataResponse.error(String message) {
    return DataResponse(status: false, message: message, data: null);
  }
}
