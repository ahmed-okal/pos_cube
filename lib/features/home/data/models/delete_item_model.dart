class DeleteItemResponse {
  final int status;
  final String result;
  final bool data;

  DeleteItemResponse({
    required this.status,
    required this.result,
    required this.data,
  });

  factory DeleteItemResponse.fromJson(Map<String, dynamic> json) {
    return DeleteItemResponse(
      status: json['status'],
      result: json['result'],
      data: json['data'],
    );
  }
}
