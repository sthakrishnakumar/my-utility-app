import '../../../../core/export.dart';

final utilityRepoProvider = Provider<UtilityRepository>((ref) {
  return UtilityRepositoryImpl(
      dataSource: ref.watch(utilityDataSourceProvider));
});

abstract class UtilityRepository {
  Future<Either<AppError, UtilityModel>> getUtilityRepo();
}

class UtilityRepositoryImpl extends UtilityRepository {
  UtilityDataSource dataSource;
  UtilityRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<AppError, UtilityModel>> getUtilityRepo() async {
    try {
      final data = await dataSource.getUtilityDs();
      return Right(data);
    } on DioException catch (e) {
      return Left(
        AppError(message: e.message.toString()),
      );
    }
  }
}
