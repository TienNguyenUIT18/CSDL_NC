import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_wise/feature/dashboard/dashboard_viewmodel.dart';
import 'package:money_wise/feature/history/ui/history_page.dart';
import 'package:money_wise/feature/home/ui/home_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final viewModel = Get.put(DashboardViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() {
          switch (viewModel.currentIndex) {
            case 0:
              return const HistoryPage();
            case 1:
              return const HomePage();
            // case 2:
            //   return Text(" ${viewModel.currentIndex}");
            default:
              return Text(" ${viewModel.currentIndex}");
          }
        }),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: viewModel.currentIndex,
          onTap: (int index) {
            viewModel.onChangePage(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Cá nhân',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Trang chủ',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.settings),
            //   label: 'Settings',
            // ),
          ],
        ),
      ),
    );
  }
}
