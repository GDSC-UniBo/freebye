import 'package:flutter/material.dart';
import 'package:freebye/view/pages/search_page.dart';

import 'home.dart';
import 'messages.dart';
import 'my_profile.dart';
import 'new_item.dart';

class MainPage extends StatefulWidget {
  static const String route = '/mainpage';

  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static final List<MenuOption> _widgetOptions = <MenuOption>[
    MenuOption(
      icon: const Icon(Icons.home_outlined),
      selectedIcon: const Icon(Icons.home_filled),
      label: "Home",
      page: const Home(),
    ),
    MenuOption(
      icon: const Icon(Icons.search_outlined),
      selectedIcon: const Icon(Icons.search),
      label: "Search",
      page: const SearchPage(),
    ),
    MenuOption(
      icon: const Icon(Icons.add_circle_outline),
      selectedIcon: const Icon(Icons.add_circle),
      label: "New",
      page: const NewItem(),
    ),
    MenuOption(
      icon: const Icon(Icons.mail_outline),
      selectedIcon: const Icon(Icons.mail),
      label: "Messages",
      page: const Messages(),
    ),
    MenuOption(
      icon: const Icon(Icons.person_outline),
      selectedIcon: const Icon(Icons.person),
      label: "Profile",
      page: MyProfile(),
    ),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex).page,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        fixedColor: Theme.of(context).bottomAppBarColor,
        unselectedItemColor: Theme.of(context).bottomAppBarColor,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        iconSize: 27,
        items: List<BottomNavigationBarItem>.generate(
            _widgetOptions.length,
            (index) => BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  activeIcon: _widgetOptions[index].selectedIcon,
                  icon: _widgetOptions[index].icon,
                  label: _widgetOptions[index].label,
                )),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class MenuOption {
  final Icon icon, selectedIcon;
  final String label;
  final Widget page;

  MenuOption(
      {required this.icon,
      required this.selectedIcon,
      required this.label,
      required this.page});
}
