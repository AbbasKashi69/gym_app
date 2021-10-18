part of 'get_transfer_to_card_bank_bloc.dart';

@immutable
abstract class GetTransferToCardBankEvent {}

class GetTransferToCardBankLoadingEvent extends GetTransferToCardBankEvent {
  final int? pageSize;
  final int? pageNumber;

  GetTransferToCardBankLoadingEvent({this.pageSize, this.pageNumber});


}

class GetTransferToCardBankLoadedEvent extends GetTransferToCardBankEvent {
  final int? pageSize;
  final int? pageNumber;

  GetTransferToCardBankLoadedEvent(this.pageSize, this.pageNumber);

}
