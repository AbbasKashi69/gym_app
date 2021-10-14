part of 'find_by_id_in_form_other_sports_bloc.dart';

@immutable
abstract class FindByIdInFormOtherSportsEvent {}

class FindByIdInFormOtherSportsLoadingEvent
    extends FindByIdInFormOtherSportsEvent {
  final int id;
  FindByIdInFormOtherSportsLoadingEvent({required this.id});
}
