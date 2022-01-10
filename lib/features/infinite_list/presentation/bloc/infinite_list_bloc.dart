import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'infinite_list_event.dart';
part 'infinite_list_state.dart';

class InfiniteListBloc extends Bloc<InfiniteListEvent, InfiniteListState> {
  InfiniteListBloc() : super(InfiniteListInitial()) {
    on<InfiniteListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
