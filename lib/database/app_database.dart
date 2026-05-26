import 'package:todolist/database/todo.dart';

class AppDatabase {
  final List<Todo> _todoList = [];

  //READ
  List<Todo> getTodoList() {
    return _todoList;
  }

  //Create
  void addTodo(String title) {
    _todoList.insert(0, 
    Todo(
      id: DateTime.now().microsecondsSinceEpoch, 
      title: title, 
      isDone: false, 
      createdAt: DateTime.now().toString()
      ),
    );
  }

  //Update
  void updateTodo(int index, String newTitle) {
    _todoList[index].title = newTitle;
  } 

  //Delete
  void deleteTodo(int index) {
    _todoList.removeAt(index);
  }
}

//CRUD
