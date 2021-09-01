import 'package:flutter_dotenv/flutter_dotenv.dart';

Future loadEnvFile(String path) async {
  await dotenv.load(fileName: path);
}