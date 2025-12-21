// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelves_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Stream of all shelves from the local database.

@ProviderFor(allShelves)
const allShelvesProvider = AllShelvesProvider._();

/// Stream of all shelves from the local database.

final class AllShelvesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Shelf>>,
          List<Shelf>,
          Stream<List<Shelf>>
        >
    with $FutureModifier<List<Shelf>>, $StreamProvider<List<Shelf>> {
  /// Stream of all shelves from the local database.
  const AllShelvesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allShelvesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allShelvesHash();

  @$internal
  @override
  $StreamProviderElement<List<Shelf>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Shelf>> create(Ref ref) {
    return allShelves(ref);
  }
}

String _$allShelvesHash() => r'7ea1b5edf1db4a6aaa0c6000ab123e5b6ef4f657';

/// A single shelf by ID.

@ProviderFor(shelfById)
const shelfByIdProvider = ShelfByIdFamily._();

/// A single shelf by ID.

final class ShelfByIdProvider
    extends $FunctionalProvider<AsyncValue<Shelf?>, Shelf?, FutureOr<Shelf?>>
    with $FutureModifier<Shelf?>, $FutureProvider<Shelf?> {
  /// A single shelf by ID.
  const ShelfByIdProvider._({
    required ShelfByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'shelfByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$shelfByIdHash();

  @override
  String toString() {
    return r'shelfByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Shelf?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Shelf?> create(Ref ref) {
    final argument = this.argument as String;
    return shelfById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ShelfByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$shelfByIdHash() => r'8baa8658b8d2f29a3fceff5be7ee5aaf303d9a3f';

/// A single shelf by ID.

final class ShelfByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Shelf?>, String> {
  const ShelfByIdFamily._()
    : super(
        retry: null,
        name: r'shelfByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A single shelf by ID.

  ShelfByIdProvider call(String id) =>
      ShelfByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'shelfByIdProvider';
}

/// Shelves filtered by room ID.

@ProviderFor(shelvesByRoom)
const shelvesByRoomProvider = ShelvesByRoomFamily._();

/// Shelves filtered by room ID.

final class ShelvesByRoomProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Shelf>>,
          List<Shelf>,
          Stream<List<Shelf>>
        >
    with $FutureModifier<List<Shelf>>, $StreamProvider<List<Shelf>> {
  /// Shelves filtered by room ID.
  const ShelvesByRoomProvider._({
    required ShelvesByRoomFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'shelvesByRoomProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$shelvesByRoomHash();

  @override
  String toString() {
    return r'shelvesByRoomProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<Shelf>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Shelf>> create(Ref ref) {
    final argument = this.argument as String;
    return shelvesByRoom(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ShelvesByRoomProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$shelvesByRoomHash() => r'0256e09788e329cae06b60358c50f0ce1c829361';

/// Shelves filtered by room ID.

final class ShelvesByRoomFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<Shelf>>, String> {
  const ShelvesByRoomFamily._()
    : super(
        retry: null,
        name: r'shelvesByRoomProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Shelves filtered by room ID.

  ShelvesByRoomProvider call(String roomId) =>
      ShelvesByRoomProvider._(argument: roomId, from: this);

  @override
  String toString() => r'shelvesByRoomProvider';
}

/// All shelves with their book counts.

@ProviderFor(shelvesWithBookCount)
const shelvesWithBookCountProvider = ShelvesWithBookCountProvider._();

/// All shelves with their book counts.

final class ShelvesWithBookCountProvider
    extends
        $FunctionalProvider<
          List<ShelfWithBookCount>,
          List<ShelfWithBookCount>,
          List<ShelfWithBookCount>
        >
    with $Provider<List<ShelfWithBookCount>> {
  /// All shelves with their book counts.
  const ShelvesWithBookCountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shelvesWithBookCountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shelvesWithBookCountHash();

  @$internal
  @override
  $ProviderElement<List<ShelfWithBookCount>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<ShelfWithBookCount> create(Ref ref) {
    return shelvesWithBookCount(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ShelfWithBookCount> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ShelfWithBookCount>>(value),
    );
  }
}

String _$shelvesWithBookCountHash() =>
    r'3acf462eec09787f3aafae927737144b0eebd4bf';

/// Notifier for shelf CRUD operations.

@ProviderFor(ShelvesNotifier)
const shelvesProvider = ShelvesNotifierProvider._();

/// Notifier for shelf CRUD operations.
final class ShelvesNotifierProvider
    extends $NotifierProvider<ShelvesNotifier, void> {
  /// Notifier for shelf CRUD operations.
  const ShelvesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shelvesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shelvesNotifierHash();

  @$internal
  @override
  ShelvesNotifier create() => ShelvesNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$shelvesNotifierHash() => r'c9d39af12644e9a98bd92ffa696b2de21118196b';

/// Notifier for shelf CRUD operations.

abstract class _$ShelvesNotifier extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
