import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kintore/model/kintore_model.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
  static const routeName = '/counter_screen';
  @override
  Widget build(BuildContext context) {
    final kintoreModel = Provider.of<KintoreModel>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("筋トレ"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Text(kintoreModel.kintoreEntity?.date ?? ""),
            Text("今日のノルマ"),
            Text(kintoreModel.kintoreEntity?.quota.toString() ?? ""),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _ProgressCard(context, kintoreModel, "腕立て",
                    kintoreModel.kintoreEntity?.doneUdetate.toString() ?? ""),
                _ProgressCard(context, kintoreModel, "腹筋",
                    kintoreModel.kintoreEntity?.doneFukkin.toString() ?? ""),
              ],
            ),
            _TaskCard(
                context, kintoreModel, "腕立て", kintoreModel.countUpUdetate),
            _TaskCard(context, kintoreModel, "腹筋　", kintoreModel.countUpFukkin),
          ],
        ),
      ),
    );
  }

  Widget _ProgressCard(
      BuildContext context, KintoreModel kintoreModel, taskStr, value) {
    return Column(
      children: [
        Text(taskStr),
        Text(value ?? ""),
      ],
    );
  }

  Widget _TaskCard(
      BuildContext context, KintoreModel kintoreModel, taskStr, countUpFunc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(taskStr),
        Column(
          children: [
            RaisedButton(
                child: Text("+1"),
                onPressed: () {
                  countUpFunc(1);
                }),
            RaisedButton(
                child: Text("+10"),
                onPressed: () {
                  countUpFunc(10);
                }),
          ],
        )
      ],
    );
  }
}
