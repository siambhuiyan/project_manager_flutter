import 'package:flutter/material.dart';

import '../widgets/tm_app_bar.dart';
import 'new_task_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screen = [
    NewTaskScreen(),
    NewTaskScreen(),
    NewTaskScreen(),
    NewTaskScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      body: _screen[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          _selectedIndex = index;
          setState(() {});
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.new_label), label: 'New'),
          NavigationDestination(
              icon: Icon(Icons.incomplete_circle_rounded), label: 'Progress'),
          NavigationDestination(icon: Icon(Icons.done), label: 'Complete'),
          NavigationDestination(
              icon: Icon(Icons.cancel_outlined), label: 'Cancelled'),
        ],
      ),
    );
  }
}
