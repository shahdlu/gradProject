import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradproj/cubit/auth_cubit/login_cubit/login_cubit.dart';
import 'package:gradproj/cubit/auth_cubit/register_cubit/register_cubit.dart';
import 'package:gradproj/screens/welcome&login/welcome.dart';
import 'firebase_options.dart';
import 'injection_container.dart' as di;

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<RegisterCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<LoginCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Health Pulse',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Welcome(),
      ),
    );
  }
}
