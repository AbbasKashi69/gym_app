part of 'get_resume_bloc.dart';

@immutable
abstract class GetResumeState {}

class GetResumeInitialState extends GetResumeState {}

class GetResumeLoadingState extends GetResumeState {}

class GetResumeErrorState extends GetResumeState {
  final String message;
  GetResumeErrorState({required this.message});
}

class GetResumeLoadedState extends GetResumeState {
  final ResumeVm? resumeVm;
  GetResumeLoadedState({required this.resumeVm});
}
