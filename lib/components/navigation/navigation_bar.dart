import 'package:flutter/material.dart';
import 'package:gym_app/components/screens/events/events.dart';
import 'package:gym_app/components/screens/home/home.dart';
import 'package:gym_app/components/screens/profile/profile.dart';

class _MenuItem {
  final String label;
  final IconData icon;

  const _MenuItem({required this.label, required this.icon});
}

const menuItems = <_MenuItem>[
  _MenuItem(label: 'Inicio', icon: Icons.home),
  _MenuItem(label: 'Eventos', icon: Icons.event),
  _MenuItem(label: 'Perfil', icon: Icons.person),
];

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    final appBackgroundColor = Theme.of(context).colorScheme;

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int i) {
          setState(() {
            selectedPage = i;
          });
        },
        destinations: menuItems
            .map((item) => _Destination(
                  menuItem: item,
                ))
            .toList(),
        selectedIndex: selectedPage,
      ),
      appBar: AppBar(
        title: const Text('Legacy Academy'),
        backgroundColor: appBackgroundColor.primaryContainer,
      ),
      body: SafeArea(
          child: [
        HomeScreen(),
        const EventsScreen(),
        const ProfileScreen()
      ][selectedPage]),
    );
  }
}

class _Destination extends StatelessWidget {
  final _MenuItem menuItem;

  const _Destination({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: Icon(menuItem.icon),
      label: menuItem.label,
    );
  }
}
