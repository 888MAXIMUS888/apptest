import 'package:apptest/app_routes.dart';
import 'package:apptest/presentation/views/widgets/main_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:flutter_svg/svg.dart';

import '../../colors.dart';
import '../../generated/l10n.dart';
import '../../images.dart';
import '../blocs/bloc/result_bloc.dart';

class DateOfBirthView extends StatefulWidget {
  const DateOfBirthView({super.key});

  @override
  State<DateOfBirthView> createState() => _DateOfBirthViewState();
}

class _DateOfBirthViewState extends State<DateOfBirthView> {
  int _selectedDate = 2023;
  final String _dateFormat = 'yyyy';

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResultBloc, ResultState>(
      listener: (context, state) {
        if (state is DateSavedState) {
          Navigator.of(context).pushNamed(AppRoutes.RESULT_VIEW);
        }
      },
      child: MainScaffold(
          backgroundImage: Images.dateOfBirthBackground,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                S.of(context).dateOfBirthTitle,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
              Center(
                child: DatePickerWidget(
                    initialDateTime: DateTime(2023),
                    maxDateTime: DateTime.now(),
                    onChange: (date, list) => _selectedDate = date.year,
                    pickerTheme: const DateTimePickerTheme(
                        showTitle: false,
                        pickerHeight: 300,
                        itemTextStyle: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w900),
                        itemHeight: 70),
                    dateFormat: _dateFormat),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    margin: const EdgeInsets.only(bottom: 81),
                    width: 189,
                    height: 50,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: violet,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () => BlocProvider.of<ResultBloc>(context)
                            .add(SelectDateEvent(_selectedDate)),
                        child: Stack(
                          children: [
                            Center(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      S.of(context).next,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SvgPicture.asset(Images.whiteRow)
                                ],
                              ),
                            ),
                          ],
                        ))),
              )
            ],
          )),
    );
  }
}
