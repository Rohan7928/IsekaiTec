import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class UserModel {
  int? product_id;
  String? reg_date;
  String? product_name;
  String? product_value;
  String? product_unit;
  String? product_code;
  //List<void> image_links;
  String? product_type;
  String? product_sellable;
  int? image_counter;
  String? generic_names;
  String? hsn_code;
  String? product_serial_code;
  String? short_desc;
  String? long_desc;
  String? ingredient_ids;
  String? page_title;
  String? search_keyword;
  String? page_desc;
  String? show_to;
  String? brand_code;
  String? alias;
  String? variant;
  String? barcode_exists;
  String? business;
  String? sell_group;
  String? sell_group_id;
  String? sell_group_level;
  int? Exhausting_Limit;
  double? business_value;
  double? gst_amount_on_CP;
  double? billing_price;
  double? retail_dis;
  double? seller_dis;
  double? whole_dis;
  double? customer_dis;
  double? emp_dis;
  double? retailshop_dis;
  double? direct_customer_dis;
  double? retail_dis_amt;
  double? seller_dis_amt;
  double? whole_dis_amt;
  double? customer_dis_amt;
  double? emp_dis_amt;
  double? retailshop_dis_amt;
  double? direct_customer_dis_amt;
  int? sell_group_quantity;
  int? main_product_id;
  double? MRP;
  double? tax_per;
  double? cost;
  double? rate;
  String? packaging_weight;

  UserModel(
      {this.product_id,
      this.reg_date,
      this.product_name,
      this.product_value,
      this.product_unit,
      this.product_code,
      //this.image_links,
      this.product_type,
      this.product_sellable,
      this.image_counter,
      this.generic_names,
      this.hsn_code,
      this.product_serial_code,
      this.short_desc,
      this.long_desc,
      this.ingredient_ids,
      this.page_title,
      this.search_keyword,
      this.page_desc,
      this.show_to,
      this.brand_code,
      this.alias,
      this.variant,
      this.barcode_exists,
      this.business,
      this.sell_group,
      this.sell_group_id,
      this.sell_group_level,
      this.Exhausting_Limit,
      this.business_value,
      this.gst_amount_on_CP,
      this.billing_price,
      this.retail_dis,
      this.seller_dis,
      this.whole_dis,
      this.customer_dis,
      this.emp_dis,
      this.retailshop_dis,
      this.direct_customer_dis,
      this.retail_dis_amt,
      this.seller_dis_amt,
      this.whole_dis_amt,
      this.customer_dis_amt,
      this.emp_dis_amt,
      this.retailshop_dis_amt,
      this.direct_customer_dis_amt,
      this.sell_group_quantity,
      this.main_product_id,
      this.MRP,
      this.tax_per,
      this.cost,
      this.rate,
      this.packaging_weight});


  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
