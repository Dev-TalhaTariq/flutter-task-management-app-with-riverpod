import 'package:flutter_riverpod/flutter_riverpod.dart';



final selectedDateProvider = NotifierProvider<SelectedDateNotifier, DateTime>((){
  return SelectedDateNotifier();
});

class SelectedDateNotifier extends Notifier<DateTime>{
  @override
  DateTime build() {
   return DateTime.now();
  }

  void select(DateTime date){
    state = date;
  }
}