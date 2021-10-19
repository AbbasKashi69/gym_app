part of 'get_all_deposit_bloc.dart';

@immutable
abstract class GetAllDepositEvent {}

class GetAllDepositLoadingEvent extends GetAllDepositEvent {
  final int? pageSize;
  final int? pageNumber;

  GetAllDepositLoadingEvent({this.pageSize, this.pageNumber});


}

class GetAllDepositLoadedEvent extends GetAllDepositEvent {
  final int? pageSize;
  final int? pageNumber;

  GetAllDepositLoadedEvent(this.pageSize, this.pageNumber);

}
