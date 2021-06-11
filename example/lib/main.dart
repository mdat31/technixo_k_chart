import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:technixo_k_chart/chart_style.dart';
import 'package:technixo_k_chart/generated/l10n.dart' as k_chart;
import 'package:technixo_k_chart/k_chart_widget.dart';
import 'package:technixo_k_chart/model/k_line_model/k_line_model.dart';
import 'package:technixo_k_chart/technixo_k_chart.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // supportedLocales: [const Locale('zh', 'CN')],
      localizationsDelegates: [
        k_chart.S.delegate //国际话
      ],
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<KLineEntity> datas = [];
  bool showLoading = true;
  MainState _mainState = MainState.MA;
  SecondaryState _secondaryState = SecondaryState.NONE;
  bool isLine = false;
  bool volHidden = true;
  List<DepthEntity> _bids = [], _asks = [];
  List<int> maDayList = const [7, 25, 100];

  final channel = WebSocketChannel.connect(
    Uri.parse('wss://fstream.binance.com/stream?streams=btcusdt@kline_1m'),
  );

  @override
  void initState() {
    super.initState();
    getData('1day');
    rootBundle.loadString('assets/depth.json').then((result) {
      final parseJson = json.decode(result);
      Map tick = parseJson['tick'];
      var bids = tick['bids']
          .map((item) => DepthEntity(item[0], item[1]))
          .toList()
          .cast<DepthEntity>();
      var asks = tick['asks']
          .map((item) => DepthEntity(item[0], item[1]))
          .toList()
          .cast<DepthEntity>();
      initDepth(bids, asks);
    });
  }

  void initDepth(List<DepthEntity>? bids, List<DepthEntity>? asks) {
    if (bids == null || asks == null || bids.isEmpty || asks.isEmpty) return;
    _bids = [];
    _asks = [];
    double amount = 0.0;
    bids.sort((left, right) => left.price.compareTo(right.price));
    bids.reversed.forEach((item) {
      amount += item.amount;
      item.amount = amount;
      _bids.insert(0, item);
    });

    amount = 0.0;
    asks.sort((left, right) => left.price.compareTo(right.price));
    asks.forEach((item) {
      amount += item.amount;
      item.amount = amount;
      _asks.add(item);
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff17212F),
      body: StreamBuilder<dynamic>(
          stream: channel.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final response = json.decode(snapshot.data);
              final model = KLineModel.fromJson(response['data']['k']);
              final entity = KLineEntity.fromModel(model);
              final current = datas.last;
              if (current.startTime != entity.startTime) {
                datas.add(entity);
              } else {
                datas.last = entity;
              }
              DataUtil.calculate(datas, maDayList: maDayList);
            }
            return ListView(
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      height: 450,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      child: KChartWidget(
                        datas,
                        ChartColors(),
                        ChartStyle(),
                        text: 'Position',
                        textStyle:
                            TextStyle(fontSize: 30, color: Colors.white12),
                        isLine: isLine,
                        mainState: _mainState,
                        secondaryState: _secondaryState,
                        volHidden: volHidden,
                        fractionDigits: 2,
                        maDayList: maDayList,
                      ),
                    ),
                    if (showLoading)
                      Container(
                          width: double.infinity,
                          height: 450,
                          alignment: Alignment.center,
                          child: CircularProgressIndicator()),
                  ],
                ),
                // buildButtons(),
                // Container(
                //   height: 230,
                //   width: double.infinity,
                //   child: DepthChart(_bids, _asks),
                // ),
              ],
            );
          }),
    );
  }

  Widget buildButtons() {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      spacing: 5,
      children: <Widget>[
        button("update", onPressed: () {
          //更新最后一条数据
          datas.last.close += (Random().nextInt(100) - 50).toDouble();
          datas.last.high = max(datas.last.high, datas.last.close);
          datas.last.low = min(datas.last.low, datas.last.close);
          DataUtil.calculate(datas, maDayList: maDayList);
        }),
        button("addData", onPressed: () {
          //拷贝一个对象，修改数据
          var kLineEntity = KLineEntity.fromHuobi(datas.last.toJson());
          kLineEntity.id = kLineEntity.id! + 60 * 60 * 24;
          kLineEntity.open = kLineEntity.close;
          kLineEntity.close += (Random().nextInt(100) - 50).toDouble();
          datas.last.high = max(datas.last.high, datas.last.close);
          datas.last.low = min(datas.last.low, datas.last.close);
          DataUtil.calculate(datas, maDayList: maDayList);
        }),
        TextButton(
            onPressed: () {
              showLoading = true;
              setState(() {});
              getData('1day');
            },
            child: Text("1day", style: const TextStyle(color: Colors.black)),
            style: TextButton.styleFrom(backgroundColor: Colors.blue)),
      ],
    );
  }

  Widget button(String text, {VoidCallback? onPressed}) {
    return TextButton(
        onPressed: () {
          if (onPressed != null) {
            onPressed();
            setState(() {});
          }
        },
        child: Text("$text", style: const TextStyle(color: Colors.black)),
        style: TextButton.styleFrom(backgroundColor: Colors.blue));
  }

  void getData(String period,
      {String symbol = 'btcusdt', String interval = '1m'}) async {
    late String result;
    try {
      result =
          await getIPAddress('$period', symbol: symbol, interval: interval);
    } catch (e) {
      print('Không lấy được data $e');
      result = await rootBundle.loadString('assets/kline.json');
    } finally {
      try {
        Map parseJson = json.decode(result);
        List list = parseJson['data'];
        datas = list
            .map((item) => KLineEntity.fromHuobi(item))
            .toList()
            .reversed
            .toList();
      } catch (e) {
        List parseJson = json.decode(result);
        datas = parseJson.map((item) => KLineEntity.fromBinance(item)).toList();
      } finally {
        DataUtil.calculate(datas, maDayList: maDayList);
        showLoading = false;
        setState(() {});
      }
    }
  }

  Future<String> getIPAddress(String? period,
      {String symbol = 'btcusdt', String interval = '1m'}) async {
    //火币api，需要翻墙
    var houbi =
        'https://api.huobi.br.com/market/history/kline?period=${period ?? '1day'}&size=300&symbol=btcusdt';
    final binance =
        'https://fapi.binance.com/fapi/v1/klines?symbol=$symbol&interval=$interval';

    String result;
    var response =
        await http.get(Uri.parse(binance)).timeout(Duration(seconds: 7));
    if (response.statusCode == 200) {
      result = response.body;
    } else {
      return Future.error("获取失败");
    }
    return result;
  }
}
