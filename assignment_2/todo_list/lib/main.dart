import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_list/task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<Task> tasksTodo = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo list App',
      color: Color.fromRGBO(37, 211, 102, 1),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Task> todoItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List App"),
        backgroundColor: Color(0xff128c7e),
      ),
      body: ListView.builder(
        itemCount: this.todoItems.length,
        itemBuilder: (_, i) {
          return todoTile(i);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff128c7e),
        child: Icon(Icons.add),
        onPressed: () => showAddTaskDialog(context),
      ),
    );
  }

  Widget todoTile(int index) {
    return Dismissible(
      key: Key('$index'),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            color: Colors.grey.shade300,
            child: ListTile(
              title: Text(
                this.todoItems[index].description,
                style: TextStyle(
                    color: this.todoItems[index].time.compareTo(DateTime.now()) <= 0
                ? Colors.blueGrey
                :Color(0xff128c7e),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              subtitle: Text(
                  "${this.todoItems[index].time.day}/${this.todoItems[index].time.month}"),
              trailing: Text(
                  "${this.todoItems[index].time.hour}:${this.todoItems[index].time.minute}"),
            ),
          ),
        ),
      ),
      onDismissed: (DismissDirection _) {
        String dismissDirection = "${_}";
        setState(() {
          this.todoItems.removeAt(index);
        });
        if (dismissDirection == "DismissDirection.startToEnd") {
          final snackBar = SnackBar(content: Text('Task deleted successfully'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          final snackBar =
              SnackBar(content: Text('Task compeleted successfully!'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      background: dismissibleBackgroundWidget(Icons.cancel_sharp),
      secondaryBackground: dismissibleBackgroundWidget(Icons.done),
    );
  }

  Widget dismissibleBackgroundWidget(IconData icon) {
    return Container(
      alignment:
          icon == Icons.done ? Alignment.centerRight : Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 16),
      color: icon == Icons.done ? Colors.amber : Colors.redAccent,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }

  showAddTaskDialog(BuildContext context) async {
    TextEditingController taskController = TextEditingController();
    TextEditingController timeController = TextEditingController(text: DateTime.now().toString());

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add todo tasks"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10),
              textFormFieldDecoration("Task", taskController),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () => dateTimePicker(context, timeController),
                child: AbsorbPointer(
                  child: textFormFieldDecoration("Time", timeController),
                ),
              ),
              // SizedBox(height: 10),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                this.todoItems.add(Task(
                    taskController.text, DateTime.parse(timeController.text)));
                Navigator.pop(context);
                final snackBar =
                    SnackBar(content: Text('Task added successfully!'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
    setState(() {});
  }

  Widget textFormFieldDecoration(
      String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          // borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }

  dateTimePicker(BuildContext context, TextEditingController controller) {
    DatePicker.showDateTimePicker(
      context,
      showTitleActions: true,
      minTime: DateTime.now(),
      maxTime: DateTime.now().add(Duration(days: 6)),
      onConfirm: (date) {
        controller.text = date.toString();
      },
      currentTime: DateTime.now(),
      locale: LocaleType.en,
    );
  }
}
