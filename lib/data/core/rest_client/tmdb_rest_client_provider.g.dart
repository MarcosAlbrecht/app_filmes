// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_rest_client_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(tmdbRestClientDio)
const tmdbRestClientDioProvider = TmdbRestClientDioProvider._();

final class TmdbRestClientDioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  const TmdbRestClientDioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tmdbRestClientDioProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tmdbRestClientDioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return tmdbRestClientDio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$tmdbRestClientDioHash() => r'72312a400d3de0eda15655c0d7d32ab3bfe13515';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
