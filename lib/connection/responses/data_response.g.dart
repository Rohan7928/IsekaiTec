// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataResponse<P> _$DataResponseFromJson<P>(
  Map<String, dynamic> json,
  P Function(Object? json) fromJsonP,
) =>
    DataResponse<P>(
      result: _$nullableGenericFromJson(json['result'], fromJsonP),
      items: (json['items'] as List<dynamic>?)?.map(fromJsonP).toList(),
      totalRecords: json['totalRecords'] as int?,
      pageNo: json['pageNo'] as int?,
      pageSize: json['pageSize'] as int?,
      total: json['total'] as int?,
      escrow: (json['escrow'] as num?)?.toDouble(),
      amount: (json['amount'] as num?)?.toDouble(),
      isSuccess: json['isSuccess'] as bool?,
      status: json['status'] as bool?,
      error: json['error'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)?.map(fromJsonP).toList(),
    );

Map<String, dynamic> _$DataResponseToJson<P>(
  DataResponse<P> instance,
  Object? Function(P value) toJsonP,
) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map(toJsonP).toList());
  writeNotNull('data', instance.data?.map(toJsonP).toList());
  writeNotNull('totalRecords', instance.totalRecords);
  writeNotNull('pageNo', instance.pageNo);
  writeNotNull('pageSize', instance.pageSize);
  writeNotNull('total', instance.total);
  writeNotNull('escrow', instance.escrow);
  writeNotNull('amount', instance.amount);
  writeNotNull('result', _$nullableGenericToJson(instance.result, toJsonP));
  writeNotNull('isSuccess', instance.isSuccess);
  writeNotNull('status', instance.status);
  writeNotNull('error', instance.error);
  writeNotNull('message', instance.message);
  return val;
}

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
