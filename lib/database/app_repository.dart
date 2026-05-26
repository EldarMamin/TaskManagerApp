import 'package:todolist/database/app_database.dart';
import 'package:todolist/database/todo.dart';

abstract class AppRepository {
  void addTodo(String title);

  List<Todo> getTodoList();

  void updateTodo(int index, String newTitle);

  void deleteTodo(int index);
}

class AppRepositoryImpl extends AppRepository {
  final AppDatabase db;

  AppRepositoryImpl({required this.db});

  @override
  List<Todo> getTodoList() {
    return db.getTodoList();
  }

  @override
  void addTodo(String title) {
    db.addTodo(title);
  }

  @override
  void updateTodo(int index, String newTitle) {
    db.updateTodo(index, newTitle);
  }

  @override
  void deleteTodo(int index) {
    db.deleteTodo(index);
  }
}
