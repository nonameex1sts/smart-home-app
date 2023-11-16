import 'package:domus/src/screens/add_device/components/body.dart';
import 'package:flutter/material.dart';

class AddDevice extends StatelessWidget {
  const AddDevice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: const Scaffold(
        backgroundColor: Color(0xFFF2F2F2),
        body: Body(),
      ),
    );
  }
}
