import 'package:get/get.dart';

class DashboardViewModel extends GetxController {
  final _currentIndex = 1.obs;

  int get currentIndex => _currentIndex.value;

  void onChangePage(int value) {
    _currentIndex.value = value;
  }
}
