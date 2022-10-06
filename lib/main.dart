import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:orange_digital_center/cubit/notes_cubit.dart';
import 'package:sizer/sizer.dart';

import 'app_router.dart';
import 'database/note_model.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteHiveAdapter());
  runApp(
    BlocProvider(
      create: (context) => NotesCubit(),
      child: const MyApp(),
    ),
  );
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
          child: MaterialApp(
            title: 'Orange Digital Center',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
            ),
            initialRoute: "splashPage",
            onGenerateRoute: AppRouter.generateRoute,
          ),
        );
      },
    );
  }
}
