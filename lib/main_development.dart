import 'package:rss_feeder/core/enums/environment.dart';
import 'package:rss_feeder/core/main.dart';

Future<void> main() async {
  await appMain(AppEnvironment.development);
}
