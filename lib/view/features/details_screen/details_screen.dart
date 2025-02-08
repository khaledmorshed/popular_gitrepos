import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/data/model/remote_model/github_repository_models/github_repository_model.dart';
import 'package:untitled/utils/global/date_time_format_class.dart';
import 'package:untitled/utils/global/screen_padding.dart';
import '../../../utils/global/size_box.dart';
import '../../../utils/style/app_style.dart';
import '../../../utils/theme/app_colors/basic_color.dart';
import '../../../utils/theme/get_all_theme.dart';
import '../../widgets/custom_widgets/custom_container_widget.dart';
import '../../widgets/custom_widgets/custom_icon_widget.dart';
import '../../widgets/custom_widgets/custom_scaffold_widget.dart';

class DetailsScreen extends StatefulWidget {
  static const String routeName = '/DetailsScreen';
  final GithubItems? githubItems;
  const DetailsScreen({
    this.githubItems,
    super.key
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWidget(
      body: NestedScrollView(
        floatHeaderSlivers: true, // Allows the SliverAppBar to float
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              floating: true,
              pinned: true,
              automaticallyImplyLeading: true,
              expandedHeight: 210.h,
              collapsedHeight: 50,
              toolbarHeight: 50,
              title: Text("Details Screen", style: myTxt15(color: whiteOnly, fontWeight: FontWeight.w600),),
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: widget.githubItems!.owner!.avatarUrl!,
                    progressIndicatorBuilder: (context, url, downloadProgress) => Image.asset("assets/images/flutter.png", fit: BoxFit.fill,),
                    errorWidget: (context, url, error) => Image.asset("assets/images/flutter.png", fit: BoxFit.fill,),
                  )
                ),
              ),
            ),
          ];
        },
        body: buildBodyContent(),
      ),
    );
  }

  buildBodyContent(){
    return CustomContainerWidget(
      themeIndex: 2,
      alignment: Alignment.centerLeft,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          szH15(),
          CustomContainerWidget(
            themeIndex: 3,
            boarderRadius: 8,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Owner name: ",
                        //style: myTxt14(),
                        style: myTxt14(fontWeight: FontWeight.w600, color: GetTheme().txtTheme().txtColorBlack!),
                      ),
                      szW5(),
                      Text(
                        widget.githubItems!.owner!.login.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: myTxt14(color: GetTheme().txtTheme().txtColorBlack!),
                      ),
                    ],
                  ),
                  szH10(),
                  Row(
                    children: [
                      Text(
                        "Repository name: ",
                        style: myTxt14(fontWeight: FontWeight.w600, color: GetTheme().txtTheme().txtColorBlack!),
                      ),
                      szW5(),
                      Flexible(
                        child: Text(
                          widget.githubItems!.fullName.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: myTxt14(color: GetTheme().txtTheme().txtColorBlack!),
                        ),
                      ),
                    ],
                  ),
                  szH10(),
                  Row(
                    children: [
                      Text(
                        "Last update time: ",
                        style: myTxt14(fontWeight: FontWeight.w600,color: GetTheme().txtTheme().txtColorBlack!),
                      ),
                      szW5(),
                      Flexible(
                        child: Text(
                          DateTimeFormatClass().formatDateTime(widget.githubItems!.updatedAt.toString()),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: myTxt14(color: GetTheme().txtTheme().txtColorBlack!),
                        ),
                      ),
                    ],
                  ),
                  szH10(),
                  _getForkStarWatcherView(),
                ],
              ),
            ),
          ),
          szH15(),
          Padding(
            padding: screenPadding(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Description: ",
                  //style: myTxt14(),
                  style: myTxt14(fontWeight: FontWeight.w600, color: GetTheme().txtTheme().txtColorBlack!),
                ),
                szH5(),
                Text(
                  widget.githubItems!.description.toString(),
                  textAlign: TextAlign.justify,
                  style: myTxt14(height: 1.9, color: GetTheme().txtTheme().txtColorBlack!),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _getForkStarWatcherView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Row(
            children: [
              CustomIconWidget(
                themeIndex: 1,
                child: "assets/images/ic_fork.svg",
                isSvgString: true,
                height: 20,
                width: 20,
                color: Colors.black,
              ),
              szW2(),
              Flexible(child: Text(widget.githubItems!.forks.toString(), maxLines: 1, style: myTxt13(color: GetTheme().txtTheme().txtColorBlack!),)),
            ],
          ),
        ),
        Flexible(
          child: Row(
            children: [
              CustomIconWidget(
                themeIndex: 1,
                child: Icons.star_border,
                height: 20,
                width: 20,
                color: Colors.black,
              ),
              szW2(),
              Flexible(child: Text(widget.githubItems!.stargazersCount.toString(), maxLines: 1,style: myTxt13(color: GetTheme().txtTheme().txtColorBlack!),)),
            ],
          ),
        ),
        Flexible(
          child: Row(
            children: [
              CustomIconWidget(
                themeIndex: 1,
                child: Icons.visibility_outlined,
                height: 20,
                width: 20,
                color: Colors.black,
              ),
              szW2(),
              Flexible(child: Text(widget.githubItems!.watchersCount.toString(), maxLines: 1,style: myTxt13(color: GetTheme().txtTheme().txtColorBlack!),)),
            ],
          ),
        ),
      ],
    );
  }

}
