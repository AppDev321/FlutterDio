class  ApiResponse<T> {
  final int status;
  final String message;
  final T data;

  ApiResponse({required this.status, required this.message, required this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return ApiResponse(
      status: json['status'] ?? 0,
      message: json['message'] ?? '',
      data: _parseData(json['data'], fromJsonT),
    );
  }

  static  _parseData<T>(dynamic data, T Function(dynamic) fromJsonT) {
    if (data is List) {
      return data.map((item) => fromJsonT(item)).toList().cast<T>();
    } else if (data is Map) {
      return fromJsonT(data);
    } else {
      return data as T;
    }
  }

  ApiResponse.withError( {
    required int statusCode,
    bool success = false,
    required String msg,
     dynamic data
  })  : status = statusCode,
        message = msg,
        data = data;
}
