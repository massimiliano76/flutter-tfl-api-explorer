import 'package:flutter/material.dart';
import 'package:tfl_api_explorer/src/models/drawer_item.dart';
import 'package:tfl_api_explorer/src/pages/bike_points/bike_points_page.dart';
import 'package:tfl_api_explorer/src/pages/home_page.dart';
import 'package:tfl_api_explorer/src/pages/lines/lines_page.dart';
import 'package:tfl_api_explorer/src/pages/settings/settings_page.dart';

class AppDrawer extends Drawer {
  static final List<DrawerItem> _drawerItems = [
    DrawerItem(
      title: 'Home',
      icon: Icon(Icons.home),
      route: HomePage.route,
    ),
    DrawerItem(
      title: 'Bike points',
      icon: Icon(Icons.http),
      route: BikePointsPage.route,
    ),
    DrawerItem(
      title: 'Lines',
      icon: Icon(Icons.http),
      route: LinesPage.route,
    ),
    DrawerItem(
      title: 'Settings',
      icon: Icon(Icons.settings),
      route: SettingsPage.route,
    ),
  ];

  AppDrawer({Key key})
      : super(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                leading: _drawerItems[index].icon,
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(
                    _drawerItems[index].route,
                  );
                },
                title: Text(_drawerItems[index].title),
              );
            },
            itemCount: _drawerItems.length,
          ),
          key: key,
        );
}
