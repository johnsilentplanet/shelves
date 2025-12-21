// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rooms_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Stream of all rooms from the local database.

@ProviderFor(allRooms)
const allRoomsProvider = AllRoomsProvider._();

/// Stream of all rooms from the local database.

final class AllRoomsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Room>>,
          List<Room>,
          Stream<List<Room>>
        >
    with $FutureModifier<List<Room>>, $StreamProvider<List<Room>> {
  /// Stream of all rooms from the local database.
  const AllRoomsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allRoomsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allRoomsHash();

  @$internal
  @override
  $StreamProviderElement<List<Room>> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<Room>> create(Ref ref) {
    return allRooms(ref);
  }
}

String _$allRoomsHash() => r'20d92af42075748a23f96688df6e12aa540f32a5';

/// A single room by ID.

@ProviderFor(roomById)
const roomByIdProvider = RoomByIdFamily._();

/// A single room by ID.

final class RoomByIdProvider
    extends $FunctionalProvider<AsyncValue<Room?>, Room?, FutureOr<Room?>>
    with $FutureModifier<Room?>, $FutureProvider<Room?> {
  /// A single room by ID.
  const RoomByIdProvider._({
    required RoomByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'roomByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$roomByIdHash();

  @override
  String toString() {
    return r'roomByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Room?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Room?> create(Ref ref) {
    final argument = this.argument as String;
    return roomById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is RoomByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$roomByIdHash() => r'ff61b892ac99b26ac83198891d3f82d9339d0fb3';

/// A single room by ID.

final class RoomByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Room?>, String> {
  const RoomByIdFamily._()
    : super(
        retry: null,
        name: r'roomByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A single room by ID.

  RoomByIdProvider call(String id) =>
      RoomByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'roomByIdProvider';
}

/// All rooms with their shelf counts.

@ProviderFor(roomsWithShelfCount)
const roomsWithShelfCountProvider = RoomsWithShelfCountProvider._();

/// All rooms with their shelf counts.

final class RoomsWithShelfCountProvider
    extends
        $FunctionalProvider<
          List<RoomWithShelfCount>,
          List<RoomWithShelfCount>,
          List<RoomWithShelfCount>
        >
    with $Provider<List<RoomWithShelfCount>> {
  /// All rooms with their shelf counts.
  const RoomsWithShelfCountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'roomsWithShelfCountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$roomsWithShelfCountHash();

  @$internal
  @override
  $ProviderElement<List<RoomWithShelfCount>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<RoomWithShelfCount> create(Ref ref) {
    return roomsWithShelfCount(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<RoomWithShelfCount> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<RoomWithShelfCount>>(value),
    );
  }
}

String _$roomsWithShelfCountHash() =>
    r'f57507466eee242d63b364b4bdc4820f12f52b1a';

/// Notifier for room CRUD operations.

@ProviderFor(RoomsNotifier)
const roomsProvider = RoomsNotifierProvider._();

/// Notifier for room CRUD operations.
final class RoomsNotifierProvider
    extends $NotifierProvider<RoomsNotifier, void> {
  /// Notifier for room CRUD operations.
  const RoomsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'roomsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$roomsNotifierHash();

  @$internal
  @override
  RoomsNotifier create() => RoomsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$roomsNotifierHash() => r'ac855ce0288324e8752501875224f83bfd18b1f1';

/// Notifier for room CRUD operations.

abstract class _$RoomsNotifier extends $Notifier<void> {
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
