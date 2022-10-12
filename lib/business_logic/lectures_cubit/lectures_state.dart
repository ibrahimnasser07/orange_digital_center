part of 'lectures_cubit.dart';

@immutable
abstract class LecturesState {}

class LecturesInitial extends LecturesState {}
class LecturesLoading extends LecturesState {}
class LecturesLoaded extends LecturesState {
  final List<LectureModel> lecturesList;
  LecturesLoaded({required this.lecturesList});
}
class LecturesError extends LecturesState {}
