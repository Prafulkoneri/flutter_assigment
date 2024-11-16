import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_assigment/screen/home/controller/homeviewcontroller.dart';
import 'package:flutter_assigment/screen/profile/controller/profile_controller.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  
void initstate(context){
  SchedulerBinding.instance.addPostFrameCallback((_){
    context.read<ProfileController>().initstate(context);
  });
}
  @override
  Widget build(BuildContext context) {
     final read = context.read<ProfileController>();
    final watch = context.watch<ProfileController>();
    return const Scaffold();
  }
}