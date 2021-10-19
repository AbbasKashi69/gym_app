part of 'get_transfer_other_wallet_bloc.dart';

@immutable
abstract class GetTransferToOthersWalletsEvent {}

class GetTransferToOthersWalletsLoadingEvent extends GetTransferToOthersWalletsEvent {
  final int? pageSize;
  final int? pageNumber;

  GetTransferToOthersWalletsLoadingEvent({this.pageSize, this.pageNumber});


}

class GetTransferToOthersWalletsLoadedEvent extends GetTransferToOthersWalletsEvent {
  final int? pageSize;
  final int? pageNumber;

  GetTransferToOthersWalletsLoadedEvent(this.pageSize, this.pageNumber);

}
