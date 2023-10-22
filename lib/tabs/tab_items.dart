import 'package:flutter/material.dart';
import 'package:flutter_app_news/my_theme.dart';

import '../model/SourceResponse.dart';

class TabItem extends StatelessWidget {
  bool isSelected;
  Source source;

  TabItem({required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Theme.of(context).primaryColor, width: 3),
          color:
              isSelected ? Theme.of(context).primaryColor : Colors.transparent),
      child: Text(
        source.name ?? "",
        style: TextStyle(
            fontSize: 18,
            color: isSelected
                ? MyTheme.whiteColor
                : Theme.of(context).primaryColor),
      ),
    );
  }
}
