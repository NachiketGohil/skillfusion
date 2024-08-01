import 'package:flutter/material.dart';
import 'package:sf/pages/compatibility_page.dart';
import 'package:sf/pages/dashboard_page.dart';
import 'package:sf/pages/home_page.dart';
import 'package:sf/pages/resume_page.dart';
import 'package:sf/pages/upskill_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String resume = '/resume';
  static const String compatibility = '/compatibility';
  static const String upskill = '/upskill';
  static const String pathways = '/pathways';
  static const String dashboard = '/dashboard';

  static Route generateRoute(RouteSettings routerSettings) {
    // final int userId = (routerSettings.arguments ?? 0) as int;
    switch (routerSettings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const SkillFusionHome());
      case resume:
        return MaterialPageRoute(builder: (_) => const ResumePage());
      case compatibility:
        return MaterialPageRoute(builder: (_) => const CompatibilityPage());
      case upskill:
        return MaterialPageRoute(builder: (_) => const UpskillPage());
      // case pathways:
      //   return MaterialPageRoute(builder: (_) => const PathwaysPage());
      case dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardPage());

      default:
        return errorRoute();
    }
  }

  static Route errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.blue[50],
          title: const Text("Error 404"),
          content: const Text("Some Problem Occurred...\nPlease Try Again"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
