import 'package:json_annotation/json_annotation.dart';

part 'product_category.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class ProductCategory {
  int? id;
  String? name;
  String? code;
  String? status;
  int? total_products = 0;

  ProductCategory(
      {this.id, this.name, this.code, this.status, this.total_products});

/*  ProductCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    status = json['status'];
    totalProducts = json['total_products'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['status'] = this.status;
    data['total_products'] = this.totalProducts;
    return data;
  }*/

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCategoryToJson(this);
}
