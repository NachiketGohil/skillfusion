import 'package:flutter/material.dart';
import 'package:sf/core/app_routes.dart';

class SkillFusionHome extends StatefulWidget {
  const SkillFusionHome({super.key});

  @override
  State<SkillFusionHome> createState() => _SkillFusionHomeState();
}

class _SkillFusionHomeState extends State<SkillFusionHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[100],
        elevation: 10,
        toolbarHeight: 80,
        leadingWidth: 200,
        leading: Container(
          height: 80,
          width: 200,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text("SkillFusion Logo"),
        ),
        title: Row(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.resume);
                print("Navigating to Resume");
              },
              child: const Text("Add Resume"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.compatibility);
                print("Navigating to Compatibility");
              },
              child: const Text("Compatibility Check"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.upskill);
                print("Navigating to Upskill");
              },
              child: const Text("Upskill"),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text("Welcome to Your Personalized Learning Journey"),
      ),
    );
  }
}
