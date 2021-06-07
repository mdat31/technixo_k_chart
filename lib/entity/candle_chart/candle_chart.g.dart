// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candle_chart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CandleChart _$_$_CandleChartFromJson(Map<String, dynamic> json) {
  return _$_CandleChart(
    openTime: json['openTime'] as int,
    openPrice: json['openPrice'] as String,
    highPrice: json['highPrice'] as String,
    lowPrice: json['lowPrice'] as String,
    closePrice: json['closePrice'] as String,
    volume: json['volume'] as String,
    closeTime: json['closeTime'] as int,
    quoteVolume: json['quoteVolume'] as String,
    numberOfTrades: json['numberOfTrades'] as int,
    takerBuyBaseVolume: json['takerBuyBaseVolume'] as String,
    takerBuyQuoteVolume: json['takerBuyQuoteVolume'] as String,
    ignore: json['ignore'] as String,
  );
}

Map<String, dynamic> _$_$_CandleChartToJson(_$_CandleChart instance) =>
    <String, dynamic>{
      'openTime': instance.openTime,
      'openPrice': instance.openPrice,
      'highPrice': instance.highPrice,
      'lowPrice': instance.lowPrice,
      'closePrice': instance.closePrice,
      'volume': instance.volume,
      'closeTime': instance.closeTime,
      'quoteVolume': instance.quoteVolume,
      'numberOfTrades': instance.numberOfTrades,
      'takerBuyBaseVolume': instance.takerBuyBaseVolume,
      'takerBuyQuoteVolume': instance.takerBuyQuoteVolume,
      'ignore': instance.ignore,
    };
