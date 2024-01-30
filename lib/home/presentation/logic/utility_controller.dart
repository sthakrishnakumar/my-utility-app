import '../../../core/export.dart';

final utilityControllerProvider =
    StateNotifierProvider<UtilityController, AsyncValue<UtilityModel>>((ref) {
  return UtilityController(
    ref.watch(utilityRepoProvider),
  );
});

class UtilityController extends StateNotifier<AsyncValue<UtilityModel>> {
  UtilityController(this.utilityRepository)
      : super(const AsyncValue.loading()) {
    getUtilityC();
  }
  UtilityRepository utilityRepository;
  getUtilityC() async {
    final data = await utilityRepository.getUtilityRepo();
    return data.fold(
      (l) => state = AsyncValue.error(
        l.message,
        StackTrace.fromString(l.message),
      ),
      (r) => state = AsyncValue.data(r),
    );
  }
}
