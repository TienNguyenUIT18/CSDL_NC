import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:money_wise/core/extension/ui/toast.dart';
import 'package:money_wise/core/helper/base_color.dart';
import 'package:money_wise/feature/history/model/history.dart';
import 'package:money_wise/feature/history/widgets/history_detail_dialog.dart';
import 'package:money_wise/feature/history/widgets/month_card_widget.dart';

class ListHistory extends StatefulWidget {
  final Future<void> Function()? onRefresh;
  final ScrollController? scrollController;
  final List<HistoryData?>? histories;
  final int? currentIndex;
  final bool? isShowPlaceHolder;

  const ListHistory({
    Key? key,
    this.onRefresh,
    this.scrollController,
    this.histories,
    this.currentIndex,
    this.isShowPlaceHolder,
  }) : super(key: key);

  @override
  State<ListHistory> createState() => _ListHistoryState();
}

class _ListHistoryState extends State<ListHistory> {
  @override
  Widget build(BuildContext context) {
    return widget.histories!.isEmpty
        ? Padding(
            padding: EdgeInsets.only(top: (ScreenUtil.defaultSize.height - 140) / 5.h),
            child: Center(
              child: Column(
                children: [if (widget.histories!.length == 0) Text("Chưa có dữ liệu")],
              ),
            ),
          )
        : RefreshIndicator(
            onRefresh: () => widget.onRefresh!(),
            color: BaseColor.primaryColor,
            child: CustomScrollView(
              controller: widget.scrollController,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      if (widget.histories != null && widget.histories!.isNotEmpty) {
                        final history = widget.histories![index];
                        final month = int.tryParse(history?.monthId?.split("-")[0].toString() ?? "");
                        final year = int.tryParse(history?.monthId?.split("-")[1].toString() ?? "");
                        return GestureDetector(
                          onTap: () {
                            if (history!.totalUsed != 0) {
                              Get.dialog(HistoryDetailDialog(details: history!.moneyData?.reversed.toList() ?? []));
                            } else {
                              BaseUI.showToast(
                                message: "Không có dữ liệu",
                              );
                            }
                          },
                          child: MonthCard(
                            month: month,
                            year: year,
                            history: history,
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                    childCount: widget.histories?.length ?? 0,
                  ),
                ),
              ],
            ),
          );
  }
}
