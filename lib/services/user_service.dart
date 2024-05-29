import 'package:task_manager/constants/server_constants.dart';
import 'package:task_manager/models/space.dart';
import 'package:task_manager/models/task.dart';
import 'package:task_manager/models/user.dart';
import 'package:task_manager/services/network_service.dart';

class UserService {
  static Future<User> getUser() async {
    final response = await NetworkService.get(
      '${ServerConstants.apiUrl}/user/get',
    );
    return User(
      uuid: response.data['uuid'],
      name: response.data['name'],
      email: response.data['email'],
      spaces: await getSpaces(),
    );
  }

  static Future<List<Space>> getSpaces() async {
    final response = await NetworkService.get(
      '${ServerConstants.apiUrl}/user/spaces',
    );

    return await Future.wait((response.data as List)
        .map((space) async => Space(
              id: space['id'],
              name: space['name'],
              priority: space['priority'],
              tasks: await getTasks(space['id']),
            ))
        .toList());
  }

  static Future<List<Task>> getTasks(int spaceId) async {
    final response = await NetworkService.get(
      '${ServerConstants.apiUrl}/space/tasks?space_id=$spaceId',
    );

    return (response.data as List)
        .map((task) => Task(
              id: task['id'],
              name: task['name'],
              priority: task['priority'],
              status: task['status'],
              deadline: task['deadline'],
              spaceId: task['space_id'],
            ))
        .toList();
  }
}
