import 'package:flutter/material.dart';
import 'package:flutter_kintore/routes.dart';
import 'package:flutter_kintore/ui/CounterScreen.dart';
import 'package:provider/provider.dart';

import 'model/kintore_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<KintoreModel>(
          create: (context) => KintoreModel(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'MPLUS',
          colorScheme: ColorScheme.dark(),
          textTheme: ThemeData.dark().textTheme.copyWith(
                bodyText1: TextStyle(
                  fontSize: 30,
                ),
                bodyText2: TextStyle(
                  fontSize: 30,
                ),
                button: TextStyle(
                  fontSize: 25,
                ),
              ),
        ),
        home: CounterScreen(),
        onGenerateRoute: Routes.onGenerateRoute,
      ),
    );
  }
}
