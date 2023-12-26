import 'package:flutter/material.dart';
import 'package:flutter_util_hub/core/presentation/utils/theme.dart';
import 'package:loading_indicator/loading_indicator.dart';

Widget getEmptyListWidget(context, errorInfo) => Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 32,
        ),
        SelectableText(
          errorInfo.message,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(),
        ),
      ],
    );

Widget getLoadingListWidget(context, loadingInfo) => Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 120,
            width: 120,
            child: LoadingIndicator(
                indicatorType: Indicator.ballPulse,
                colors: appColors.rainbowColors,
                strokeWidth: 2,
                backgroundColor: Colors.transparent,
                pathBackgroundColor: appColors.screenBg),
          ),
          Text(
            loadingInfo.message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(),
          ),
        ],
      ),
    );
