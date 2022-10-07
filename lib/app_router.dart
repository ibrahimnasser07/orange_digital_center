import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_digital_center/database/note_model.dart';
import 'package:orange_digital_center/presentation/home_page.dart';
import 'package:orange_digital_center/presentation/home_screens/add_edit_note.dart';
import 'package:orange_digital_center/presentation/home_screens/events_screen.dart';
import 'package:orange_digital_center/presentation/home_screens/finals_screen.dart';
import 'package:orange_digital_center/presentation/home_screens/lectures_screen.dart';
import 'package:orange_digital_center/presentation/home_screens/midterms_screen.dart';
import 'package:orange_digital_center/presentation/home_screens/notes_screen.dart';
import 'package:orange_digital_center/presentation/home_screens/sections_screen.dart';
import 'package:orange_digital_center/presentation/landing_screen.dart';
import 'package:orange_digital_center/presentation/login_screen.dart';
import 'package:orange_digital_center/presentation/news_page.dart';
import 'package:orange_digital_center/presentation/register_screen.dart';
import 'package:orange_digital_center/presentation/settings_page.dart';
import 'package:orange_digital_center/presentation/settings_screens/faq_screen.dart';
import 'package:orange_digital_center/presentation/splash_screen.dart';

import 'cubit/notes_cubit.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "splashPage":
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case "loginPage":
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case "landingScreen":
        return MaterialPageRoute(builder: (_) => const LandingScreen());
      case "homePage":
        return MaterialPageRoute(builder: (_) => const HomePage());
      case "newsPage":
        return MaterialPageRoute(builder: (_) => const NewsPage());
      case "settingsPage":
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      case "registerPage":
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case "lecturesScreen":
        return MaterialPageRoute(builder: (_) => const LecturesScreen());
      case "sectionsScreen":
        return MaterialPageRoute(builder: (_) => const SectionsScreen());
      case "midtermsScreen":
        return MaterialPageRoute(builder: (_) => MidtermsScreen());
      case "finalsScreen":
        return MaterialPageRoute(builder: (_) => const FinalsScreen());
      case "eventsScreen":
        return MaterialPageRoute(builder: (_) => const EventsScreen());
      case "faqScreen":
        return MaterialPageRoute(builder: (_) => const FAQScreen());
      case "notesScreen":
        return MaterialPageRoute(
          builder: (_) => const NotesScreen(),
        );
      case "addOrEditNotes":
        return MaterialPageRoute(
          builder: (_) =>
              AddOrEditNotes(noteHive: settings.arguments as NoteHive?),
        );
      default:
        return null;
    }
  }
}
