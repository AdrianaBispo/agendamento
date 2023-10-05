import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
//controller
import '../../components/side_menu.dart';
import '../controller/start_controller.dart';
//utils
import '../../../shared/utils/app_color.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final controller = Modular.get<StartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
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
