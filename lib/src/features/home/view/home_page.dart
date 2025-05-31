import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmb/src/features/home/bloc/home_bloc.dart';
import 'package:fmb/src/utils/utils.dart';
import 'package:latlong2/latlong.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class HomePage extends StatelessWidget {
  static const String route = "/home";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Material(
            child: SizedBox(
              child: Stack(
                children: [
                  FlutterMap(
                    mapController: MapController(),
                    options: MapOptions(
                      initialCenter: LatLng(
                        state.initLocation?.latitude ?? 0,
                        state.initLocation?.longitude ?? 0,
                      ),
                      initialZoom: 20,
                      minZoom: 20,
                      maxZoom: 20,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName:
                            'dev.fleaflet.flutter_map.example',
                        tileProvider: CancellableNetworkTileProvider(),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Padding(
                              padding: REdgeInsets.only(left: 23.w),
                              child: Column(
                                spacing: 8.r,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  buildSpeed(context, state),
                                  buildAchievement(context),
                                  28.verticalSpace,
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      buildFooter(),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  SizedBox buildAchievement(BuildContext context) {
    return SizedBox(
                                  height: 80.h,
                                  width: 272.w,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          color: ColorAssets.eerieBlack,
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Symbols.target,
                                                  size: 36.sp,
                                                  color: Colors.white,
                                                ),
                                                4.verticalSpace,
                                                Text(
                                                  "Achievement",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(
                                                        color: Colors.white,
                                                        height: 1,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          color: ColorAssets.eerieBlack
                                              .withValues(alpha: 0.5),
                                          child: Padding(
                                            padding: REdgeInsets.symmetric(
                                              vertical: 14,
                                            ),
                                            child: Column(
                                              spacing: 8.r,
                                              children: [
                                                Text(
                                                  "100/50 Ton",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.copyWith(
                                                        color: Colors.white,
                                                        height: 1,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                Stack(
                                                  children: [
                                                    SizedBox(
                                                      height: 24.h,
                                                      child:
                                                          LinearProgressIndicator(
                                                            value: 0.5,
                                                            color: ColorAssets
                                                                .blueCrayola,
                                                            backgroundColor:
                                                                ColorAssets
                                                                    .eerieBlack,
                                                          ),
                                                    ),
                                                    Center(
                                                      child: Text(
                                                        '50%',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 13.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
  }

  SizedBox buildSpeed(BuildContext context, HomeState state) {
    return SizedBox(
      height: 80.h,
      width: 272.w,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: ColorAssets.eerieBlack,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.speed_rounded, size: 36.sp, color: Colors.white),
                    4.verticalSpace,
                    Text(
                      "Speed",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                        height: 1,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: ColorAssets.maximumRed,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.speed.toString(),
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            color: Colors.white,
                            height: 1,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    4.verticalSpace,
                    Text(
                      "km/h",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                        height: 1,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    color: ColorAssets.maximumRed,
                    child: Column(
                      children: [
                        Text(
                          'MAX',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '70',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    color: ColorAssets.blueCrayola,
                    child: Column(
                      children: [
                        Text(
                          'MIN',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '36',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildFooter() {
    return Container(
      height: 65.h,
      color: ColorAssets.eerieBlack.withValues(alpha: 0.4),
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: buildEmergencyButton(LocaleKeys.emergency.tr(), null),
            ),
            Flexible(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: buildEmergencyButton(LocaleKeys.breakDown.tr(), null),
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: 16.r,
                children: [
                  IconButton(
                    color: Colors.white,
                    iconSize: 32.sp,
                    onPressed: () {},
                    icon: Icon(Icons.settings),
                  ),
                  IconButton(
                    color: Colors.white,
                    iconSize: 32.sp,
                    onPressed: () {},
                    icon: Icon(Icons.insert_chart_outlined_sharp),
                  ),
                  IconButton(
                    color: Colors.white,
                    iconSize: 32.sp,
                    onPressed: () {},
                    icon: Icon(Icons.email_outlined),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      color: ColorAssets.blueCrayola,
                      child: Padding(
                        padding: REdgeInsets.all(16),
                        child: Icon(
                          Icons.view_module,
                          color: Colors.white,
                          size: 32.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEmergencyButton(String title, Function()? onTap) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: onTap,
        child: Container(
          color: ColorAssets.red,
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 16.5, vertical: 16),
            child: Text(
              title,
              style: TextStyle(fontSize: 21.sp, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
