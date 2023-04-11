import 'package:apptest/app_routes.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/local/navigation_service.dart';
import '../../../injector.dart';
import '../result/result_bloc.dart';

part 'navigator_event.dart';
part 'navigator_state.dart';

class NavigatorBloc extends Bloc<NavigatorEvent, NavigatorState> {
  NavigatorBloc() : super(NavigatorInitial()) {
    on<NavigatorEvent>((event, emit) {
      if (event is PushNamedEvent) {
        switch (event.blocState) {
          case GoalSavedState:
            injector<NavigationService>()
                .pushNamed(AppRoutes.DATE_OF_BIRTH_VIEW);
            break;
          case DateSavedState:
            injector<NavigationService>()
                .pushNamed(AppRoutes.RESULT_VIEW);
            break;
          default:
        }
      }
    });
  }
}
