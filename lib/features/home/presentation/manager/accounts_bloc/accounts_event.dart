import 'package:equatable/equatable.dart';

abstract class AccountsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetAccountsData extends AccountsEvent {}
