import 'package:flutter_k_chart/entity/candle_chart/candle_chart_entity.dart';

class InfoWindow {
  CandleChartEntity candleChartEntity;
  bool isLeft = false;

  InfoWindow(this.candleChartEntity, this.isLeft);
}
