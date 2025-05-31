import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmb/src/models/models.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/core.dart';
import '../../../utils/utils.dart';
import '../../base/bloc/base_bloc.dart';
import '../../pages.dart';
import '../bloc/installation_wizard_bloc.dart';
import '../usecase/installation_wizard_usecase.dart';

class InstallationWizardPage extends StatelessWidget {
  static const String route = "/installation-wizard";
  const InstallationWizardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InstallationWizardBloc(
        sl<InstallationWizardUsecase>(),
      ),
      child: BlocListener<InstallationWizardBloc, InstallationWizardState>(
        listener: (context, state) {
          if (state.viewStatus == ViewStatus.success) {
            context.read<BaseBloc>().changeTopLeft(state.serialNumber);
            context.pushReplacement(LoginPage.route);
          }
        },
        child: BlocBuilder<InstallationWizardBloc, InstallationWizardState>(
          builder: (context, state) {
            return Material(
              child: Container(
                color: ColorAssets.chineseBlack,
                child: Center(
                  child: Container(
                    width: 620.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Padding(
                      padding: REdgeInsets.all(32),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          buildHeadContent(context),
            
                          state.viewStatus == ViewStatus.enabled
                              ? buildLoadingContent(state)
                              : buildSerialNumberContent(state, context),
            
                          Text(
                            "${LocaleKeys.version.tr()} ${state.version}",
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  fontFamily: GoogleFonts.sora().fontFamily,
                                  color: Colors.black,
                                  height: 1,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Padding buildSerialNumberContent(
    InstallationWizardState state,
    BuildContext context,
  ) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 56),
      child: SizedBox(
        child: Padding(
          padding: REdgeInsets.symmetric(vertical: 32, horizontal: 24),
          child: Column(
            children: [
              Text(
                LocaleKeys.yourSerialNumber.tr(),
                style: TextStyle(
                  fontSize: 19.sp,
                  color: ColorAssets.chineseBlack,
                ),
              ),
              Padding(
                padding: REdgeInsets.symmetric(vertical: 12),
                child: buildSerialNumberBox(state, context),
              ),
              if (state.viewStatus == ViewStatus.disabled)
                Text(
                  LocaleKeys.waitingForActivation.tr(),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    height: 1,
                    letterSpacing: 1,
                    color: ColorAssets.blueCrayola,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildSerialNumberBox(
    InstallationWizardState state,
    BuildContext context,
  ) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: ColorAssets.lotion,
        border: BoxBorder.all(color: ColorAssets.lightSilver),
      ),
      child: Padding(
        padding: REdgeInsets.symmetric(vertical: 13.5),
        child: Center(
          child: Text(
            state.serialNumber,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              height: 1,
              letterSpacing: 0.015,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLoadingContent(InstallationWizardState state) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 103),
      child: Column(
        children: [
          LinearProgressIndicator(
            value: state.progress,
            borderRadius: BorderRadius.circular(4.r),
            minHeight: 12,
            backgroundColor: ColorAssets.lightSilver,
            color: ColorAssets.blueCrayola,
          ),
          20.verticalSpace,
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.pleaseWait.tr(),
                style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                LocaleKeys.weTriedToInstallYourDevice.tr(),
                style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding buildHeadContent(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 71),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(ImageAssets.riInstallFill, width: 56.r, height: 56.r),
          8.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.installationWizard.tr(),
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  height: 1,
                  fontWeight: FontWeight.bold,
                  color: ColorAssets.spaceCadet,
                ),
              ),
              Text(
                LocaleKeys.deviceMustBeRegisteredBeforeCanBeUsed.tr(),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  height: 1,
                  color: ColorAssets.blueCrayola,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
