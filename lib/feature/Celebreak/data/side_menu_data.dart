import 'package:flutter/material.dart';
import 'package:sandbox_flutter_3/feature/Celebreak/model/menu_model.dart';

class SideMenuData {
  final menu = const <MenuModel>[
    MenuModel(icon: Icons.home, title: 'Activities', route: '/main-dashboard'),
    MenuModel(icon: Icons.person, title: 'Location', route: '/location-screen'),
  ];
}
