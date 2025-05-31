import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/utils.dart';
import '../bloc/base_bloc.dart';

class BasePage extends StatelessWidget {
  static const String route = "/";
  final Widget child;
  const BasePage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BaseBloc(),
      child: BlocBuilder<BaseBloc, BaseState>(
        builder: (context, state) {
          return Material(
            child: Container(
              color: ColorAssets.chineseBlack,
              child: Column(
                children: [
                  buildHeader(state),
                  Expanded(child: child),
                  buildFooter(state),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Container buildFooter(BaseState state) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      child: Padding(
        padding: REdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          children: [
            Row(
              children: [
                Text(
                  LocaleKeys.ping.tr(),
                  style: TextStyle(color: Colors.white, fontSize: 13.sp),
                ),
                8.horizontalSpace,
                Text(
                  state.ping.toString(),
                  style: TextStyle(color: ColorAssets.beer, fontSize: 13.sp),
                ),
              ],
            ),
            24.horizontalSpace,
            Row(
              children: [
                Text(
                  LocaleKeys.serialNumber.tr(),
                  style: TextStyle(color: Colors.white, fontSize: 13.sp),
                ),
                8.horizontalSpace,
                Text(
                  state.serialNumber.toString(),
                  style: TextStyle(color: ColorAssets.beer, fontSize: 13.sp),
                ),
              ],
            ),
            24.horizontalSpace,
            Row(
              children: [
                Text(
                  LocaleKeys.connexNode.tr(),
                  style: TextStyle(color: Colors.white, fontSize: 13.sp),
                ),
                8.horizontalSpace,
                Text(
                  state.connexNode.toString(),
                  style: TextStyle(color: ColorAssets.beer, fontSize: 13.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildHeader(BaseState state) {
    return Container(
      width: double.infinity,
      color: ColorAssets.eerieBlack,
      height: 56.h,
      child: Padding(
        padding: REdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (state.topLeft.isNotEmpty)
              Text(
                state.topLeft,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            Row(
              children: [
                Icon(
                  !state.signalStatus
                      ? Icons.signal_cellular_off
                      : _signalIcons(state.signal),
                  color: Colors.white,
                  size: 16.sp,
                ),
                4.horizontalSpace,

                Icon(
                  !state.wifiStatus ? Icons.wifi_off : _wifiIcons(state.wifi),
                  color: Colors.white,
                  size: 16.sp,
                ),
                4.horizontalSpace,
                Row(
                  children: [
                    Text(
                      '${state.batteryLevel}%',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    4.horizontalSpace,
                    Icon(
                      !state.batteryStatus
                          ? Icons.battery_unknown
                          : _batteryIcons(state.batteryLevel),
                      color: Colors.white,
                      size: 16.sp,
                    ),
                  ],
                ),

                12.horizontalSpace,
                Text(
                  state.time,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                
                ?state.topRight,
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _signalIcons(int strength) {
    if (strength > 75) {
      return Icons.signal_cellular_alt;
    } else if (strength > 50) {
      return Icons.signal_cellular_alt_2_bar;
    } else if (strength > 25) {
      return Icons.signal_cellular_alt_1_bar;
    } else if (strength > 0) {
      return Icons.signal_cellular_null;
    } else {
      return Icons.signal_cellular_null;
    }
  }

  IconData _batteryIcons(int batteryLevel) {
    if (batteryLevel > 90) {
      return Icons.battery_full;
    } else if (batteryLevel > 70) {
      return Icons.battery_6_bar;
    } else if (batteryLevel > 50) {
      return Icons.battery_5_bar;
    } else if (batteryLevel > 30) {
      return Icons.battery_4_bar;
    } else if (batteryLevel > 20) {
      return Icons.battery_3_bar;
    } else if (batteryLevel > 10) {
      return Icons.battery_2_bar;
    } else if (batteryLevel > 0) {
      return Icons.battery_1_bar;
    } else {
      return Icons.battery_0_bar;
    }
  }

  IconData? _wifiIcons(int wifi) {
    if (wifi > 75) {
      return Icons.wifi;
    } else if (wifi > 50) {
      return Icons.wifi_2_bar;
    } else if (wifi > 25) {
      return Icons.wifi_1_bar;
    } else if (wifi > 0) {
      return Icons.wifi_off;
    } else {
      return Icons.wifi_off;
    }
  }
}
