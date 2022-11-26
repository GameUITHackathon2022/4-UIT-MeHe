import 'package:flutter/material.dart';

import '../../../widget/inkwell_wrapper.dart';

class FilterCard extends StatefulWidget {
  final String filterItem;
  final ValueChanged<bool> onSelected;

  const FilterCard({Key? key, required this.filterItem, required this.onSelected}) : super(key: key);

  @override
  State<FilterCard> createState() => _FilterCardState();
}

class _FilterCardState extends State<FilterCard> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    var appTheme = Theme.of(context).textTheme;
    return InkWellWrapper(
      onTap: () {
        setState(() {
          selected = !selected;
          widget.onSelected.call(selected);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(
            left: 18,
            right: selected ? 10 : 18,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                  widget.filterItem,
                  style: appTheme.bodyText2
              ),
              Visibility(
                visible: selected,
                child: Padding(
                  padding: const EdgeInsets.only(left: 9),
                  child: Container(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
