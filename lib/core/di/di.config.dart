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
    as _i51;
    as _i51;
import 'package:rsvp_flutter_app/features/file_picking/data/repositories/file_repository_impl.dart'
    as _i542;
    as _i542;
import 'package:rsvp_flutter_app/features/file_picking/data/services/file_loader_service.dart'
    as _i303;
    as _i303;
import 'package:rsvp_flutter_app/features/file_picking/domain/repositories/file_repository.dart'
    as _i69;
    as _i69;
import 'package:rsvp_flutter_app/features/file_picking/domain/usecases/import_book_file.dart'
    as _i749;
import 'package:rsvp_flutter_app/services/book_converter.dart' as _i216;
import 'package:rsvp_flutter_app/services/cache_service.dart' as _i332;
import 'package:rsvp_flutter_app/services/pdf_parser.dart' as _i500;
import 'package:rsvp_flutter_app/services/text_processor.dart' as _i1019;
import 'package:rsvp_flutter_app/services/txt_parser.dart' as _i91;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i51.FilePickerDataSource>(() => _i51.FilePickerDataSource());
    gh.singleton<_i303.FileLoaderService>(() => _i303.FileLoaderService());
    gh.singleton<_i332.CacheService>(() => _i332.CacheService());
    gh.lazySingleton<_i500.PdfParser>(() => _i500.PdfParser());
    gh.lazySingleton<_i1019.TextProcessor>(() => _i1019.TextProcessor());
    gh.lazySingleton<_i91.TxtParser>(() => _i91.TxtParser());
    gh.lazySingleton<_i69.FileRepository>(
      () => _i542.FileRepositoryImpl(gh<_i303.FileLoaderService>()),
    );
    gh.singleton<_i749.ImportBookFile>(
      () => _i749.ImportBookFile(gh<_i69.FileRepository>()),
    );
    gh.singleton<_i216.BookConverter>(
      () => _i216.BookConverter(
        gh<_i500.PdfParser>(),
        gh<_i91.TxtParser>(),
        gh<_i1019.TextProcessor>(),
      ),
    );
    return this;
  }
}
