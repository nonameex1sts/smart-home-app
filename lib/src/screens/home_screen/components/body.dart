import 'package:domus/config/size_config.dart';
import 'package:domus/src/screens/home_screen/components/weather_container.dart';
import 'package:flutter/material.dart';

import 'add_device_widget.dart';
import 'dark_container.dart';

class Body extends StatelessWidget {
  dynamic devices;
  Body({Key? key, required this.devices}) : super(key: key);

  String getIconAsset(String type) {
    switch (type) {
      case 'AC':
        return 'assets/icons/svg/ac.svg';
      case 'Fan':
        return 'assets/icons/svg/fan.svg';
      case 'Speaker':
        return 'assets/icons/svg/speaker.svg';
      default:
        return 'assets/icons/svg/light.svg';
    }
  }

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
                        isOn: devices[i]['isOn'],
                        iconAsset: getIconAsset(devices[i]['type']),
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
                          isOn: devices[i + 1]['isOn'],
                          iconAsset: getIconAsset(devices[i + 1]['type']),
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
