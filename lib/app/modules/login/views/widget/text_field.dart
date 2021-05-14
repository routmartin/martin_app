import 'package:flutter/material.dart';

class InputFieldText extends StatelessWidget {
  final Widget child;
  const InputFieldText({
    this.child,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .8,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        border: Border.all(
          color: Colors.grey[300],
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
