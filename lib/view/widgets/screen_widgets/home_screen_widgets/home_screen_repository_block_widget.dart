import 'package:flutter/material.dart';
import 'package:untitled/utils/global/size_box.dart';
import 'package:untitled/utils/style/app_style.dart';
import 'package:untitled/view/widgets/custom_widgets/custom_container_widget.dart';
import 'package:untitled/view/widgets/custom_widgets/custom_icon_widget.dart';
import '../../../../data/model/remote_model/github_repository_models/github_repository_model.dart';
import '../../../../utils/theme/get_all_theme.dart';
import '../../custom_widgets/custom_circular_image_widget.dart';

class HomeScreenRepositoryBlockWidget extends StatelessWidget {
  final GithubItems githubItems;
   const HomeScreenRepositoryBlockWidget({
    super.key,
    required this.githubItems,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomContainerWidget(
          themeIndex: 2,
          isAllBoarderRadius: true,
          padding: 12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomCircularImageWidget(
                cacheImageUrl: githubItems.owner!.avatarUrl!,
                errorImageWidget: "assets/images/flutter.png",
                progressIndicatorImage: "assets/images/flutter.png",
              ),
              szH15(),
              _getDetailsView(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getDetailsView() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              githubItems.owner!.login!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: myTxt14(fontWeight: FontWeight.w600, color: GetTheme().txtTheme().txtColorBlack!),
            ),
            szH6(),
            Text(
              githubItems.fullName!,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: myTxt13(color: GetTheme().txtTheme().txtColorBlack!),
            ),
            szH6(),
            _getForkStarWatcherView(),
          ],
        ),
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
              Flexible(child: Text(githubItems.forks.toString(), maxLines: 1, style: myTxt13(color: GetTheme().txtTheme().txtColorBlack!),)),
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
              Flexible(child: Text(githubItems.stargazersCount.toString(), maxLines: 1,style: myTxt13(color: GetTheme().txtTheme().txtColorBlack!),)),
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
              Flexible(child: Text(githubItems.watchersCount.toString(), maxLines: 1,style: myTxt13(color: GetTheme().txtTheme().txtColorBlack!),)),
            ],
          ),
        ),
      ],
    );
  }

}
