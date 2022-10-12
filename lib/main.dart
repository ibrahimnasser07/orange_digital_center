import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:orange_digital_center/business_logic/auth/login/login_cubit.dart';
import 'package:orange_digital_center/business_logic/auth/register/register_cubit.dart';
import 'package:orange_digital_center/business_logic/lectures_cubit/lectures_cubit.dart';
import 'package:orange_digital_center/business_logic/news_cubit/news_cubit.dart';
import 'package:sizer/sizer.dart';

import 'app_router.dart';
import 'bloc_observer.dart';
import 'business_logic/notes_cubit/notes_cubit.dart';
import 'data/database/note_model.dart';
import 'data/remote/dio_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await DioHelper.init();
  Hive.registerAdapter(NoteHiveAdapter());
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (
        BuildContext context,
        Orientation orientation,
        DeviceType deviceType,
      ) {
        return CalendarControllerProvider(
          controller: EventController(),
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => NotesCubit()),
              BlocProvider(create: (context) => LoginCubit()),
              BlocProvider(create: (context) => RegisterCubit()),
              BlocProvider(create: (context) => LecturesCubit()),
              BlocProvider(create: (context) => NewsCubit()),
            ],
            child: MaterialApp(
              title: 'Orange Digital Center',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.deepOrange,
              ),
              initialRoute: "splashPage",
              onGenerateRoute: AppRouter.generateRoute,
            ),
          ),
        );
      },
    );
  }
}
