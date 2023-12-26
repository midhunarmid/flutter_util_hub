import 'package:flutter/material.dart';
import 'package:flutter_util_hub/core/presentation/utils/theme.dart';

class AnimatedClickableTextContainer extends StatefulWidget {
  final bool isActive;
  final String iconSrc;
  final String title;
  final Color bgColor;
  final Color bgColorHover;
  final VoidCallback press;

  const AnimatedClickableTextContainer({
    Key? key,
    required this.isActive,
    required this.iconSrc,
    required this.title,
    required this.press,
    required this.bgColor,
    required this.bgColorHover,
  }) : super(key: key);

  @override
  State createState() {
    return _AnimatedClickableTextContainerState();
  }
}

class _AnimatedClickableTextContainerState
    extends State<AnimatedClickableTextContainer> {
  bool isHover = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding:
          EdgeInsets.only(top: (isHover) ? 4 : 5, bottom: !(isHover) ? 4 : 5),
      color: isHover ? widget.bgColorHover : widget.bgColor,
      child: InkWell(
        onHover: (val) => setState(() {
          isHover = val;
        }),
        onFocusChange: (val) => setState(() {
          isHover = val;
        }),
        onTapDown: (detail) => setState(() {
          isHover = true;
        }),
        onTapUp: (detail) => setState(() {
          isHover = false;
        }),
        onTapCancel: () => setState(() {
          isHover = false;
        }),
        child: ListTile(onTap: widget.press, title: getMenuItem()),
      ),
    );
  }

  Widget getMenuItem() {
    return Container(
      padding: const EdgeInsets.only(bottom: 5, right: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.iconSrc.isNotEmpty)
            Image.asset(
              widget.iconSrc,
              height: 24,
              fit: BoxFit.contain,
              color: (widget.isActive || isHover)
                  ? appColors.sideMenuHighlight
                  : appColors.sideMenuNormal,
            ),
          if (widget.iconSrc.isNotEmpty) const SizedBox(width: 15),
          Text(
            widget.title,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: (widget.isActive || isHover)
                    ? appColors.buttonTextColorHover
                    : appColors.buttonTextColor),
          ),
        ],
      ),
    );
  }
}
