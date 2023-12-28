import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_util_hub/core/presentation/blocs/auth/authentication_bloc.dart';
import 'package:flutter_util_hub/core/presentation/utils/constants.dart';
import 'package:flutter_util_hub/core/presentation/utils/message_generator.dart';
import 'package:flutter_util_hub/core/presentation/utils/theme.dart';
import 'package:flutter_util_hub/core/presentation/utils/widget_helper.dart';
import 'package:flutter_util_hub/core/presentation/widgets/animated_container.dart';
import 'package:flutter_util_hub/core/presentation/widgets/web_optimised_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthenticationBloc _bloc = AuthenticationBloc();
  ProgressDialog? pr;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _bloc,
      listener: (ctx, state) {
        appLogger.i(state);

        if (pr?.isShowing() ?? false) {
          pr?.hide();
        }
        if (state is LoadingState) {
          pr = ProgressDialog(
            context,
            type: ProgressDialogType.normal,
            isDismissible: false,
          );
          pr?.style(
            backgroundColor: appColors.screenBg,
            padding: WebOptimisedWidget.getWebOptimisedHorizonatalPadding(),
            message: state.loadingInfo.message,
            widgetAboveTheDialog: Text(
              state.loadingInfo.title,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
            progressWidget: Padding(
              padding: const EdgeInsets.all(8.0),
              child: LoadingIndicator(
                indicatorType: Indicator.lineScalePulseOutRapid,
                colors: appColors.rainbowColors,
                strokeWidth: 2,
                backgroundColor: appColors.screenBg,
                pathBackgroundColor: appColors.screenBg,
              ),
            ),
            progressTextStyle: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(fontWeight: FontWeight.w400),
            messageTextStyle: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(fontWeight: FontWeight.w400),
          );
          pr?.show();
        } else if (state is AuthErrorState) {
          showSingleButtonAlertDialog(
              context: context, title: state.title, message: state.message);
        } else if (state is AuthSignedInState) {
          context.go("/home");
        }
      },
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          bloc: _bloc,
          builder: (ctx, state) {
            return Scaffold(
              body: Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: maxScreenWidth,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 32.h),
                        Text(
                          MessageGenerator.getMessage("auth-welcome"),
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(color: Colors.blue),
                        ),
                        SizedBox(height: 32.h),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: Theme.of(context).textTheme.labelSmall,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(color: appColors.disableBgColor),
                              hintText:
                                  MessageGenerator.getLabel('user@domain.com'),
                              label: Text(
                                MessageGenerator.getLabel('type in email'),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(),
                              ),
                              prefixIcon: const Icon(Icons.email_outlined),
                              filled: true,
                              fillColor: appColors.inputBgFill,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _passwordController,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            style: Theme.of(context).textTheme.labelSmall,
                            textInputAction: TextInputAction.go,
                            onSubmitted: (value) {
                              submitCredentials();
                            },
                            decoration: InputDecoration(
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(color: appColors.disableBgColor),
                              hintText: MessageGenerator.getLabel('user@123'),
                              label: Text(
                                MessageGenerator.getLabel('type in password'),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(),
                              ),
                              prefixIcon: const Icon(Icons.password_outlined),
                              filled: true,
                              fillColor: appColors.inputBgFill,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AnimatedClickableTextContainer(
                            title: MessageGenerator.getLabel('Sign In'),
                            iconSrc: '',
                            isActive: false,
                            bgColor: appColors.pleasantButtonBg,
                            bgColorHover: appColors.pleasantButtonBgHover,
                            press: () {
                              submitCredentials();
                            },
                          ),
                        ),
                        SizedBox(height: 16.h),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(),
                            children: <TextSpan>[
                              TextSpan(
                                  text: MessageGenerator.getLabel(
                                      'Forgot Password'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(color: Colors.red),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context.go("/forgotPassword");
                                    }),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.h),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(),
                            children: <TextSpan>[
                              TextSpan(
                                  text: MessageGenerator.getLabel('Sign Up'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(color: Colors.red),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context.go("/signup");
                                    }),
                            ],
                          ),
                        ),
                        SizedBox(height: 32.h),
                        Linkify(
                          onOpen: (link) async {
                            if (!await launchUrl(Uri.parse(link.url))) {}
                          },
                          text: MessageGenerator.getMessage(
                              "auth-visit-site-guide"),
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(),
                          linkStyle: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(color: appColors.linkTextColor),
                        ),
                        SizedBox(height: 32.h),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  void submitCredentials() {
    _bloc.add(AuthSignInEvent(_emailController.text, _passwordController.text));
  }
}
