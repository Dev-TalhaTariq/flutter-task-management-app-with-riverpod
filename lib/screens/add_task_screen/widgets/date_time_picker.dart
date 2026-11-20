import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import 'date_time_tile.dart';


class DateTimePicker extends StatelessWidget {
  final DateTime date;
  final TimeOfDay time;
  final ValueChanged<DateTime> onDateChanged;
  final ValueChanged<TimeOfDay> onTimeChanged;

  const DateTimePicker({super.key, required this.date, required this.time, required this.onDateChanged, required this.onTimeChanged});

  Widget _dateTimePickerTheme(BuildContext context, Widget? child) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: const ColorScheme.dark(
          surface: AppColors.cardColor,
          onSurface: Colors.white,
          primary: AppColors.secondaryColor,
          onPrimary: Colors.white,
        ),
        timePickerTheme: const TimePickerThemeData(
          helpTextStyle: TextStyle(color: Colors.white),
        ),
      ),
      child: child!,
    );
  }
  Future<void> _datePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date.isBefore(DateTime.now())
          ? DateTime.now()
          : date,
      firstDate: DateTime.now(),
      lastDate: DateTime(2040),
      builder: _dateTimePickerTheme,
    );
    if (picked != null) onDateChanged(picked);
  }

  Future<void> _timePicker(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: time,
      builder: _dateTimePickerTheme,
    );
    if (picked != null && picked != time) onTimeChanged(picked);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DateTimeTile(
          value:
          MaterialLocalizations.of(context).formatMediumDate(date),
          onTap: () => _datePicker(context),
          icon: Icons.calendar_today,
        ),
        const SizedBox(width: 15),
        DateTimeTile(
          value: time.format(context),
          onTap: () => _timePicker(context),
          icon: Icons.access_time_rounded,
        ),
      ],
    );
  }
}
