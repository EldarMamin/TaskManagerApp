import 'package:todolist/database/todo.dart';
import 'package:hive/hive.dart';

class AppDatabase {
  final Box box = Hive.box('todoBox');
  List<Todo> _todoList = [];

  void loadTodos() {
    final data = box.get('todos', defaultValue: []);

//hive => dart
    _todoList = List<Map>.from(data).map( (e) {
      return Todo(
        id: e['id'], 
        title: e['title'], 
        isDone: e['isDone'], 
        createdAt: e['createdAt'],
        );
      }).toList();
  }

  void saveTodos() {
    final data = _todoList.map( (todo) {
      return {
        "id": todo.id,
        "title": todo.title,
        "isDone": todo.isDone,
        "createdAt": todo.createdAt,
      };
    }).toList();

    box.put('todos', data);
  }

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
    saveTodos();
  }

  //Update
  void updateTodo(int index, String newTitle) {
    _todoList[index].title = newTitle;
    saveTodos();
  } 

  //Delete
  void deleteTodo(int index) {
    _todoList.removeAt(index);
    saveTodos();
  }
}

//CRUD
