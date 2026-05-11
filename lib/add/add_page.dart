import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<StatefulWidget> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Новая задача'), 
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1), 
          child: Container(
            height: 1,
            color: Colors.grey
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            SizedBox(height: 16),

            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                label: Text('Введите название задачи'),
              ),
              controller: _controller,
            ),

            Spacer(),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.amber),
                onPressed: () => (_saveTask()),
                child: Text('Сохранить', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveTask() {
    Navigator.pop(context, _controller.text);
  }
}
