import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa/cubit/send_alarm_cubit.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    SendAlarmCubit.get(context).getNotificationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification Screen"),
      ),
      body: BlocConsumer<SendAlarmCubit, SendAlarmState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var data = SendAlarmCubit.get(context).notification;
          if (state is GetNotificationLoading || data == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(

            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: data.length,
                  itemBuilder: (context, index) => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Event Name :${data[index].eventName}"),
                          const Divider(thickness: 1,),
                          Text("${data[index].start}"),
                          const Divider(thickness: 1,),
                          Text("${data[index].end}"),
                          const Divider(thickness: 1,),
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
