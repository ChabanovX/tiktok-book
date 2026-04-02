// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:rsvp_flutter_app/features/file_picking/data/datasources/file_picker_datasource.dart'
    as _i486;
import 'package:rsvp_flutter_app/features/file_picking/data/repositories/file_repository_impl.dart'
    as _i389;
import 'package:rsvp_flutter_app/features/file_picking/data/services/file_loader_service.dart'
    as _i934;
import 'package:rsvp_flutter_app/features/file_picking/domain/repositories/file_repository.dart'
    as _i861;
import 'package:rsvp_flutter_app/features/file_picking/domain/usecases/import_book_file.dart'
    as _i661;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i486.FilePickerDataSource>(
      () => _i486.FilePickerDataSource(),
    );
    gh.singleton<_i934.FileLoaderService>(() => _i934.FileLoaderService());
    gh.lazySingleton<_i861.FileRepository>(
      () => _i389.FileRepositoryImpl(gh<_i934.FileLoaderService>()),
    );
    gh.singleton<_i661.ImportBookFile>(
      () => _i661.ImportBookFile(gh<_i861.FileRepository>()),
    );
    return this;
  }
}
