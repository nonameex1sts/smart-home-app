import 'package:domus/src/screens/add_device/add_device.dart';
import 'package:domus/src/screens/edit_device/edit_device.dart';
import 'package:domus/src/screens/set_event_screen/set_event_screen.dart';
import 'package:domus/src/screens/edit_profile/edit_profile.dart';
import 'package:domus/src/screens/login_screen/login_screen.dart';
import 'package:domus/src/screens/settings_screen/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:domus/src/screens/home_screen/home_screen.dart';

// Routes arranged in ascending order

final Map<String, WidgetBuilder> routes = {
  EditProfile.routeName: (context) => const EditProfile(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  SetEventScreen.routeName: (context) => const SetEventScreen(),
  SettingScreen.routeName: (context) => const SettingScreen(),
  EditDevice.routeName: (context) => const EditDevice(),
  AddDevice.routeName: (context) => const AddDevice(),
};
