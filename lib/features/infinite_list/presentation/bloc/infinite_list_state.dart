part of 'infinite_list_bloc.dart';

abstract class InfiniteListState extends Equatable {
  const InfiniteListState();  

  @override
  List<Object> get props => [];
}
class InfiniteListInitial extends InfiniteListState {}
