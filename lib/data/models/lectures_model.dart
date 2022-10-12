class LectureModel {
  int? id;
  String? lectureSubject;
  String? lectureDate;
  String? lectureStartTime;
  String? lectureEndTime;

  LectureModel({
    this.id,
    this.lectureSubject,
    this.lectureDate,
    this.lectureStartTime,
    this.lectureEndTime,
  });

  LectureModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lectureSubject = json['lectureSubject'];
    lectureDate = json['lectureDate'];
    lectureStartTime = json['lectureStartTime'];
    lectureEndTime = json['lectureEndTime'];
  }
}
