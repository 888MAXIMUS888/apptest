part of 'result_bloc.dart';

abstract class ResultEvent extends Equatable {
  const ResultEvent();

  @override
  List<Object> get props => [];
}

class SelectGoalEvent extends ResultEvent {
  final String goal;

  const SelectGoalEvent(this.goal);

  @override
  List<Object> get props => [goal];
}

class SelectDateEvent extends ResultEvent {
  final int date;

  const SelectDateEvent(this.date);

  @override
  List<Object> get props => [date];
}

class ShowResultEvent extends ResultEvent {
  const ShowResultEvent();
}
