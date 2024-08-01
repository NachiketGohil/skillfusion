class CourseResponseModel {
  Result? result;

  CourseResponseModel({this.result});

  CourseResponseModel.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  String? skill;
  List<LearningPathway>? learningPathway;

  Result({this.skill, this.learningPathway});

  Result.fromJson(Map<String, dynamic> json) {
    skill = json['skill'];
    if (json['learning_pathway'] != null) {
      learningPathway = <LearningPathway>[];
      json['learning_pathway'].forEach((v) {
        learningPathway!.add(LearningPathway.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['skill'] = this.skill;
    if (this.learningPathway != null) {
      data['learning_pathway'] =
          this.learningPathway!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LearningPathway {
  String? chapterTitle;
  String? shortExplanation;

  LearningPathway({this.chapterTitle, this.shortExplanation});

  LearningPathway.fromJson(Map<String, dynamic> json) {
    chapterTitle = json['chapter_title'];
    shortExplanation = json['short_explanation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chapter_title'] = this.chapterTitle;
    data['short_explanation'] = this.shortExplanation;
    return data;
  }
}
