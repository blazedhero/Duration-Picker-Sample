import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Duration _duration = Duration(hours: 0, minutes: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Picker "),
      ),
      body: Center(
        child: Column(
          children: [
            DurationPicker(
              onChange: (val) {
                _duration = val;
                setState(() {});
              },
              duration: _duration,
              baseUnit: BaseUnit.hour,
            ),
            ElevatedButton(
                onPressed: () async {
                  Duration? selectedDuration = await showDurationPicker(
                    context: context,
                    initialTime: Duration(minutes: 20),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Chose duration: $selectedDuration')));
                },
                child: Text("Click for duration"))
          ],
        ),
      ),
    );
  }
}
