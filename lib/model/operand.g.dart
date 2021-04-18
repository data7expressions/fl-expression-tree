// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Operand _$OperandFromJson(Map<String, dynamic> json) {
  return Operand(
    json['op'] as String,
    (json['children'] as List)
        ?.map((e) =>
            e == null ? null : Operand.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$OperandToJson(Operand instance) => <String, dynamic>{
      'op': instance.op,
      'children': instance.children,
    };
