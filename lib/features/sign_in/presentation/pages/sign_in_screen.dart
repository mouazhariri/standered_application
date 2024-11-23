import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:standered_application/features/sign_in/domain/entities/sign_in_params.dart';
import 'package:standered_application/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:standered_application/src/application/di/injection.dart';
import 'package:standered_application/src/application/router/app_router.dart';
import 'package:standered_application/src/application/router/app_routes.dart';
import 'package:standered_application/src/core/utils/constants/messages/app_messages.dart';
import 'package:standered_application/src/core/utils/extenssion/assets_extension.dart';
import 'package:standered_application/src/core/widgets/screen%20state/error_screen.dart';
import 'package:standered_application/src/resourses/assets_manager/assets_manager.dart';
import 'package:standered_application/src/resourses/color_manager/color_provider.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextTheme textTheme = theme.textTheme;
    ColorProvider colorProvider = ColorProvider();
    return BlocProvider<SignInBloc>(
      create: (context) => sl<SignInBloc>(),
      child: BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state.success) {
            AppMessages.showSuccess(message: state.message);
            context.push(AppRoutes.homeScreen);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: colorProvider.background,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  width: 327,
                  child: Column(children: [
                    Text(
                      'Hi, Welcome Back! 👋',
                      textAlign: TextAlign.center,
                      style: textTheme.displayMedium!
                          .copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          )
                          .copyWith(fontSize: 20),
                    ),
                    const SizedBox(height: 8),
                    Text('We happy to see you. Sign In to your account',
                        textAlign: TextAlign.center,
                        style: textTheme.displayMedium!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        )),
                    const SizedBox(height: 36),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email',
                            style: textTheme.displayMedium!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            )),
                        const SizedBox(
                          height: 8,
                        ),
                        PrimaryTextFormField(
                            borderRadius: BorderRadius.circular(20),
                            hintText: 'hello@gmail.com',
                            controller: emailC,
                            width: 327,
                            height: 52)
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Password',
                            style: textTheme.displayMedium!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            )),
                        const SizedBox(height: 8),
                        PasswordTextField(
                            borderRadius: BorderRadius.circular(20),
                            hintText: 'Password',
                            controller: passwordC,
                            width: 327,
                            height: 52)
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        PrimaryTextButton(
                          onPressed: () {},
                          title: 'Forgot Password?',
                          textStyle: const TextStyle(),
                        )
                      ],
                    ),
                    const SizedBox(height: 32),
                    Column(
                      children: [
                        PrimaryButton(
                          elevation: 0,
                          onTap: () {
                            context.read<SignInBloc>().add(SignInWithEmailEvent(
                                  params: SignInParams(
                                    email: emailC.text,
                                    password: passwordC.text,
                                  ),
                                ));
                          },
                          text: 'LogIn',
                          bgColor: colorProvider.primary,
                          borderRadius: 20,
                          height: 46,
                          width: 327,
                          textColor: colorProvider.surface,
                          fontSize: 14,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: CustomRichText(
                              title: 'Don’t have an account?',
                              subtitle: ' Create here',
                              onTab: () {},
                              subtitleTextStyle:
                                  textTheme.displayMedium!.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              )),
                        )
                      ],
                    ),
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 45),
                      child: Column(
                        children: [
                          const DividerRow(title: 'Or Sign In with'),
                          const SizedBox(height: 24),
                          SecondaryButton(
                            height: 56,
                            textColor: colorProvider.surface,
                            width: 280,
                            onTap: () {},
                            borderRadius: 24,
                            bgColor:
                                colorProvider.lightPrimary.withOpacity(0.3),
                            text: 'Continue with Google',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: TermsAndPrivacyText(
                        title1: '  By signing up you agree to our',
                        title2: ' Terms ',
                        title3: '  and',
                        title4: ' Conditions of Use',
                      ),
                    ),
                    const SizedBox(height: 24),
                  ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class TermsAndPrivacyText extends StatelessWidget {
  const TermsAndPrivacyText(
      {super.key,
      required this.title1,
      required this.title2,
      required this.title3,
      this.color2,
      required this.title4});
  final Color? color2;
  final String title1, title2, title3, title4;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextTheme textTheme = theme.textTheme;
    ColorProvider colorProvider = ColorProvider();
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: textTheme.displayMedium!.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(
            text: title1,
          ),
          TextSpan(
            text: title2,
            style: textTheme.displayMedium!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: title3,
            style: textTheme.displayMedium!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: title4,
            style: textTheme.displayMedium!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class SecondaryButton extends StatefulWidget {
  final VoidCallback onTap;
  final String text;
  final double width;
  final double height;
  final double borderRadius;
  final double? fontSize;
  final Color textColor, bgColor;
  const SecondaryButton(
      {super.key,
      required this.onTap,
      required this.text,
      required this.width,
      required this.height,
      required this.borderRadius,
      this.fontSize,
      required this.textColor,
      required this.bgColor});

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final Tween<double> _tween = Tween<double>(begin: 1.0, end: 0.95);
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextTheme textTheme = theme.textTheme;
    ColorProvider colorProvider = ColorProvider();
    return GestureDetector(
      onTap: () {
        _controller.forward().then((_) {
          _controller.reverse();
        });
        widget.onTap();
      },
      child: ScaleTransition(
        scale: _tween.animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOut,
            reverseCurve: Curves.easeIn,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
          height: widget.height,
          alignment: Alignment.center,
          width: widget.width,
          decoration: BoxDecoration(
            color: widget.bgColor,
            border: Border.all(color: colorProvider.lightPrimary),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: Row(
            children: [
              // Image.asset(widget.icons, width: 23.85, height: 23.04),
              const SizedBox(width: 12),
              Text(widget.text,
                  style: textTheme.displayMedium!
                      .copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )
                      .copyWith(
                        color: widget.textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      )),
            ],
          ),
        ),
      ),
    );
  }
}

class DividerRow extends StatelessWidget {
  final String title;
  const DividerRow({
    required this.title,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextTheme textTheme = theme.textTheme;
    ColorProvider colorProvider = ColorProvider();
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: Divider(
              color: colorProvider.grey,
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Text(title,
              style: textTheme.displayMedium!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              )),
        ),
        Expanded(
            flex: 2,
            child: Divider(
              color: colorProvider.grey,
            ))
      ],
    );
  }
}

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTab,
    required this.subtitleTextStyle,
  });
  final String title, subtitle;
  final TextStyle subtitleTextStyle;
  final VoidCallback onTab;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextTheme textTheme = theme.textTheme;
    ColorProvider colorProvider = ColorProvider();
    return GestureDetector(
      onTap: onTab,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: title,
          style: textTheme.displayMedium!.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          children: <TextSpan>[
            TextSpan(
              text: subtitle,
              style: subtitleTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class PrimaryButton extends StatefulWidget {
  final VoidCallback onTap;
  final String text;
  final double? width;
  final double? height;
  final double? borderRadius, elevation;
  final double? fontSize;
  final IconData? iconData;
  final Color? textColor, bgColor;
  const PrimaryButton(
      {Key? key,
      required this.onTap,
      required this.text,
      this.width,
      this.height,
      this.elevation = 5,
      this.borderRadius,
      this.fontSize,
      required this.textColor,
      required this.bgColor,
      this.iconData})
      : super(key: key);

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final Tween<double> _tween = Tween<double>(begin: 1.0, end: 0.95);
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextTheme textTheme = theme.textTheme;
    ColorProvider colorProvider = ColorProvider();
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            _controller.forward().then((_) {
              _controller.reverse();
            });
            widget.onTap();
          },
          child: ScaleTransition(
            scale: _tween.animate(
              CurvedAnimation(
                parent: _controller,
                curve: Curves.easeOut,
                reverseCurve: Curves.easeIn,
              ),
            ),
            child: Card(
              elevation: widget.elevation ?? 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius!),
              ),
              child: Container(
                height: widget.height ?? 55,
                alignment: Alignment.center,
                width: widget.width ?? double.maxFinite,
                decoration: BoxDecoration(
                  color: widget.bgColor,
                  borderRadius: BorderRadius.circular(widget.borderRadius!),
                ),
                child: state.isLoading
                    ? AppLottie.loadingWhite.asLottieAssets(
                        width: 40.w,
                        height: 40.h,
                      )
                    : Text(
                        widget.text,
                        style: textTheme.displayMedium!
                            .copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            )
                            .copyWith(
                                color: widget.textColor,
                                fontWeight: FontWeight.w500,
                                fontSize: widget.fontSize),
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class PrimaryTextButton extends StatelessWidget {
  const PrimaryTextButton(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.textStyle});
  final Function() onPressed;
  final String title;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        title,
        style: textStyle,
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  final String hintText;

  final double width, height;
  final TextEditingController controller;
  final BorderRadiusGeometry borderRadius;
  const PasswordTextField(
      {Key? key,
      required this.hintText,
      required this.height,
      required this.controller,
      required this.width,
      required this.borderRadius})
      : super(key: key);
  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = false;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextTheme textTheme = theme.textTheme;
    ColorProvider colorProvider = ColorProvider();
    InputBorder enabledBorder = InputBorder.none;
    InputBorder focusedErrorBorder = InputBorder.none;
    InputBorder errorBorder = InputBorder.none;
    InputBorder focusedBorder = InputBorder.none;

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius,
        color: colorProvider.background,
      ),
      child: TextFormField(
          obscureText: _obscureText,
          controller: widget.controller,
          style: textTheme.displayMedium!.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: colorProvider.grey,
                size: 17,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            hintText: widget.hintText,
            hintStyle: textTheme.displayMedium!
                .copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                )
                .copyWith(
                    color: colorProvider.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            focusedBorder: focusedBorder,
            errorBorder: errorBorder,
            focusedErrorBorder: focusedErrorBorder,
          )),
    );
  }
}

class PrimaryTextFormField extends StatelessWidget {
  PrimaryTextFormField(
      {super.key,
      required this.hintText,
      this.keyboardType,
      required this.controller,
      required this.width,
      required this.height,
      this.hintTextColor,
      this.onChanged,
      this.onTapOutside,
      this.prefixIcon,
      this.prefixIconColor,
      this.inputFormatters,
      this.maxLines,
      this.borderRadius});
  final BorderRadiusGeometry? borderRadius;

  final String hintText;

  final List<TextInputFormatter>? inputFormatters;
  Widget? prefixIcon;
  Function(PointerDownEvent)? onTapOutside;
  final Function(String)? onChanged;
  final double width, height;
  TextEditingController controller;
  final Color? hintTextColor, prefixIconColor;
  final TextInputType? keyboardType;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextTheme textTheme = theme.textTheme;
    ColorProvider colorProvider = ColorProvider();
    InputBorder enabledBorder = InputBorder.none;
    InputBorder focusedErrorBorder = InputBorder.none;
    InputBorder errorBorder = InputBorder.none;
    InputBorder focusedBorder = InputBorder.none;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: borderRadius, color: colorProvider.background),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        style: textTheme.displayMedium!
            .copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            )
            .copyWith(
              color: colorProvider.grey,
            ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          filled: true,
          hintText: hintText,
          hintStyle: textTheme.displayMedium!
              .copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              )
              .copyWith(
                  color: colorProvider.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
          prefixIcon: prefixIcon,
          prefixIconColor: prefixIconColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          focusedBorder: focusedBorder,
          errorBorder: errorBorder,
          focusedErrorBorder: focusedErrorBorder,
        ),
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        onTapOutside: onTapOutside,
      ),
    );
  }
}
