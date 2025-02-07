import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/utils/global/size_box.dart';
import 'package:untitled/utils/style/app_style.dart';
import 'package:untitled/view/widgets/custom_widgets/custom_container_widget.dart';
import 'package:untitled/view/widgets/custom_widgets/custom_icon_widget.dart';
import '../../../../data/model/remote_model/github_repository_models/github_repository_model.dart';

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
          isBoarderRadius: true,
          padding: 12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(githubItems.owner!.avatarUrl!),
                radius: 35.h,
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
              style: myTxt14(fontWeight: FontWeight.w600),
            ),
            szH6(),
            Text(
              githubItems.fullName!,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: myTxt13(),
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
                child: "assets/images/ic_fork.svg",
                isSvgString: true,
                height: 20,
                width: 20,
                color: Colors.black,
              ),
              szW2(),
              Flexible(child: Text(githubItems.forksCount.toString(), maxLines: 1, style: myTxt13(),)),
            ],
          ),
        ),
        Flexible(
          child: Row(
            children: [
              CustomIconWidget(
                child: Icons.star_border,
                height: 20,
                width: 20,
                color: Colors.black,
              ),
              szW2(),
              Flexible(child: Text(githubItems.stargazersCount.toString(), maxLines: 1,style: myTxt13(),)),
            ],
          ),
        ),
        Flexible(
          child: Row(
            children: [
              CustomIconWidget(
                child: Icons.visibility_outlined,
                height: 20,
                width: 20,
                color: Colors.black,
              ),
              szW2(),
              Flexible(child: Text(githubItems.watchers.toString(), maxLines: 1,style: myTxt13(),)),
            ],
          ),
        ),
      ],
    );
  }

}
