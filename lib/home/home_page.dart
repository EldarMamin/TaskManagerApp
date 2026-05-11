import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todolist/add/add_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> tasksList = [];

  @override
  Widget build(BuildContext context) {
    print('HomePage-Build');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Мои задачи'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1), 
          child: Container(
            height: 1,
            color: Colors.grey,
          )
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    for (String task in tasksList) ...[
                      // Лупа задач
                      SizedBox(height: 8),
                      tasks(context, task: task),
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
        tasksList.insert(0, result);
      });
    }
  }
}

Widget tasks(BuildContext context, {required String task}) {
  return Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.blueAccent,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      children: [
        Icon(Icons.check_box_outlined, size: 25, color: Colors.white,),

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
  );
}
