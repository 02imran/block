import 'dart:async';

import 'package:block_test/screen/bloc/counter/counter_block.dart';

import 'package:block_test/screen/bloc/image_picker/bloc/image_picker_bloc.dart';
import 'package:block_test/screen/bloc/switch/switch_block.dart';
import 'package:block_test/screen/bloc/todo/todo_bloc.dart';
import 'package:block_test/screen/ui/home/home_screen.dart';

import 'package:block_test/screen/ui/switch_ui/switch_view.dart';
import 'package:block_test/utils/image_picker_utils.dart';
import 'package:block_test/utils/local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

int id = 0;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
final StreamController<ReceivedNotification> didReceiveLocalNotificationStream =
    StreamController<ReceivedNotification>.broadcast();
final StreamController<String?> selectNotificationStream =
    StreamController<String?>.broadcast();

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotificaitons.init();

  // await _configureLocalTimeZone();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (context) => SwitchBlock()),
        BlocProvider(
            create: (context) =>
                ImagePickerBloc(imagePickerUtils: ImagePickerUtils())),
        BlocProvider(create: (context) => TodoBloc()),
        // BlocProvider(create: (context) => FavouriteBloc(FavouriteRepository())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'package:socket_io_client/socket_io_client.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   IO.Socket? socket;

//   @override
//   void initState() {
//     super.initState();
//     // Connect to Socket.IO server
    
//     Socket socket = io('http://localhost:3000', 
//     OptionBuilder()
//       .setTransports(['websocket']) // for Flutter or Dart VM
//       .enableAutoConnect()  // disable auto-connection
//       .setExtraHeaders({'foo': 'bar'}) // optional
//       .build()
//   );
//       socket.onConnect((_) {
//       print('connect');
//     });
//     socket.connect();


//     // // Connect to the server
//     // socket!.connect();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Socket.IO Notifications Demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Socket.IO Notifications Demo'),
//         ),
//         body: Center(
//           child: Text('Listening for notifications...'),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     // Disconnect the socket when the app is closed
//     socket!.disconnect();
//   }
// }
