import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx/controllers/create_session_controller.dart';
import 'create_session_button.dart';
import 'create_session_dialog.dart';

class CreateSessionButtonAction extends GetView<CreateSessionController> {
  const CreateSessionButtonAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.generateSession();
        showModalBottomSheet(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
          ),
          context: context,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return const CreateSessionDialog();
          },
        );
      },
      child: const CreateSessionButton(),
    );
  }
}
