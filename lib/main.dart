// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocpractice/cubit/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Bloc',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color.fromARGB(192, 0, 0, 0),
            elevation: 20.0,
            title: Text("Counter Application",
                style: TextStyle(fontSize: 25, color: Colors.green))),
        body: BlocListener<CounterCubit, CounterState>(
          listener: (context, state) {
            if (state.isIncrement == 1) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content:
                    Text('Increment', style: TextStyle(color: Colors.green)),
              ));
            } else if (state.isIncrement == -1) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Decrement', style: TextStyle(color: Colors.red)),
              ));
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 0, 0, 0),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color.fromARGB(192, 0, 0, 0),
                      child: IconButton(
                        color: Colors.green,
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).increment();
                        },
                        icon: Icon(Icons.add),
                        iconSize: 30,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 100,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(192, 0, 0, 0),
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: BlocBuilder<CounterCubit, CounterState>(
                        builder: (context, state) {
                          if (state.counter < 0) {
                            return Text(state.counter.toString(),
                                style:
                                    TextStyle(fontSize: 30, color: Colors.red));
                          } else if (state.counter >= 0 && state.counter < 20) {
                            return Text(state.counter.toString(),
                                style: TextStyle(
                                    fontSize: 30, color: Colors.green));
                          } else {
                            return Text(state.counter.toString(),
                                style: TextStyle(
                                    fontSize: 30, color: Colors.blue));
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 0, 0, 0),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color.fromARGB(192, 0, 0, 0),
                      child: IconButton(
                          color: Colors.red,
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context).decrement();
                          },
                          icon: Icon(Icons.remove),
                          iconSize: 30),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
