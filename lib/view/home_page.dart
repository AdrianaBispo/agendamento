import 'package:flutter/material.dart';
//color
import '../const/colors.dart';
//ui
import 'ui/side_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
/*
home
agenda
cliente (botão novo cadastro)
profissionais 



 */

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(),
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 1, //takes 1/6 of the screen
              child: Container(
                color: AppColor.white,
                child: SideMenu(selected: [true, false, false, false]),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: AppColor.natural_7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _quadrados(
                            quantidade: 20.toString(),
                            total: 'Total de vendas'),
                        _quadrados(
                            quantidade: 20.toString(),
                            total: 'Total de produtos'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        //   flex: 5,
      ),
    );
  }

  Widget _quadrados({required String quantidade, required String total}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 136,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  quantidade,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                total,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } //_quadrados
}
