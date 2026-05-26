import 'package:todolist/database/app_repository.dart';
import 'package:todolist/database/todo.dart';

class HomeViewModel {
  final AppRepository repo;

  HomeViewModel({required this.repo});

  List<Todo> getTodoList() {
    return repo.getTodoList();
  }
  
   void addTodo(String title) {
    repo.addTodo(title);
  }

  void updateTodo(int index, String title) {
    repo.updateTodo(index, title);
  }

  void deleteTodo(int index) {
    repo.deleteTodo(index);
  }
}