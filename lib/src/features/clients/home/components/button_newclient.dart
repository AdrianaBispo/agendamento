import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//view
import '../../newclient/view/newclient.dart';
//utils
import '../../../../../components/colors.dart';

class ButtonNewClient extends StatelessWidget {
  const ButtonNewClient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
        child: TextButton.icon(
          icon: SvgPicture.asset(
            'asset/icones/Icon/add.svg',
            color: AppColor.white,
            width: 20,
            height: 20,
          ),
          label: const Text(
            'Novo Cliente',
            style: TextStyle(
              color: AppColor.white,
            ),
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.fromLTRB(15, 20, 20, 20),
            backgroundColor: AppColor.blue,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
                builder: (BuildContext context) {
                  return NewClient();
                },
                fullscreenDialog: true),
          ),
        ),
      ),
    );
  }
}
