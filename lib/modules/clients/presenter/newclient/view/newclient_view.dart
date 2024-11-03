import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
//widgets
import '../widgets/form_client.dart';
import 'package:agenda/core/theme/app_color.dart';

class NewClientView extends StatefulWidget {
  const NewClientView({Key? key}) : super(key: key);

  @override
  State<NewClientView> createState() => _NewClientViewState();
}

class _NewClientViewState extends State<NewClientView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Modular.to.navigate('./'),
          icon: Icon(
            Icons.close,
            color: AppColor.instance.primary,
          ),
        ),
        backgroundColor: AppColor.instance.primaryBackground,
        elevation: 0,
      ),
      body: const FormClient(),
      
    );
  }
}
