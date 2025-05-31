import 'package:desktop_window/desktop_window.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:universal_platform/universal_platform.dart';

import 'src/configs/configs.dart';
import 'src/core/core.dart';
import 'src/utils/utils.dart';
// import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  if (UniversalPlatform.isLinux || UniversalPlatform.isWindows) {
    await DesktopWindow.setWindowSize(Size(1366, 1024));
  }

  // windowManager.ensureInitialized().then((_) {
  //   WindowOptions windowOptions = const WindowOptions(fullScreen: true);
  //   windowManager
  //       .waitUntilReadyToShow(windowOptions, () async {
  //         await windowManager.show();
  //         await windowManager.focus();
  //       })
  //       .then((_) {

  //       });
  // });

  Bloc.observer = TalkerBlocObserver(talker: sl<LoggerService>().talker);

  runApp(
    EasyLocalization(
      path: AppLocale.path,
      supportedLocales: AppLocale.supportedLocaleList,
      startLocale: AppLocale.startLocale,
      fallbackLocale: AppLocale.fallbackLocale,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1366, 1024),
      builder: (context, _) => MaterialApp.router(
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRoutes.router,
        theme: ThemeData(textTheme: CustomTheme().buildTextTheme()),
      ),
    );
  }
}
