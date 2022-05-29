import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    this.color,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.disabledColor,
    required this.onPressed,
    this.mouseCursor,
    this.focusNode,
    this.autofocus = false,
    this.tooltip,
    this.enableFeedback = true,
    this.constraints,
    this.icon,
    this.child,
  })  : assert(icon != null || child != null),
        super(key: key);

  final Widget? icon;
  final Widget? child;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? color;
  final Color? splashColor;
  final Color? highlightColor;
  final Color? disabledColor;
  final VoidCallback? onPressed;
  final MouseCursor? mouseCursor;
  final FocusNode? focusNode;
  final bool autofocus;
  final String? tooltip;
  final bool enableFeedback;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    Widget result;
    if (icon != null && child != null) {
      result = TextButton.icon(
        onPressed: onPressed,
        icon: icon!,
        label: child!,
        key: key,
        focusNode: focusNode,
        autofocus: autofocus,
      );
    } else if (icon != null) {
      result = Padding(
        padding: const EdgeInsets.only(right: 11.0),
        child: IconButton(
          color: color,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          disabledColor: disabledColor,
          onPressed: onPressed,
          mouseCursor: mouseCursor,
          focusNode: focusNode,
          autofocus: autofocus,
          tooltip: tooltip,
          enableFeedback: enableFeedback,
          constraints: constraints,
          icon: icon!,
        ),
      );
    } else {
      result = TextButton(
        onPressed: onPressed,
        child: child!,
        key: key,
        focusNode: focusNode,
        autofocus: autofocus,
      );
    }

    if (tooltip != null && result is TextButton) {
      result = Tooltip(
        message: tooltip,
        child: result,
      );
    }

    return result;
  }
}
