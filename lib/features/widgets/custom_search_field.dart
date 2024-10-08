import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final Function()? tap;
  final bool? readOnly;
  final Widget child;

  const SearchField({
    super.key,
    this.tap,
    this.readOnly = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onTap: tap,
              readOnly: readOnly!,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'City | Locality | Landmark',
                hintStyle: TextStyle(
                  color: Theme.of(context).disabledColor.withOpacity(0.4),
                ),
              ),
              style: TextStyle(
                fontSize: 14.0,
                color: Theme.of(context).hintColor,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Theme.of(context).hintColor,
            ),
          ),
        ],
      ),
    );
  }
}
