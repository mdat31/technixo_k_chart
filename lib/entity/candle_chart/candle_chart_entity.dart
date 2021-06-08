import 'package:flutter_k_chart/entity/candle_chart/candle_chart.dart';

class CandleChartEntity extends CandleChart {
  late int openTime;
  late double open;
  late double high;
  late double low;
  late double close;
  late double vol;
  late int closeTime;
  late double quoteVolume;
  late int numberOfTrades;
  late double takerBuyBaseVolume;
  late double takerBuyQuoteVolume;
  late double ignore;

  CandleChartEntity({
    required this.openTime,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.vol,
    required this.closeTime,
    required this.quoteVolume,
    required this.numberOfTrades,
    required this.takerBuyBaseVolume,
    required this.takerBuyQuoteVolume,
    required this.ignore,
  });

  factory CandleChartEntity.fromApi(List<dynamic> api) {
    return CandleChartEntity(
      openTime: api[0] as int,
      open: double.parse(api[1]),
      high: double.parse(api[2]),
      low: double.parse(api[3]),
      close: double.parse(api[4]),
      vol: double.parse(api[5]),
      closeTime: api[6] as int,
      quoteVolume: double.parse(api[7]),
      numberOfTrades: api[8] as int,
      takerBuyBaseVolume: double.parse(api[9]),
      takerBuyQuoteVolume: double.parse(api[10]),
      ignore: double.parse(api[11]),
    );
  }
}
