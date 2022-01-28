import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../view/task/model/task_model.dart';
import '../../view/task/model/todo_model.dart';

class DatabaseHelper {
  Future<Database> database() async {
    final db = openDatabase(
      join(await getDatabasesPath(), 'todo.db'),
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, description TEXT)");
        await db.execute(
            "CREATE TABLE todo(id INTEGER PRIMARY KEY, taskId INTEGER, title TEXT, isDone INTEGER)");
      },
      version: 1,
    );
    return db;
  }

  Future<int?> insertTask({required Task task}) async {
    int taskInsertedId = 0;
    Database _db = await database();
    await _db
        .insert('tasks', task.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace)
        .then((value) => taskInsertedId = value);
    return taskInsertedId;
  }

  Future<List<Task>?> getTasks() async {
    Database _db = await database();
    List<Map<String, dynamic>> taskMap = await _db.query('tasks');
    List<Task> tasksList = List.generate(
      taskMap.length,
      (index) => Task(
        id: taskMap[index]['id'],
        title: taskMap[index]['title'],
        description: taskMap[index]['description'],
      ),
    );
    return tasksList;
  }

  Future<void> updateTaskTitle({required int id, required String title}) async {
    Database _db = await database();
    await _db.rawUpdate("UPDATE tasks SET title = '$title' WHERE id = '$id'");
  }

  Future<void> updateTaskDescription(
      {required int id, required String description}) async {
    Database _db = await database();
    await _db.rawUpdate(
        "UPDATE tasks SET description = '$description' WHERE id = '$id'");
  }

  Future<void> deleteTask({required int id}) async {
    Database _db = await database();
    await _db.rawDelete("DELETE FROM tasks WHERE id = '$id'");
    await _db.rawDelete("DELETE FROM todo WHERE taskId = '$id'");
  }

  Future<void> insertTodo({required Todo todo}) async {
    Database _db = await database();
    await _db.insert('todo', todo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Todo>?> getTodo({required int taskId}) async {
    Database _db = await database();
    List<Map<String, dynamic>> todoMap =
        await _db.rawQuery("SELECT * FROM todo WHERE taskId = $taskId");
    final todoList = List.generate(
      todoMap.length,
      (index) => Todo(
        id: todoMap[index]['id'],
        taskId: todoMap[index]['taskId'],
        title: todoMap[index]['title'],
        isDone: todoMap[index]['isDone'],
      ),
    );
    return todoList;
  }

  Future<void> updateTodoDone({required int id, required int isDone}) async {
    Database _db = await database();
    await _db.rawUpdate("UPDATE todo SET isDone = '$isDone' WHERE id = '$id'");
  }

  Future<void> deleteTodo({required int todoId}) async {
    Database _db = await database();
    await _db.rawDelete("DELETE FROM todo WHERE id = '$todoId' ");
  }
}
