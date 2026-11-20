import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/providers/search_query_provider.dart';
import '../../../constants/colors.dart';

class TaskSearchBar extends ConsumerWidget {
  const TaskSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      onChanged: (value){
        ref.read(searchQueryProvider.notifier).updateQuery(value);
      },
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
        textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: 'Search task...',
            hintStyle: const TextStyle(color: Colors.white60),
        filled: true,
        fillColor: AppColors.cardColor,
        prefixIcon: const Icon(Icons.search, color: Colors.white60,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        )
      ),
    );
  }
}
