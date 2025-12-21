import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/local/database.dart';

part 'database_provider.g.dart';

/// Provides the singleton Drift database instance.
@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) => AppDatabase();
