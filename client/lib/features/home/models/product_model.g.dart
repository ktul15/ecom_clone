// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      imageUrl: json['imageUrl'] as String,
      name: json['name'] as String,
      realPrice: json['realPrice'] as String,
      sellingPrice: json['sellingPrice'] as String,
      discountPercentage: json['discountPercentage'] as String,
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'realPrice': instance.realPrice,
      'sellingPrice': instance.sellingPrice,
      'discountPercentage': instance.discountPercentage,
    };
