import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'infrastructures/app_component.dart';
import 'infrastructures/router.dart' as ModularRouter;
import 'ui/pages/home/view.dart';
import 'ui/res/generated/i18n.dart';

void main() {
  DotEnv().load('.env');
  AppComponent.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ModularRouter.Router _router;
  final _navigatorKey = GlobalKey<NavigatorState>();

  MyApp() : _router = ModularRouter.Router();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      navigatorKey: _navigatorKey,
      debugShowCheckedModeBanner: false,
      // to generate string: flutter pub run gen_lang:generate --source-dir=lib/app/ui/res/string --output-dir=lib/app/ui/res/generated --template-locale=id
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale('en'),
      title: "Refactory Flutter Test",
      home: HomePage(),
      onGenerateRoute: _router.getRoute,
      navigatorObservers: [_router.routeObserver],
    );
  }
}
