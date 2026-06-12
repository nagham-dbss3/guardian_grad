import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_colors.dart';
import '../widgets/surface_background.dart';

/// Bottom-nav shell for the four primary tabs. Home (index 0) renders its own
/// header, so it has no AppBar; the other tabs get a simple titled AppBar.
class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  static const _titles = ['', 'السجل الطبي', 'نتائج التحاليل', 'المواعيد'];

  @override
  Widget build(BuildContext context) {
    final index = navigationShell.currentIndex;
    return Scaffold(
      extendBodyBehindAppBar: index == 0,
      appBar: index == 0
          ? null
          : AppBar(
              title: Text(_titles[index]),
              actions: [
                IconButton(
                  icon: const Icon(Icons.person_outline_rounded),
                  onPressed: () => context.push('/profile'),
                ),
              ],
            ),
      body: SurfaceBackground(
        child: SafeArea(
          bottom: false,
          child: navigationShell,
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.card,
          border: Border(top: BorderSide(color: AppColors.border)),
        ),
        child: SafeArea(
          top: false,
          child: BottomNavigationBar(
            currentIndex: index,
            onTap: (i) => navigationShell.goBranch(
              i,
              initialLocation: i == navigationShell.currentIndex,
            ),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home_rounded),
                label: 'الرئيسية',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.folder_shared_outlined),
                activeIcon: Icon(Icons.folder_shared_rounded),
                label: 'السجل',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.science_outlined),
                activeIcon: Icon(Icons.science_rounded),
                label: 'التحاليل',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.event_outlined),
                activeIcon: Icon(Icons.event_rounded),
                label: 'المواعيد',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
