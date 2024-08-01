import 'package:flutter/material.dart';
import 'package:sf/api/models/course_response_model.dart';

class PathwaysPage extends StatefulWidget {
  const PathwaysPage({
    super.key,
    required this.courseResponseModel,
  });

  final CourseResponseModel courseResponseModel;

  @override
  State<PathwaysPage> createState() => _PathwaysPageState();
}

class _PathwaysPageState extends State<PathwaysPage> {
  @override
  Widget build(BuildContext context) {
    final pathways = widget.courseResponseModel.result?.learningPathway;
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
            Text("Skill Title: ${widget.courseResponseModel.result?.skill}"),
            const SizedBox(height: 20),

            ///
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: pathways?.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final chapter = pathways?[index];

                  if (pathways?.length != 0) {
                    /// widgett
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
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
                            child: Text(chapter!.chapterTitle ?? ""),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(20),
                            child: Text(chapter.shortExplanation ?? ""),
                          ),
                        ],
                      ),
                    );
                  } else {
                    /// 0
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.green[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text("No Pathways assigned"),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
