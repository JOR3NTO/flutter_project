import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_project/firebase_options.dart';
import 'routes/app_router.dart';
import 'themes/app_theme.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/task_provider.dart';
import 'repositories/task_repository.dart';
import 'data/local/task_local_data_source.dart';
import 'data/remote/task_remote_data_source.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    debugPrint('Error loading .env file: $e');
  }
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  
  final taskRepository = TaskRepository(
    local: TaskLocalDataSource(),
    remote: TaskRemoteDataSource(baseUrl: 'http://10.0.2.2:3000'), // Cambia la URL según tu API
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()..loadSession()),
        ChangeNotifierProvider(create: (_) => TaskProvider(repository: taskRepository)..loadTasks()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.lightTheme,
      title: 'Flutter - UCEVA',
      routerConfig: appRouter,
    );
  }
}
