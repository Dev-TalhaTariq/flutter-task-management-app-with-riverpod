import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/task_model.dart';

final taskNotifierProvider = NotifierProvider<TaskNotifier, List<TaskModel>>(() {
  return TaskNotifier();
});

class TaskNotifier extends Notifier<List<TaskModel>> {
  @override
  List<TaskModel> build() {
    return [];
  }


  void addTask(TaskModel task){
    state = [...state, task];
  }

  void deleteTask(String id){
    state = state.where((task) => task.id != id).toList();
  }

  void editTask(TaskModel updatedTask){
    state = state.map((task){
      if(task.id == updatedTask.id){
        return updatedTask;
      } return task;
    }).toList();
  }

  void updateStatus(String id, TaskStatus newStatus){
    state = state.map((task){
      if(task.id == id){
        return task.copyWith(status: newStatus);
      } return task;
    }).toList();
  }

  void resetAll() {
    state = [];
  }
}

final taskByIdProvider = Provider.family<TaskModel?, String>((ref, id) {
  return ref.watch(
    taskNotifierProvider.select((list) => list.where((t) => t.id == id).firstOrNull),
  );
});

