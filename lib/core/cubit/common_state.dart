import 'package:equatable/equatable.dart';

abstract class CommonState extends Equatable {}

class CommonInitialState extends CommonState {
  @override
  List<Object?> get props => [];
}

class CommonLoadingState extends CommonState {
  @override
  List<Object?> get props => [];
}

class CommonDataFetchedState<Type> extends CommonState {
  final List<Type> item;

  CommonDataFetchedState({required this.item});

  @override
  List<Object?> get props => item;
}

class CommonErrorState extends CommonState {
  final String message;

  CommonErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
