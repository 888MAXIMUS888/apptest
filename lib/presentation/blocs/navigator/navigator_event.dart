part of 'navigator_bloc.dart';

abstract class NavigatorEvent extends Equatable {
  const NavigatorEvent();

  @override
  List<Object> get props => [];
}

class PushNamedEvent<T> extends NavigatorEvent {
  final T blocState;
  const PushNamedEvent(this.blocState);

  @override
  List<Object> get props => [{blocState}];
}
