import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/controllers/create_session_controller.dart';
import 'widgets/create_session_body.dart';

class CreateSessionView extends GetView<CreateSessionController> {
  const CreateSessionView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CreateSessionBody(),
      ),
    );
  }
}
