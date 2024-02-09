import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {

  final List<String> list = [];
  TodoBloc() : super(const TodoState()) {
    on<AddTodoEvent>(_addTask);
    on<RemoveTodoEvent>(_removeTask);
  }

  void _addTask(AddTodoEvent event, Emitter<TodoState> emit ) {
    list.add(event.task);
    emit(state.copyWith(list: List.from(list)));
  }

    void _removeTask(RemoveTodoEvent event, Emitter<TodoState> emit ) {
    list.remove(event.task);
    emit(state.copyWith(list: List.from(list)));
  }
}
