import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_kintore/entity/kintore_entity.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KintoreModel with ChangeNotifier {
  KintoreEntity _kintoreEntity;
  KintoreEntity get kintoreEntity => _kintoreEntity;
  String today;
  SharedPreferences prefs;
  KintoreModel() {
    setup();
  }

  void setup() async {
    prefs = await SharedPreferences.getInstance();

    initializeDateFormatting('ja', null);
    today = getTodayDate();
    // 本日初回起動時かチェック
    if (prefs.getBool('first_open_' + today) ?? true) {
      // 本日は起動済みなのでfirst_open_X月Y日をfalseにする
      prefs.setBool('first_open_' + today, false);
      KintoreEntity kintoreEntity = KintoreEntity(
          date: today, quota: getTodayQuota(), doneUdetate: 0, doneFukkin: 0);
      prefs.setString('detail_' + today, json.encode(kintoreEntity));
      _kintoreEntity = kintoreEntity;
      await notifyListeners();
    } else
    // 二回目以降
    {
      // 最後に設定したものをロード
      KintoreEntity kintoreEntity = (await KintoreEntity.fromJson(
              json.decode(prefs.getString('detail_' + today))) ??
          KintoreEntity(
              date: today,
              quota: getTodayQuota(),
              doneUdetate: 0,
              doneFukkin: 0));

      _kintoreEntity = kintoreEntity;
      await notifyListeners();
    }
  }

  String getTodayDate() {
    return DateFormat.yMMMd('ja').format(DateTime.now()).toString();
  }

  int getTodayQuota() {
    final DateTime _startDay = DateTime.now();
    Duration duration = _startDay.difference(DateTime(2020, 12, 31));
    return duration.inDays;
  }

  void countUpUdetate(int num) {
    _kintoreEntity.doneUdetate += num;
    prefs.setString('detail_' + today, json.encode(_kintoreEntity));
    notifyListeners();
  }

  void countUpFukkin(int num) {
    _kintoreEntity.doneFukkin += num;
    prefs.setString('detail_' + today, json.encode(_kintoreEntity));
    notifyListeners();
  }
}
