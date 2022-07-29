import 'package:flutter/material.dart';

void main() {
  runApp(const Todo());
}

class Todo extends StatelessWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TodoList());
  }
}

class TodoList extends StatefulWidget {
  TodoList({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<String> _todoList = <String>[];
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To-do List"),
      ),
      body: ListView(children: _getItems()),
      floatingActionButton: FloatingActionButton(
          onPressed: (() => _displayDialog(context)),
          tooltip: 'Add Item',
          child: const Icon(Icons.add)),
    );
  }

  void _addTodoItem(String title) {
    setState(() {
      _todoList.add(title);
    });
    _textFieldController.clear();
  }

  Widget _buildTodoItem(String title) {
    return ListTile(title: Text(title));
  }

  Future<Future> _displayDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add a task to your list"),
          content: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: 'Enter task here '),
          ),
          // cancel button
          actions: [
            ElevatedButton(
              onPressed: (() {
                Navigator.of(context).pop();
                _addTodoItem(_textFieldController.text);
              }),
              child: const Text("Add"),
            ),
            ElevatedButton(
                onPressed: ((() {
                  Navigator.of(context).pop();
                })),
                child: const Text('cancel'))
          ],
        );
      },
    );
  }

  List<Widget> _getItems() {
    final List<Widget> _todoWidgets = <Widget>[];
    for (String title in _todoList) {
      _todoWidgets.add(_buildTodoItem(title));
    }
    return _todoWidgets;
  }
}
