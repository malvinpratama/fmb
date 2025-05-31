import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/core.dart';
import '../../../models/models.dart';
import '../../../utils/utils.dart';
import '../../pages.dart';
import '../bloc/login_bloc.dart';
import '../usecase/login_usecase.dart';

class LoginPage extends StatelessWidget {
  static const String route = "/login";
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(sl<LoginUsecase>()),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<LoginBloc>(context);
          return BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state.viewStatusButton == ViewStatus.success) {
                context.pushReplacement(
                  WelcomeBackPage.route,

                  extra: state.userDevice,
                );
              }
            },
            child: Material(
              child: Container(
                color: Colors.black,
                child: Center(
                  child: Padding(
                    padding: REdgeInsets.symmetric(horizontal: 458),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Padding(
                        padding: REdgeInsets.all(32),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            buildTitle(context),
                            16.verticalSpace,
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                24.verticalSpace,
                                buildForm(bloc, state),
                                8.verticalSpace,
                                state.errorMessage.isNotEmpty
                                    ? Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            state.errorMessage,
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: ColorAssets.vividRed,
                                            ),
                                          ),
                                          68.verticalSpace,
                                        ],
                                      )
                                    : 14.verticalSpace,
                                buildButton(bloc, state),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  SizedBox buildButton(LoginBloc bloc, LoginState state) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (state.viewStatusButton == ViewStatus.enabled) {
            bloc.onSubmit();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: state.viewStatusButton == ViewStatus.enabled
              ? ColorAssets.blueCrayola
              : ColorAssets.metallicSilver,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        child: Padding(
          padding: REdgeInsets.symmetric(vertical: 16),
          child: state.viewStatusButton == ViewStatus.loading
              ? SizedBox(
                  width: 18.r,
                  height: 18.r,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : Text(
                  LocaleKeys.submit.tr(),
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }

  Column buildForm(LoginBloc bloc, LoginState state) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          LocaleKeys.enterYourNIK.tr(),
          style: TextStyle(fontSize: 20.sp, color: ColorAssets.metallicSilver),
        ),
        Padding(
          padding: REdgeInsets.symmetric(vertical: 18),
          child: TextFormField(
            focusNode: state.focusNode,
            style: TextStyle(
              fontSize: 18.sp,
              height: 0.2,
              letterSpacing: 0.015,
              color: Colors.black,
            ),
            onChanged: bloc.onChangeNik,
            cursorHeight: 18.sp,
            decoration: InputDecoration(
              fillColor: ColorAssets.lotion,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(4.r),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: ColorAssets.lightSilver),
                borderRadius: BorderRadius.circular(4.r),
              ),
              hintText: LocaleKeys.enterNIK.tr(),
              hintStyle: TextStyle(
                fontSize: 18.sp,
                height: 0.2,
                letterSpacing: 0.015,
                color: ColorAssets.graniteGray,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Text buildTitle(BuildContext context) {
    return Text(
      LocaleKeys.loginByCode.tr(),
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
        height: 1,
        color: ColorAssets.spaceCadet,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
