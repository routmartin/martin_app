import 'package:flutter/material.dart';
import 'package:martin_app/app/utils/style/app_decoraction.dart';

class CenterIndicator extends StatelessWidget {
  const CenterIndicator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        color: AppColor.darkBackGround,
        child: CircularProgressIndicator(
          strokeWidth: 0.9,
          valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
