import 'package:block_test/screen/bloc/todo/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            for (int i = 0; i < 10; i++) {
              context.read<TodoBloc>().add(AddTodoEvent(task: "Task : $i"));
            }
          }),
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.list.isEmpty) {
            return const Center(child: Text("No data"));
          } else if (state.list.isNotEmpty) {
            return ListView.builder(
              shrinkWrap: true,
                itemCount: state.list.length,
                itemBuilder: (context, index) => ListTile(
                      title: Text(state.list[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          context.read<TodoBloc>().add(RemoveTodoEvent(task: state.list[index]));
                        },
                      ),
                    ));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
