import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/utils/style/app_style.dart';

class CustomScaffoldWidget extends StatelessWidget {
  final Widget? body;
  final bool isAppBar;
  final Widget? drawer;
  final bool isAppBarWithPreferredSize;
  final bool isAppBarWithTabBar;

  final dynamic appBarBottomWidget;
  final List<Widget> appBarActionList;
  final dynamic appBarTitle;
  final dynamic leading;
  final Color? scaffoldBackGroundColor;
  final Color? appBarBackGroundColor;
  final Widget? bottomNavigationBar;
  final bool centerTitle;
  final bool automaticallyImplyLeading;
  final double bottomHeight;

  const CustomScaffoldWidget({
    this.body,
    this.isAppBar = false,
    this.drawer,
    this.appBarTitle = "title",
    this.isAppBarWithPreferredSize = false,
    this.isAppBarWithTabBar = false,
    this.appBarBottomWidget,
    this.appBarActionList = const[],
    this.scaffoldBackGroundColor,
    this.appBarBackGroundColor,
    this.bottomNavigationBar,
    this.centerTitle = true,
    this.automaticallyImplyLeading = false,
    this.leading,
    this.bottomHeight = 170,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final scaffoldBgColor = scaffoldBackGroundColor ?? Theme.of(context).scaffoldBackgroundColor;
    final appBarBgColor = appBarBackGroundColor ?? Theme.of(context).appBarTheme.backgroundColor;

    return Scaffold(
      backgroundColor: scaffoldBgColor,
      extendBody: true,
      drawer: drawer,
      appBar: !isAppBar ?
      null :
      AppBar(
        elevation: 0,
        automaticallyImplyLeading: automaticallyImplyLeading,
        backgroundColor: appBarBgColor,
        // foregroundColor: appBarBackGroundColor,
        iconTheme: Theme.of(context).appBarTheme.iconTheme!,
        actions: appBarActionList,
        centerTitle: centerTitle,
        leading: leading,
        title: appBarTitle is String ? Text(appBarTitle, style: myTxt15(color: Theme.of(context).appBarTheme.iconTheme!.color!, fontWeight: FontWeight.w600),) : appBarTitle,
        shape: !isAppBarWithPreferredSize
            ? null
            : const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
        bottom: isAppBarWithTabBar ? appBarBottomWidget : isAppBarWithPreferredSize
            ?
        PreferredSize(
          preferredSize: Size.fromHeight(bottomHeight.h),
          child: appBarBottomWidget!,
        ) : null,
      ),
      body: body,
      //bottomNavigationBar: bottomNavigationBar,
    );
  }
}
