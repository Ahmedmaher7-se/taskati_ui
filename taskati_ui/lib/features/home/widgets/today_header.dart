import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati_ui/core/functions/navigation.dart';
import 'package:taskati_ui/core/utils/text_styles.dart';
import 'package:taskati_ui/core/widgets/main_button.dart';
import 'package:taskati_ui/features/addtask/add_task.dart';

class TodayHeader extends StatelessWidget {
  const TodayHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: TextStyles.titleStyle(),
              ),
              Text('Today', style: TextStyles.titleStyle()),
            ],
          ),
        ),
        MainButton(
          width: 140,
          height: 40,
          text: '+ Add Task',
          onPressed: () {
            pushTo(context, AddEditTaskScreen());
          },
        ),
      ],
    );
  }
}