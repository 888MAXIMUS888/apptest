import 'package:apptest/presentation/views/widgets/custom_nav_button.dart';
import 'package:apptest/presentation/views/widgets/main_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_routes.dart';
import '../../generated/l10n.dart';
import '../../images.dart';
import '../blocs/bloc/result_bloc.dart';

class ChoiceView extends StatefulWidget {
  const ChoiceView({super.key});

  @override
  State<ChoiceView> createState() => _ChoiceViewState();
}

class _ChoiceViewState extends State<ChoiceView> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ResultBloc, ResultState>(
      listener: (context, state) {
        if (state is GoalSavedState) {
          Navigator.of(context).pushNamed(AppRoutes.DATE_OF_BIRTH_VIEW);
        }
      },
      child: MainScaffold(
        backgroundImage: Images.choiceBackground,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomNavButton(
              title: S.of(context).trackMyPeriod,
              subTitle: S.of(context).contraceptionAndWellbeing,
            ),
            const SizedBox(height: 73),
            CustomNavButton(
              title: S.of(context).getPregnant,
              subTitle: S.of(context).learnAboutReproductiveHealth,
            ),
          ],
        ),
      ),
    );
  }
}
