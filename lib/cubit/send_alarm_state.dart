part of 'send_alarm_cubit.dart';

@immutable
abstract class SendAlarmState {}

class SendAlarmInitial extends SendAlarmState {}

class SendAlarmLoading extends SendAlarmState {}

class SendAlarmFailure extends SendAlarmState {}

class SendAlarmSuccess extends SendAlarmState {}

class SendAlarmChangeSelectedCategory extends SendAlarmState {}
