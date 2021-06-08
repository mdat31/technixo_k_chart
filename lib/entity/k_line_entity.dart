import '../entity/k_entity.dart';

class KLineEntity extends KEntity {
  late double open;
  late double high;
  late double low;
  late double close;
  late double vol;
  double? amount;
  int? count;
  int? id;
  int? closeTime;
  double? takerBuyBaseVolume;
  double? takerBuyQuoteVolume;
  double? ignore;

  KLineEntity.fromJson(Map<String, dynamic> json) {
    open = (json['open'] as num).toDouble();
    high = (json['high'] as num).toDouble();
    low = (json['low'] as num).toDouble();
    close = (json['close'] as num).toDouble();
    vol = (json['vol'] as num).toDouble();
    amount = (json['amount'] as num?)?.toDouble();
    count = json['count'] as int?;
    id = json['id'] as int?;
  }

  KLineEntity.fromApi(List api) {
    id = (api[0] as int) ~/ 1000;
    open = double.parse(api[1]);
    high = double.parse(api[2]);
    low = double.parse(api[3]);
    close = double.parse(api[4]);
    vol = double.parse(api[5]);
    closeTime = api[6] as int;
    amount = double.parse(api[7]);
    count = api[8] as int;
    takerBuyBaseVolume = double.parse(api[9]);
    takerBuyQuoteVolume = double.parse(api[10]);
    ignore = double.parse(api[11]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['open'] = this.open;
    data['close'] = this.close;
    data['high'] = this.high;
    data['low'] = this.low;
    data['vol'] = this.vol;
    data['amount'] = this.amount;
    data['count'] = this.count;
    data['closeTime'] = this.closeTime;
    data['takerBuyBaseVolume'] = this.takerBuyBaseVolume;
    data['takerBuyQuoteVolume'] = this.takerBuyQuoteVolume;
    data['ignore'] = this.ignore;
    return data;
  }

  @override
  String toString() {
    return '${this.toJson()}';
  }
}
