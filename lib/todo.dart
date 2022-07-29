// import 'package:flutter/material.dart';

// void main() {
//   runApp(const TodoApp());
// }

// class TodoApp extends StatelessWidget {
//   const TodoApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: "Todo List",
//       home: TodoList(),
//     );
//   }
// }

// class TodoList extends StatefulWidget {
//   const TodoList({Key? key}) : super(key: key);

//   @override
//   State<TodoList> createState() => _TodoListState();
// }

// class _TodoListState extends State<TodoList> {
//   final TextEditingController _textFieldController = TextEditingController();

//   void _handleTodoChange(Todo todo) {
//     setState(() {
//       todo.checked = !todo.checked;
//     });
//   }

//   final List<Todo> _todos = <Todo>[];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Todo List"),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(10.0),
//         children: _todos.map((Todo todo) {
//           return TodoItem(
//             todo: todo,
//             onTodoChanged: _handleTodoChange,
//           );
//         }).toList(),
//       ),
//       floatingActionButton: FloatingActionButton(
//           onPressed: () => _displayDialog(),
//           tooltip: 'Add Item',
//           child: const Icon(Icons.add)),
//     );
//   }

//   void _addTodoItem(String name) {
//     setState(() {
//       _todos.add(Todo(name: name, checked: false));
//     });
//     _textFieldController.clear();
//   }
// }

// class _handleTodoChange {}

// class TodoItem extends StatelessWidget {
//   TodoItem({
//     required this.todo,
//     required this.onTodoChanged,
//   }) : super(key: ObjectKey(todo));

//   final Todo todo;
//   final onTodoChanged;

//   TextStyle? _getTextStyle(bool checked) {
//     if (!checked) return null;

//     return const TextStyle(
//       color: Colors.black54,
//       decoration: TextDecoration.lineThrough,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         onTodoChanged(todo);
//       },
//       leading: CircleAvatar(
//         child: Text(todo.name[0]),
//       ),
//       title: Text(todo.name, style: _getTextStyle(todo.checked)),
//     );
//   }
// }

// Future<void> _displayDialog() async {
//   return showDialog<void>(
//     context: context,
//     barrierDismissible: false, // user must tap button!
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('Add a new todo item'),
//         content: TextField(
//           controller: _textFieldController,
//           decoration: const InputDecoration(hintText: 'Type your new todo'),
//         ),
//         actions: <Widget>[
//           TextButton(
//             child: const Text('Add'),
//             onPressed: () {
//               Navigator.of(context).pop();
//               _addTodoItem(_textFieldController.text);
//             },
//           ),
//         ],
//       );
//     },
//   );
// }

// class _addTodoItem {}

// class Todo {
//   Todo({required this.name, required this.checked});
//   final String name;
//   bool checked;
// }
