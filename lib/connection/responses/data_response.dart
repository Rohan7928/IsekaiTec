import 'package:json_annotation/json_annotation.dart';

part 'data_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, includeIfNull: false)
class DataResponse<P> {

  List<P>? items, data;
  int? totalRecords, pageNo, pageSize, total;
  double? escrow, amount;
  P? result;
  bool? isSuccess, status;
  String? error, message;

  DataResponse({this.result, this.items, this.totalRecords, this.pageNo, this.pageSize,
    this.total, this.escrow, this.amount, this.isSuccess, this.status, this.error, this.message, this.data});

  factory DataResponse.fromJson(Map<String, dynamic> json, P Function(Object? json) fromJsonT,) => _$DataResponseFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object Function(P value) toJsonT) => _$DataResponseToJson(this, toJsonT);
}