import 'package:flutter/material.dart';
import '../../../features/home/presentation/pages/kid_home_page.dart';
import '../../../features/learn/presentation/pages/learning_world_page.dart';
import '../../../features/home/presentation/widgets/raeya_bottom_nav.dart';

class MainLayoutPage extends StatefulWidget {
  const MainLayoutPage({super.key});

  @override
  State<MainLayoutPage> createState() => _MainLayoutPageState();
}

class _MainLayoutPageState extends State<MainLayoutPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const KidHomePage(),
    const LearningWorldPage(),
    const Center(child: Text('Insights Placeholder')),
    const Center(child: Text('Safety Placeholder')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: RaeyaBottomNav(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
