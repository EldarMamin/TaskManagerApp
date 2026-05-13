import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<StatefulWidget> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  bool isDarkTheme = false;

  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF1B1726),
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    scaffoldBackgroundColor: Color(0xFF1B1726),
    cardColor: Color(0xFF383241),
  );

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: isDarkTheme ? darkTheme : ThemeData.light(),
      child: Builder(
        builder: (context) {
          
          return Scaffold(
            appBar: AppBar(
              title: Text('Настройки', style: TextStyle(fontSize: 24)),
              centerTitle: true,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(1),
                child: Container(height: 1, color: Colors.grey),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.all(24),
              child: Container(
                padding: EdgeInsets.all(16),
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Темная тема',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),

                        SizedBox(height: 2),

                        Text(
                          'Использовать темное\nоформление приложения',
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),

                    Spacer(),

                    Center(
                      child: ElevatedButton(
                        onPressed: toggleTheme,
                        child: Icon(
                          isDarkTheme ? Icons.toggle_off : Icons.toggle_on,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void toggleTheme() {
    setState(() {
      isDarkTheme = !isDarkTheme;
    });
  }
}
