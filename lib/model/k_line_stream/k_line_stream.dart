import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:technixo_k_chart/entity/k_line_entity.dart';

part 'k_line_stream.freezed.dart';

part 'k_line_stream.g.dart';

///  {
///      "e": "kline",     // Event type
///      "E": 123456789,   // Event time
///      "s": "BTCUSDT",    // Symbol
///      "k":
///  }
@freezed
class KLineStream with _$KLineStream {
  factory KLineStream({
    required String e,
    required int E,
    required String s,
    required KLineEntity k,
  }) = _KLineStream;

  factory KLineStream.fromJson(Map<String, dynamic> json) =>
      _$KLineStreamFromJson(json);
}
