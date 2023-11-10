import 'package:domus/config/size_config.dart';
import 'package:domus/view/home_screen_view_model.dart';
import 'package:flutter/material.dart';

class WeatherContainer extends StatelessWidget {
  const WeatherContainer({Key? key, required this.model}) : super(key: key);

  final HomeScreenViewModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: getProportionateScreenHeight(80),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xFFFFFFFF),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10),
              vertical: getProportionateScreenHeight(6),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // SizedBox(
                //   width: getProportionateScreenWidth(90),
                // ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.thermostat,
                      color: Colors.black,
                      size: 60,
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    Text(
                      '28°C',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.water_drop_rounded,
                      color: Colors.black,
                      size: 60,
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    Text(
                      '70%',
                      style: Theme.of(context).textTheme.headlineLarge,

                    ),
                  ],
                ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.end,
                //   children: [
                //     Text(
                //       '28°C',
                //       style: Theme.of(context).textTheme.headline1,
                //     ),
                //     Text(
                //       'Cloudy',
                //       style: Theme.of(context).textTheme.headline1,
                //     ),
                //     SizedBox(
                //       height: getProportionateScreenHeight(5),
                //     ),
                //     Text(
                //       '27 Mar 2022',
                //       style: Theme.of(context).textTheme.headline5,
                //     ),
                //     Text(
                //       'Ha Noi, Viet Nam',
                //       style: Theme.of(context).textTheme.headline5,
                //     )
                //   ],
                // ),
              ],
            ),
          ),
        ),
        // Image.asset(
        //   'assets/images/weather/0.png',
        //   height: getProportionateScreenHeight(110),
        //   width: getProportionateScreenWidth(140),
        //   fit: BoxFit.contain,
        // ),
      ],
    );
  }
}
