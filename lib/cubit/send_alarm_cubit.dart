import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../dio_factory.dart';

part 'send_alarm_state.dart';

class SendAlarmCubit extends Cubit<SendAlarmState> {
  SendAlarmCubit() : super(SendAlarmInitial());
  static SendAlarmCubit get(context) => BlocProvider.of(context);

  Future<void> sendNotification(String title, String body, String group) async {
    final Dio dio = DioFactory().getDio();
    try {
      emit(SendAlarmLoading());

      await dio.post(
        "https://fcm.googleapis.com/fcm/send",
        data: {
          "to": "/topics/$group",
          "priority": "high",
          "notification": {
            "title": title,
            "body": body,
            "sound": 'notification.aiff',
            "android_channel_id": "alarm_notification"
          },
          "android": {
            "priority": "HIGH",
            "notification": {
              "notification_priority": "PRIORITY_MAX",
              "sound": "notification",
              "default_vibrate_timings": true,
              "default_light_settings": true
            }
          },
          "data": {
            "type": "order",
            "id": "87",
            "click_action": "FLUTTER_NOTIFICATION_CLICK"
          }
        },
      );
      emit(SendAlarmSuccess());
    } catch (e) {
      log(e.toString());

      emit(SendAlarmFailure());
    }
  }
}
