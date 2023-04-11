import 'package:apptest/images.dart';
import 'package:apptest/presentation/views/widgets/main_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../generated/l10n.dart';
import '../blocs/result/result_bloc.dart';

class ResultView extends StatefulWidget {
  const ResultView({super.key});

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  @override
  void initState() {
    BlocProvider.of<ResultBloc>(context).add(const ShowResultEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      backgroundImage: Images.choiceBackground,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              S.of(context).youChose,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<ResultBloc, ResultState>(builder: (context, state) {
            if (state is ShowResultState) {
              return Column(
                children: [
                  Text(state.goal,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w400)),
                  Text(state.date.toString(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w400))
                ],
              );
            } else {
              return const SizedBox();
            }
          })
        ],
      ),
    );
  }
}
