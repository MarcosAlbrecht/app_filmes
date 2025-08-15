// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(splashViewModel)
const splashViewModelProvider = SplashViewModelProvider._();

final class SplashViewModelProvider
    extends
        $FunctionalProvider<SplashViewModel, SplashViewModel, SplashViewModel>
    with $Provider<SplashViewModel> {
  const SplashViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'splashViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$splashViewModelHash();

  @$internal
  @override
  $ProviderElement<SplashViewModel> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SplashViewModel create(Ref ref) {
    return splashViewModel(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SplashViewModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SplashViewModel>(value),
    );
  }
}

String _$splashViewModelHash() => r'dbd25d0d263989eabc0e008e2c4ffbcabfb394c5';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
