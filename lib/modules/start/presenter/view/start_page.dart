import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
//controller
import '../controller/start_controller.dart';
import '../widgets/side_menu.dart';
//core
import 'package:agenda/core/utils/app_color.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final controller = Modular.get<StartController>();
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      appBar: MediaQuery.of(context).size.width < 1200 //desktop
          ? AppBar(
              elevation: 0,
              backgroundColor: AppColor.instance.primaryBackground,
              leading: Container(
                margin: const EdgeInsets.only(left: 20, top: 20),
                decoration: BoxDecoration(
                  color: AppColor.instance.primary,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      _drawerKey.currentState?.openDrawer();
                    },
                    padding: const EdgeInsets.all(0),
                    icon: Icon(
                      Icons.menu,
                      color: AppColor.instance.secondaryBackground,
                      size: 30,
                    ),
                  ),
                ),
              ),
              actions: const [],
            )
          : const PreferredSize(
              preferredSize: Size.zero,
              child: SizedBox(),
            ),
      drawer: Container(
        height: MediaQuery.of(context).size.height,
        color: AppColor.instance.secondaryBackground,
        child: ListView(
          children: <Widget>[
            SideMenu(),
          ],
        ),
      ),
      body: SafeArea(
        child: Row(
          children: [
            if (MediaQuery.of(context).size.width >= 1200) //desktop
              Expanded(
                flex: 1,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  color: AppColor.instance.secondaryBackground,
                  child: ListView(
                    children: <Widget>[
                      SideMenu(),
                    ],
                  ),
                ),
              ),
            const Expanded(
              flex: 5,
              child: RouterOutlet(),
            ),
          ],
        ),
      ),
    );
  }
}
