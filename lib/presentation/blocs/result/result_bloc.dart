import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'result_event.dart';
part 'result_state.dart';

class ResultBloc extends Bloc<ResultEvent, ResultState> {
  ResultBloc() : super(ResultInitial()) {
    late String goal;
    late int date;

    on<ResultEvent>((event, emit) {
      if (event is SelectGoalEvent) {
        goal = event.goal;
        emit(const GoalSavedState());
      } else if (event is SelectDateEvent) {
        date = event.date;
        emit(const DateSavedState());
      } else if (event is ShowResultEvent) {
        emit(ShowResultState(goal, date));
      }
    });
  }
}
