import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'candle_chart.freezed.dart';

part 'candle_chart.g.dart';

/// [
///   [
///   1499040000000,      // Open time
///   "0.01634790",       // Open
///     "0.80000000",       // High
///     "0.01575800",       // Low
///     "0.01577100",       // Close
///     "148976.11427815",  // Volume
///     1499644799999,      // Close time
///     "2434.19055334",    // Quote asset volume
///     308,                // Number of trades
///     "1756.87402397",    // Taker buy base asset volume
///     "28.46694368",      // Taker buy quote asset volume
///     "17928899.62484339" // Ignore.
///   ]
/// ]
@freezed
class CandleChart with _$CandleChart {
  factory CandleChart({
    /// Open time
    required int openTime,

    /// Open Price
    required String openPrice,

    /// Highest price
    required String highPrice,

    /// Lowest Price
    required String lowPrice,

    /// Close Price
    required String closePrice,

    /// Volume trade
    required String volume,

    /// close Time
    required int closeTime,

    /// quote Volume
    required String quoteVolume,

    /// number of trade
    required int numberOfTrades,

    /// takerBuyBaseVolume
    required String takerBuyBaseVolume,

    /// takerBuyQuoteVolume
    required String takerBuyQuoteVolume,

    /// ignore
    required String ignore,
  }) = _CandleChart;

  factory CandleChart.fromJson(Map<String, dynamic> json) =>
      _$CandleChartFromJson(json);

  factory CandleChart.fromApi(List<dynamic> api) => CandleChart(
        openTime: api[0] as int,
        openPrice: api[1] as String,
        highPrice: api[2] as String,
        lowPrice: api[3] as String,
        closePrice: api[4] as String,
        volume: api[5] as String,
        closeTime: api[6] as int,
        quoteVolume: api[7] as String,
        numberOfTrades: api[8] as int,
        takerBuyBaseVolume: api[9] as String,
        takerBuyQuoteVolume: api[10] as String,
        ignore: api[11] as String,
      );
}
