import 'package:flutter/material.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/styles.dart';

class SeeMoreText extends StatefulWidget {
  final String text;
  final int maxLines;

  const SeeMoreText({
    Key? key,
    required this.text,
    this.maxLines = 2,
  }) : super(key: key);

  @override
  _SeeMoreTextState createState() => _SeeMoreTextState();
}

class _SeeMoreTextState extends State<SeeMoreText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: senRegular.copyWith(fontSize: Dimensions.fontSize14,color: Theme.of(context).disabledColor.withOpacity(0.40)),
          maxLines: _isExpanded ? null : widget.maxLines,
          overflow: _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
        ),
        InkWell(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Text(
            _isExpanded ? 'See Less' : 'See More',
            style: senRegular.copyWith(fontSize: Dimensions.fontSize14,color: Theme.of(context).primaryColor),
          ),
        ),
      ],
    );
  }
}