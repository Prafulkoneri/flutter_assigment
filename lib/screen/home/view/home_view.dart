import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_assigment/screen/home/controller/homeviewcontroller.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}
void initstate(context){
  SchedulerBinding.instance.addPostFrameCallback((_){
    context.read<Homeviewcontroller>().initstate(context);
  });
}
class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final read = context.read<Homeviewcontroller>();
    final watch = context.watch<Homeviewcontroller>();
    return  Scaffold(
      body:  Column(
        children: [
          // ListView.builder(
          //   itemCount: 5,
          //   itemBuilder: (context, index) {
            
          // },)
        ],
      ),
    );
  }
}

