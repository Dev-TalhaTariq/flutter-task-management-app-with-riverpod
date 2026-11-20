import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/models/task_model.dart';
import 'package:task_management_app/providers/task_notifier_provider.dart';
import 'package:task_management_app/screens/add_task_screen/widgets/category_dropdown.dart';
import 'package:task_management_app/screens/add_task_screen/widgets/date_time_picker.dart';
import '../../constants/colors.dart';
import 'widgets/custom_textfield.dart';
import '../common_widgets/section_heading.dart';

class AddTaskScreen extends ConsumerStatefulWidget {
  final TaskModel? taskToEdit;

  const AddTaskScreen({super.key, this.taskToEdit});

  @override
  ConsumerState<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends ConsumerState<AddTaskScreen> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  TaskCategory _selectedCategory = TaskCategory.general;
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    if (widget.taskToEdit != null) {
      _titleController.text = widget.taskToEdit!.title;
      _descController.text = widget.taskToEdit!.description;
      _selectedCategory = widget.taskToEdit!.category;
      _selectedDate = widget.taskToEdit!.date;
      _selectedTime = widget.taskToEdit!.time;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditMode = widget.taskToEdit != null;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.barColor,
        title: Text(
          isEditMode ? 'Update Task' : 'Add task',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white, )
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const SectionHeading(text: 'Title'),
              const SizedBox(height: 8),
              CustomTextField(
                controller: _titleController,
                hintText: 'Enter title...',
              ),
              const SizedBox(height: 20),
              const SectionHeading(text: 'Description'),
              const SizedBox(height: 8),
              CustomTextField(
                controller: _descController,
                hintText: 'Enter description...',
                maxLines: 4,
              ),
              const SizedBox(height: 20),
              const SectionHeading(text: 'Category'),
              const SizedBox(height: 8),
              CategoryDropdown(
                category: _selectedCategory,
                onChanged: (newValue) {
                    setState(() {
                      _selectedCategory = newValue;
                    });
                },
              ),
              const SizedBox(height: 28),
              const SectionHeading(text: 'Date & Time'),
              const SizedBox(height: 8),
              DateTimePicker(
                date: _selectedDate,
                time: _selectedTime,
                onDateChanged: (date){
                  setState(() {
                    _selectedDate = date;
                  });
                },
                onTimeChanged: (time){
                  setState(() {
                    _selectedTime = time;
                  });
                },
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: 55,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    isEditMode ? 'Update Task' : 'Add Task',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackbar(String text, Color bgColor, IconData icon) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: bgColor,
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 6),
            Expanded(
              child: Text(text, style: const TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  void _submit() {
    final title = _titleController.text.trim();
    final description = _descController.text.trim();
    if (title.isEmpty || description.isEmpty) {
      _showSnackbar(
        'Title & Description are required!',
        Colors.red,
        Icons.error_outline,
      );
      return;
    }
    final editMode = widget.taskToEdit;
    final notifier = ref.read(taskNotifierProvider.notifier);
    if (editMode != null) {
      notifier.editTask(editMode.copyWith(
        title: title,
        description: description,
        category: _selectedCategory,
        date: _selectedDate,
        time: _selectedTime,)
      );
    } else {
      notifier.addTask(TaskModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: title,
        description: description,
        category: _selectedCategory,
        date: _selectedDate,
        time: _selectedTime,
      ));
    }
    _showSnackbar(
      editMode != null ? 'Task updated successfully!' : 'Task added successfully!',
      Colors.green,
      Icons.check_circle,
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }
}
