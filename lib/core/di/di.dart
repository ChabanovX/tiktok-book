import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:rsvp_flutter_app/core/di/di.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
void configureDeps() => getIt.init();
