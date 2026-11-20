

import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationProvider = NotifierProvider<NavigationNotifier, int>((){
  return NavigationNotifier();
});


class NavigationNotifier extends Notifier<int>{
  @override
  int build() {
   return 0;
  }


  void changeScreen(int index){
    state = index;
  }
}