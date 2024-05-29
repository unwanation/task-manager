import 'package:task_manager/constants/server_constants.dart';
import 'package:task_manager/services/network_service.dart';

class TaskService {
  static addTask(int spaceId, String userInput) async {
    await NetworkService.post(
        '${ServerConstants.apiUrl}/task/new?user_input=$userInput&space_id=$spaceId',
        null);
  }

  static deleteTask(int taskId) async {
    await NetworkService.delete(
      '${ServerConstants.apiUrl}/task/delete?task_id=$taskId',
    );
  }
}
