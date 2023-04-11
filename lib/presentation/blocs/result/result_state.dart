part of 'result_bloc.dart';

abstract class ResultState extends Equatable {
  const ResultState();

  @override
  List<Object> get props => [];
}

class ResultInitial extends ResultState {}

class GoalSavedState extends ResultState {
  const GoalSavedState();
}

class DateSavedState extends ResultState {
  const DateSavedState();
}

class ShowResultState extends ResultState {
  final String goal;
  final int date;
  const ShowResultState(this.goal, this.date);

  @override
  List<Object> get props => [goal, date];
}
