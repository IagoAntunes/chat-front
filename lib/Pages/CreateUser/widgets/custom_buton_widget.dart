import 'package:flutter/material.dart';

import '../../../Config/config.dart';
import '../../../Models/chat_model.dart';
import '../../../Models/user_model.dart';
import '../../tab_page.dart';

class ButtonNext extends StatelessWidget {
  const ButtonNext({
    Key? key,
    required this.controllerUser,
    required this.controllerDescription,
    required this.controllerHost,
    required this.controllerPort,
    required this.listColors,
    required this.indexSelected,
    required this.isSelected,
  }) : super(key: key);

  final TextEditingController controllerUser;
  final TextEditingController controllerDescription;
  final TextEditingController controllerHost;
  final TextEditingController controllerPort;
  final List<int> listColors;
  final int indexSelected;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (controllerUser.text.isNotEmpty &&
            controllerHost.text.isNotEmpty &&
            controllerPort.text.isNotEmpty) {
          User user = User(
            username: controllerUser.text,
            description: controllerDescription.text,
            color: listColors[indexSelected],
            listRedes: [],
            isOnline: true,
            listMessages: [],
          );
          userProv.setUser(user);
          Chat chat = Chat(
            user: user,
            isServer: isSelected,
            host: controllerHost.text,
            port: controllerPort.text,
          );
          chatProv.setChat(chat);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => TabBarDemo()),
            ),
          );
        }
      },
      child: Text(isSelected ? 'Login' : 'Next'),
    );
  }
}
