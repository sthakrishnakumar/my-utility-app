import '../../../core/export.dart';

final utilityDataSourceProvider = Provider<UtilityDataSource>((ref) {
  return UtilityDataSourceImpl(
    apiClient: ref.watch(apiClientProvider),
  );
});

abstract class UtilityDataSource {
  Future<UtilityModel> getUtilityDs();
}

class UtilityDataSourceImpl extends UtilityDataSource {
  ApiClient apiClient;
  UtilityDataSourceImpl({
    required this.apiClient,
  });
  @override
  Future<UtilityModel> getUtilityDs() async {
    final response = await apiClient.request(ApiConst.myUtility);

    return UtilityModel.fromJson(response ?? {});
  }
}
