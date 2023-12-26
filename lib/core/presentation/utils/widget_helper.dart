import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_util_hub/core/presentation/utils/message_generator.dart';
import 'package:flutter_util_hub/core/presentation/utils/theme.dart';
import 'package:flutter_util_hub/core/presentation/utils/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_util_hub/core/presentation/widgets/animated_container.dart';
import 'package:go_router/go_router.dart';

showSingleButtonAlertDialog({
  required BuildContext context,
  required String title,
  required String message,
  DialogType dialogType = DialogType.error,
  String button = "",
  VoidCallback? positiveAction,
}) {
  AwesomeDialog(
    context: context,
    width: maxScreenWidth,
    dialogType: dialogType,
    animType: AnimType.scale,
    title: title,
    titleTextStyle: Theme.of(context)
        .textTheme
        .labelSmall
        ?.copyWith(fontWeight: FontWeight.w700),
    descTextStyle: Theme.of(context)
        .textTheme
        .labelSmall
        ?.copyWith(fontWeight: FontWeight.w400),
    buttonsTextStyle:
        Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.white),
    padding: const EdgeInsets.all(16.0),
    btnOk: AnimatedClickableTextContainer(
      title: button.isEmpty
          ? MessageGenerator.getLabel("OK")
          : MessageGenerator.getLabel(button),
      iconSrc: '',
      isActive: false,
      bgColor: appColors.pleasantButtonBg,
      bgColorHover: appColors.pleasantButtonBgHover,
      press: () {
        Navigator.pop(context);
        positiveAction?.call();
      },
    ),
    desc: message,
  ).show();
}

showTwoButtonAlertDialog({
  required BuildContext context,
  required String title,
  required String message,
  DialogType dialogType = DialogType.question,
  String positiveButton = "",
  String negativeButton = "",
  required VoidCallback positiveAction,
  required VoidCallback negativeAction,
  required Color positiveButtonBg,
  required Color positiveButtonBgHover,
  required Color negativeButtonBg,
  required Color negativeButtonBgHover,
}) {
  AwesomeDialog(
    context: context,
    width: maxScreenWidth,
    dialogType: dialogType,
    animType: AnimType.scale,
    title: title,
    titleTextStyle: Theme.of(context)
        .textTheme
        .labelSmall
        ?.copyWith(fontWeight: FontWeight.w700),
    descTextStyle: Theme.of(context)
        .textTheme
        .labelSmall
        ?.copyWith(fontWeight: FontWeight.w400),
    buttonsTextStyle:
        Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.white),
    padding: const EdgeInsets.all(16.0),
    btnOk: AnimatedClickableTextContainer(
      title: positiveButton.isEmpty
          ? MessageGenerator.getLabel("OK")
          : MessageGenerator.getLabel(positiveButton),
      iconSrc: '',
      isActive: false,
      bgColor: positiveButtonBg,
      bgColorHover: positiveButtonBgHover,
      press: () {
        Navigator.pop(context);
        positiveAction.call();
      },
    ),
    btnCancel: AnimatedClickableTextContainer(
      title: negativeButton.isEmpty
          ? MessageGenerator.getLabel("Cancel")
          : MessageGenerator.getLabel(negativeButton),
      iconSrc: '',
      isActive: false,
      bgColor: negativeButtonBg,
      bgColorHover: negativeButtonBgHover,
      press: () {
        Navigator.pop(context);
        negativeAction.call();
      },
    ),
    desc: message,
  ).show();
}

SliverToBoxAdapter getSliverTextInputWidget(
    {required BuildContext context,
    required String label,
    required String hint,
    int minLines = 1,
    int maxLines = 1,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    IconData? icon,
    VoidCallback? onPressed,
    List<TextInputFormatter>? inputFormatters,
    int? maxLength,
    TextInputAction textInputAction = TextInputAction.next,
    ValueChanged<String>? onSubmitted,
    FocusNode? focusNode,
    Widget? prefixIcon,
    bool? enabled}) {
  return SliverToBoxAdapter(
    child: getTextInputWidget(
        context: context,
        label: label,
        hint: hint,
        minLines: minLines,
        maxLines: maxLines,
        controller: controller,
        keyboardType: keyboardType,
        icon: icon,
        onPressed: onPressed,
        inputFormatters: inputFormatters,
        maxLength: maxLength,
        textInputAction: textInputAction,
        onSubmitted: onSubmitted,
        focusNode: focusNode,
        prefixIcon: prefixIcon,
        enabled: enabled),
  );
}

Widget getTextInputWidget({
  required BuildContext context,
  required String label,
  required String hint,
  int minLines = 1,
  int maxLines = 1,
  required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  IconData? icon,
  VoidCallback? onPressed,
  List<TextInputFormatter>? inputFormatters,
  int? maxLength,
  TextInputAction textInputAction = TextInputAction.next,
  ValueChanged<String>? onSubmitted,
  FocusNode? focusNode,
  Widget? prefixIcon,
  bool? enabled,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            autofocus: true,
            controller: controller,
            keyboardType: keyboardType,
            style: Theme.of(context).textTheme.labelSmall,
            minLines: minLines,
            maxLines: maxLines,
            maxLength: maxLength,
            inputFormatters: inputFormatters,
            textInputAction: textInputAction,
            focusNode: focusNode,
            enabled: enabled,
            onSubmitted: (value) {
              onSubmitted?.call(value);
              onPressed?.call();
            },
            decoration: InputDecoration(
              hintStyle: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: appColors.disableBgColor),
              hintText: MessageGenerator.getLabel(hint),
              label: Text(
                MessageGenerator.getLabel(label),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(),
              ),
              filled: true,
              fillColor: appColors.inputBgFill,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8)),
              prefixIcon: prefixIcon,
            ),
          ),
        ),
        if (icon != null)
          IconButton(
            icon: Icon(
              icon,
            ),
            onPressed: () {
              onPressed?.call();
            },
          ),
      ],
    ),
  );
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      });
}
