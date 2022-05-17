import 'package:agenda/view/ui/drawer_list_tile.dart';
import 'package:flutter/material.dart';
//color
import '../const/colors.dart';
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

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
                child: Column(
                  children: <Widget>[
                    DrawerListTile(pagina: HomePage(), texto: 'Home'),
                    DrawerListTile(pagina: {}, texto: 'Agenda'),
                    DrawerListTile(pagina:  {}, texto: 'Clientes'),
                    DrawerListTile(pagina: {}, texto: 'Profissionais'),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: AppColor.natural_7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Expanded(
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
                              children: const <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    '20',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Total de vendas',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 136,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: AppColor.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    '20',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Total de produtos',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 136,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 136,
                          ),
                        ),
                      ),
                    ]),
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
}
