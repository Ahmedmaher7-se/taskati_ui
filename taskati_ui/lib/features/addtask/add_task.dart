import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati_ui/core/utils/colors.dart';
import 'package:taskati_ui/core/utils/text_styles.dart';
import 'package:taskati_ui/core/widgets/custom_text_field.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var dateController = TextEditingController(
    text: DateFormat("yyyy-MM-dd").format(DateTime.now()),
  );
  var startTimeController = TextEditingController(
    text: DateFormat("hh:mm a").format(DateTime.now()),
  );
  var endTimeController = TextEditingController(
    text: DateFormat("hh:mm a").format(DateTime.now()),
  );

  List<Color> colors = [
    AppColors.primaryColor,
    AppColors.redcolor,
    AppColors.orangeColor,
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Task')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title', style: TextStyles.bodyStyle()),
            Gap(6),
            CustomTextField(
              controller: titleController,
              hint: 'Enter Task Title',
            ),
            Gap(10),
            Text('Description', style: TextStyles.bodyStyle()),
            Gap(6),
            CustomTextField(
              controller: descriptionController,
              hint: 'Enter Task Description',
              maxLines: 3,
            ),
            Gap(10),
            dateField(),
            Gap(10),
            timeFields(),
            Gap(20),
            Row(
              spacing: 6,
              children: List.generate(3, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: colors[index],
                    child: currentIndex == index
                        ? Icon(Icons.check, color: AppColors.whiteColor)
                        : null,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Column dateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Date', style: TextStyles.bodyStyle()),
        Gap(6),
        CustomTextField(
          controller: dateController,
          readOnly: true,
          onTap: () async {
            var selectedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2050),
            );

            if (selectedDate != null) {
              dateController.text = DateFormat(
                "yyyy-MM-dd",
              ).format(selectedDate);
            }
          },
          suffixIcon: Icon(
            Icons.calendar_month_rounded,
            color: AppColors.primaryColor,
          ),
          hint: 'Enter Task Date',
        ),
      ],
    );
  }

  Row timeFields() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Start Time', style: TextStyles.bodyStyle()),
              Gap(6),
              CustomTextField(
                controller: startTimeController,
                readOnly: true,
                onTap: () async {
                  var selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (selectedTime != null) {
                    startTimeController.text = selectedTime.format(context);
                  }
                },
                suffixIcon: Icon(
                  Icons.watch_later_outlined,
                  color: AppColors.primaryColor,
                ),
                hint: 'Enter Task Date',
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
              Gap(6),
              CustomTextField(
                controller: endTimeController,
                readOnly: true,
                onTap: () async {
                  var selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (selectedTime != null) {
                    endTimeController.text = selectedTime.format(context);
                  }
                },
                suffixIcon: Icon(
                  Icons.watch_later_outlined,
                  color: AppColors.primaryColor,
                ),
                hint: 'Enter Task Date',
              ),
            ],
          ),
        ),
      ],
    );
  }
}