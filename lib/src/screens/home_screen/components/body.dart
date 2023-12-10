import 'package:SmartHome/config/size_config.dart';
import 'package:SmartHome/src/screens/home_screen/components/weather_container.dart';
import 'package:flutter/material.dart';

import 'add_device_widget.dart';
import 'dark_container.dart';

class Body extends StatelessWidget {
  dynamic devices;
  Body({Key? key, required this.devices}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(7),
          vertical: getProportionateScreenHeight(7),
        ),
        decoration: const BoxDecoration(
          color: Color(0xFFF2F2F2),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(getProportionateScreenHeight(5)),
              child: WeatherContainer(),
            ),
            for (int i = 0; i < devices.length; i+=2)
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(getProportionateScreenHeight(5)),
                      child: DarkContainer(
                        id: devices[i]['id'],
                        isOn: devices[i]['isOn'],
                        type: devices[i]['type'],
                        description: devices[i]['description'],
                      ),
                    ),
                  ),
                  if (i + 1 < devices.length)
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(getProportionateScreenHeight(5)),
                        child: DarkContainer(
                          id: devices[i + 1]['id'],
                          isOn: devices[i + 1]['isOn'],
                          type: devices[i + 1]['type'],
                          description: devices[i]['description'],
                        ),
                      ),
                    )
                  else
                    Expanded(child: Container()),
                ],
              ),
            Padding(
              padding: EdgeInsets.all(getProportionateScreenHeight(8)),
              child: const AddNewDevice(),
            ),
          ],
        ),
      ),
    );
  }
}
