import 'package:hive/hive.dart';
import 'package:taskati_ui/core/models/task_model.dart';



class LocalHelper {
  static late Box userBox;
  static late Box<TaskModel> taskBox;

  static String kName = 'name';
  static String kImage = 'image';
  static String kIsUploaded = 'isUploaded';
  static String kIsDark = 'isDark';

  static init() async {
    Hive.registerAdapter<TaskModel>(TaskModelAdapter());
    userBox = await Hive.openBox('userBox');
    taskBox = await Hive.openBox<TaskModel>('taskBox');
  }

  static putData(String key, dynamic value) {
    userBox.put(key, value);
  }

  static getData(String key) {
    return userBox.get(key);
  }

  static putTask(String key, TaskModel value) {
    taskBox.put(key, value);
  }

  static TaskModel? getTask(String key) {
    return taskBox.get(key);
  }

  static putUserData(String name, String image) {
    putData(kName, name);
    putData(kImage, image);
    putData(kIsUploaded, true);
  }

  static changeTheme(){
    bool cachedTheme = userBox.get(kIsDark) ?? false;
    userBox.put(kIsDark, !cachedTheme);
  }
}