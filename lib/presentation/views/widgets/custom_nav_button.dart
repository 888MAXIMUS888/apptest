import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../colors.dart';
import '../../../images.dart';
import '../../blocs/bloc/result_bloc.dart';

class CustomNavButton extends StatelessWidget {
  final String title;
  final String subTitle;

  const CustomNavButton(
      {required this.title, required this.subTitle, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          BlocProvider.of<ResultBloc>(context).add(SelectGoalEvent(title)),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 35),
        decoration: const BoxDecoration(
            color: pink, borderRadius: BorderRadius.all(Radius.circular(20))),
        height: 131,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        title,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w400),
                        maxLines: 2,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.only(left: 18),
                      child: Text(
                        subTitle,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                        maxLines: 2,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Center(
                child: Container(
                    padding: const EdgeInsets.only(right: 15),
                    child: SvgPicture.asset(Images.blackRow)))
          ],
        ),
      ),
    );
  }
}
