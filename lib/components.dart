import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

import 'cubit/app_cubit.dart';



Widget buildTaskItem(Map model, context) => Dismissible(
  key: Key(model['id'].toString()),
  onDismissed: (direction) {
    showToast(text: 'Task Deleted', state: ToastStates.SUCCESS);
    AppCubit.get(context).deleteData(id: model['id']);
  },
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: (Row(
      children: [
        CircleAvatar(
          radius: 40,
          child: Text(
            '${model['time']}',
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${model['title']}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${model['date']}',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        IconButton(
          onPressed: () {
            showToast(text: 'Task is Done', state: ToastStates.SUCCESS);
            AppCubit.get(context)
                .updateData(status: 'done', id: model['id']);
          },
          icon: const Icon(
            Icons.check_box,
            color: Colors.green,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        IconButton(
            onPressed: () {
              showToast(text: 'Task Archived', state: ToastStates.SUCCESS);
              AppCubit.get(context)
                  .updateData(status: 'archive', id: model['id']);
            },
            icon: const Icon(
              Icons.archive,
              color: Colors.black54,
            )),
      ],
    )),
  ),
);


void showToast({
  required text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

enum ToastStates { ERROR, SUCCESS, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}
