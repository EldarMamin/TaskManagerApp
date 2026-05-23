import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  String task;

  DetailsPage({super.key, required this.task});

  @override
  State<StatefulWidget> createState() => _DetailsPage();
}

class _DetailsPage extends State<DetailsPage> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.task);
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Детали'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(height: 1, color: Colors.grey),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            SizedBox(height: 16),

            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                label: Text('task'),
              ),
            ),

            Spacer(),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.amber),
                onPressed: () => (
                  Navigator.pop(context, controller.text)
                ),
                child: Text(
                  'Сохранить',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  

}
