import 'package:flutter/material.dart';
class DissmisibleBackgroundWidget extends StatelessWidget {
  const DissmisibleBackgroundWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.blue,
            child: Center(
              child: Icon(
                Icons.edit,
                color: Colors.white,
                size: 40,
              ),
            ),
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(left: 20),
            margin: EdgeInsets.symmetric( vertical: 4),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Theme.of(context).errorColor,
            child: Center(
              child: Icon(
                Icons.delete,
                color: Colors.white,
                size: 40,
              ),
            ),
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 20),
            margin: EdgeInsets.symmetric( vertical: 4),
          ),
        ),
      ],
    );
  }
}
