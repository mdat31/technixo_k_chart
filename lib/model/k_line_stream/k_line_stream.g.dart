// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'k_line_stream.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KLineStream _$_$_KLineStreamFromJson(Map<String, dynamic> json) {
  return _$_KLineStream(
    e: json['e'] as String,
    E: json['E'] as int,
    s: json['s'] as String,
    k: KLineEntity.fromJson(json['k'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_KLineStreamToJson(_$_KLineStream instance) =>
    <String, dynamic>{
      'e': instance.e,
      'E': instance.E,
      's': instance.s,
      'k': instance.k,
    };
