import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:money_wise/core/extension/ui/core_page.dart';
import 'package:money_wise/core/extension/ui/round_btn.dart';
import 'package:money_wise/core/helper/base_color.dart';
import 'package:money_wise/feature/history/model/history.dart';
import 'package:money_wise/feature/history/ui/history_viewmodel.dart';
import 'package:money_wise/feature/history/widgets/list_history.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final viewModel = Get.put(HistoryPageViewModel());

  @override
  void initState() {
    viewModel.getAllMonth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CorePage(
      body: Obx(
        () => SizedBox(
          child: ListHistory(
            scrollController: viewModel.historyScrollCtrl,
            histories: viewModel.histories,
            onRefresh: () => viewModel.getAllMonth(),
          ),
        ),
      ),
    );
  }
}
