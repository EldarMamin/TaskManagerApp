import 'package:flutter/material.dart';
import 'package:todolist/add/add_page.dart';
import 'package:todolist/details/details_page.dart';
import 'package:todolist/home/home_view_model.dart';
import 'package:todolist/settings/settings_page.dart';
import 'package:todolist/database/app_database.dart';
import 'package:todolist/database/app_repository.dart';
import 'package:todolist/database/todo.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final HomeViewModel vm;
  late final db = AppDatabase();
  @override
  void initState() {
    super.initState();

    final repo = AppRepositoryImpl(db: db);
    vm = HomeViewModel(repo: repo);
  }

  @override
  Widget build(BuildContext context) {
    final List<Todo> tasksList = vm.getTodoList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Мои задачи'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(height: 1, color: Colors.grey),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    for(int i = 0; i < tasksList.length; ++i) ... [
                      SizedBox(height: 8,),
                      tasks(context, 
                      task: tasksList[i].title,
                      onTap: () => _navigateToDetailsPage(tasksList[i].title, i)
                      ),
                    ],
                  ],
                ),
              ),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                  ),
                  onPressed: _navigateToAddPage,
                  child: Text('Добавить задачу'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToAddPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AddPage()),
    );
    if (result != null) {
      setState(() {
        vm.addTodo(result);
      });
    }
  }
  void _navigateToDetailsPage(String task, int index) async {
    final result = await Navigator.push(context, 
    MaterialPageRoute(builder: (_) => DetailsPage(task: task))
    );

    if(result == 'delete') {
      setState(() {
        vm.deleteTodo(index);
      });
    }
    else if(result != null) {
      setState(() {
        vm.updateTodo(index, result);
      });
    }
  }
}

Widget tasks(BuildContext context, {required String task, required VoidCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(Icons.check_box_outlined, size: 25, color: Colors.white),

          SizedBox(width: 8),

          Expanded(
            child: Text(
              task,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ),
  );
}

