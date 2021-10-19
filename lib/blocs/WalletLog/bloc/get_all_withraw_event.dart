part of 'get_all_withraw_bloc.dart';

@immutable
abstract class GetAllWithdrawalEvent {}

class GetAllWithdrawalLoadingEvent extends GetAllWithdrawalEvent {
  final int? pageSize;
  final int? pageNumber;

  GetAllWithdrawalLoadingEvent({this.pageSize, this.pageNumber});


}

class GetAllWithdrawalLoadedEvent extends GetAllWithdrawalEvent {
  final int? pageSize;
  final int? pageNumber;

  GetAllWithdrawalLoadedEvent(this.pageSize, this.pageNumber);

}
