import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:refactory_flutter_test/app/infrastructures/app_component.dart';
import 'package:refactory_flutter_test/app/ui/pages/home/controller.dart';
import 'package:refactory_flutter_test/app/ui/res/generated/i18n.dart';

class HomePage extends View {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => new _HomePageState(
    AppComponent.getInjector().getDependency<HomeController>());
}

class _HomePageState extends ViewState<HomePage, HomeController> {
  _HomePageState(HomeController controller) : super(controller);

  @override
  Widget buildPage() {
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.black,
      body: Center(
        child: RaisedButton(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              S.of(context).label_btn_to_users,
            )
          ),
          onPressed: () => controller.goToUsers()),
      ),
    );
  }
}
