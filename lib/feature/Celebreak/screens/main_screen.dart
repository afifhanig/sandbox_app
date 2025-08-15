import 'package:flutter/material.dart';
import 'package:sandbox_flutter_3/feature/Celebreak/util/responsive.dart';
import 'package:sandbox_flutter_3/feature/Celebreak/widgets/activities_widget.dart';
import 'package:sandbox_flutter_3/feature/Celebreak/widgets/general_info_widget.dart';
import 'package:sandbox_flutter_3/feature/Celebreak/widgets/side_menu_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onMenuItemTap(int index) {
    setState(() {
      _currentPage = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Scaffold(
      drawer: !isDesktop
          ? SizedBox(
              width: 250,
              child: SideMenuWidget(
                currentIndex: _currentPage,
                onMenuItemTap: _onMenuItemTap,
              ),
            )
          : null,
      endDrawer: Responsive.isMobile(context)
          ? SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const GeneralInformationWidget(),
            )
          : null,
      body: SafeArea(
        child: Row(
          children: [
            if (isDesktop)
              Expanded(
                flex: 2,
                child: SizedBox(
                  child: SideMenuWidget(
                    currentIndex: _currentPage,
                    onMenuItemTap: _onMenuItemTap,
                  ),
                ),
              ),
            Expanded(
              flex: 7,
              child: PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(), // Disable swipe to change pages
                children: [
                  ActivitiesWidget(),
                  Center(
                    child: Text('mase'),
                  ),
                ],
              ),
            ),
            // if (isDesktop)
            //   Expanded(
            //     flex: 3,
            //     child: SummaryWidget(),
            //   ),
          ],
        ),
      ),
    );
  }
}
