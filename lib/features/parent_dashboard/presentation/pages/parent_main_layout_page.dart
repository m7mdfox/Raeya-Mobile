import 'package:flutter/material.dart';
import '../../../home/presentation/widgets/raeya_bottom_nav.dart';
import 'parent_dashboard_page.dart';

class ParentMainLayoutPage extends StatefulWidget {
  const ParentMainLayoutPage({super.key});

  @override
  State<ParentMainLayoutPage> createState() => _ParentMainLayoutPageState();
}

class _ParentMainLayoutPageState extends State<ParentMainLayoutPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const ParentDashboardPage(),
    const Center(child: Text('Parent Learning View Placeholder')),
    const Center(child: Text('Parent Insights Placeholder')),
    const Center(child: Text('Parent Safety Placeholder')),
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
