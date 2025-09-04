import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:taskati_ui/core/utils/colors.dart';
import 'package:taskati_ui/core/utils/text_styles.dart';
import 'package:taskati_ui/core/widgets/custom_text_field_no2.dart';
import 'package:taskati_ui/core/widgets/main_button.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Task',
          style: TextStyles.titleStyle(color: AppColors.primaryColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title', style: TextStyles.bodyStyle()),
            CustomTextField2(hint: 'Enter Title'),
            Gap(10),
            Text('Description', style: TextStyles.bodyStyle()),
            CustomTextField2(hint: 'Enter Description', maxlines: 3),
            Gap(10),
            Text('Date', style: TextStyles.bodyStyle()),
            CustomTextField2(
              hint: '2025-05-17',
              suffix: Icon(Icons.calendar_month),
            ),
            Gap(10),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Start Time', style: TextStyles.bodyStyle()),
                      CustomTextField2(
                        hint: '09:08 PM',
                        suffix: Icon(Icons.access_time),
                      ),
                    ],
                  ),
                ),
                Gap(10),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('End Time', style: TextStyles.bodyStyle()),
                      CustomTextField2(
                        hint: '09:08 PM',
                        suffix: Icon(Icons.access_time),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Gap(10),
            Text('Color', style: TextStyles.bodyStyle()),
            Gap(10),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  child: Icon(Icons.check, color: AppColors.whiteColor),
                ),
                Gap(10),
                CircleAvatar(backgroundColor: AppColors.orangeColor),
                Gap(10),
                CircleAvatar(backgroundColor: AppColors.redcolor),
              ],
            ),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: MainButton(text: 'Create Task', onPressed: (){}),
      ),
    );
  }
}
