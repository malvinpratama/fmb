import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmb/src/features/base/bloc/base_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/core.dart';
import '../../../models/models.dart';
import '../../../utils/utils.dart';
import '../../pages.dart';
import '../bloc/welcome_back_bloc.dart';
import '../usecase/welcome_back_usecase.dart';

class WelcomeBackPage extends StatelessWidget {
  static const String route = "/welcome-back";
  const WelcomeBackPage({super.key, this.userDevice});
  final UserDevice? userDevice;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final baseBloc = context.read<BaseBloc>();
        baseBloc.changeTopRight(
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              12.horizontalSpace,
              Text(
                userDevice?.name ?? '',
                style: TextStyle(fontSize: 18.sp, color: Colors.white),
              ),
              8.horizontalSpace,
              SizedBox(
                width: 32.r,
                height: 32.r,
                child: CircleAvatar(
                  foregroundImage: userDevice?.imageUrl != null
                      ? NetworkImage(userDevice!.imageUrl)
                      : null,
                ),
              ),
            ],
          ),
        );

        return WelcomeBackBloc(userDevice, sl<WelcomeBackUsecase>());
      },
      child: BlocBuilder<WelcomeBackBloc, WelcomeBackState>(
        builder: (context, state) {
          return BlocListener<WelcomeBackBloc, WelcomeBackState>(
            listener: (context, state) {
              if (state.viewStatus == ViewStatus.success) {
                context.pushReplacement(HomePage.route);
              }
            },
            child: Material(
              child: Container(
                color: Colors.black,
                child: Center(
                  child: Padding(
                    padding: REdgeInsets.symmetric(
                      horizontal: 361,
                      vertical: 282,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          buildHeader(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildProfile(state),
                              16.horizontalSpace,
                              SizedBox(
                                width: 48.r,
                                height: 48.r,
                                child: CircularProgressIndicator(
                                  value: state.progress,
                                  color: ColorAssets.blueCrayola,
                                  backgroundColor: ColorAssets.lightSilver,
                                  strokeWidth: 8.r,
                                ),
                              ),
                            ],
                          ),
                        ],
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

  Padding buildProfile(WelcomeBackState state) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Row(
        children: [
          SizedBox(
            width: 92.r,
            height: 92.r,
            child: CircleAvatar(
              foregroundImage: state.userDevice?.imageUrl != null
                  ? NetworkImage(state.userDevice!.imageUrl)
                  : null,
            ),
          ),
          23.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.userDevice?.name ?? '',
                style: TextStyle(
                  fontFamily: GoogleFonts.roboto().fontFamily,
                  fontSize: 41.sp,
                  color: ColorAssets.chineseBlack,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                state.userDevice?.roleName ?? '',
                style: TextStyle(
                  fontFamily: GoogleFonts.roboto().fontFamily,
                  fontSize: 29.sp,
                  color: ColorAssets.spanishGray,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container buildHeader() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
        ),
        color: ColorAssets.blueCrayola,
      ),
      child: Center(
        child: Padding(
          padding: REdgeInsets.symmetric(vertical: 20),
          child: Text(
            LocaleKeys.welcomeBack.tr(),
            style: TextStyle(
              color: Colors.white,
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontSize: 41.sp,
            ),
          ),
        ),
      ),
    );
  }
}
