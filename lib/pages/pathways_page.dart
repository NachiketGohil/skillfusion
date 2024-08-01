import 'package:flutter/material.dart';

class PathwaysPage extends StatefulWidget {
  const PathwaysPage({super.key});

  @override
  State<PathwaysPage> createState() => _PathwaysPageState();
}

class _PathwaysPageState extends State<PathwaysPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 10,
        toolbarHeight: 50,
        automaticallyImplyLeading: true,
        title: const Text(
          "Personalised Learning Pathways",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text("Skill Title"),
            const SizedBox(height: 20),

            ///
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: learning.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.green[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.green[600],
                          ),
                          child: Text(learning[index]["chapter_title"]),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(20),
                          child: Text(learning[index]["short_explanation"]),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List learning = [
  {
    "chapter_title": "Introduction to Employment Law",
    "short_explanation":
        "This chapter provides a foundational understanding of employment law. It covers the definition of employment law, its purpose, and its importance in the workplace. It delves into the historical development of labor laws and their impact on modern employment practices. Key legislation like the Fair Labor Standards Act (FLSA), Title VII of the Civil Rights Act, the Americans with Disabilities Act (ADA), and the Family and Medical Leave Act (FMLA) are introduced, laying the groundwork for understanding employee rights and employer obligations."
  },
  {
    "chapter_title": "Recruitment and Hiring Legally",
    "short_explanation":
        "This chapter focuses on the legal aspects of the recruitment and hiring process. It covers topics like crafting legal job advertisements, understanding permissible interview questions, and conducting background checks in compliance with privacy laws. The chapter explains the concept of 'at-will' employment versus contractual employment and highlights the legal implications of each. It also delves into affirmative action and equal employment opportunity principles, ensuring a diverse and inclusive workforce."
  },
  {
    "chapter_title": "Wage and Hour Laws",
    "short_explanation":
        "This chapter provides a detailed look at federal and state wage and hour laws. It examines minimum wage requirements, overtime pay provisions, and rules governing breaks and rest periods. The chapter clarifies exemptions from overtime pay, such as those for administrative, executive, and professional employees. It also discusses record-keeping requirements for employers to ensure accurate tracking of employee hours and compensation, a crucial aspect of legal compliance."
  },
  {
    "chapter_title": "Workplace Safety and Health",
    "short_explanation":
        "This chapter focuses on the legal framework surrounding workplace safety and health. It introduces the Occupational Safety and Health Act (OSHA) and its role in ensuring safe and healthful working conditions. The chapter covers employers' responsibilities in providing a safe work environment, including hazard identification, employee training on safety procedures, and maintaining proper safety equipment. It also explains employees' rights regarding workplace safety and the process for reporting safety concerns."
  },
  {
    "chapter_title": "Employee Benefits and Leave",
    "short_explanation":
        " This chapter covers the legal requirements and best practices surrounding employee benefits and leave. It delves into the intricacies of the Family and Medical Leave Act (FMLA), outlining eligible reasons for leave, duration of leave, and job protection upon return. The chapter also explores other federal laws impacting employee benefits, such as the Consolidated Omnibus Budget Reconciliation Act (COBRA), which provides continuation of health coverage, and the Health Insurance Portability and Accountability Act (HIPAA), which protects the privacy of employee health information."
  }
];
