import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/car/model/car_service_model.dart';
import '../../domain/profile/review_body.dart';
import '../../infrastructure/profile_repo.dart';
import '../../route/go_router.dart';
import '../../utils/utils.dart';
import '../global.dart';
import '../local_storage/storage_handler.dart';
import 'profile_state.dart';

final profileProvider = StateNotifierProvider<ProfileNotifier, ProfileState>(
  (ref) => ProfileNotifier(ref, ProfileRepo()),
  name: 'otherProblemProvider',
);

class ProfileNotifier extends StateNotifier<ProfileState> {
  final Ref ref;
  final ProfileRepo repo;
  ProfileNotifier(this.ref, this.repo) : super(ProfileState.init());

  Future<void> getOnGoingPackages() async {
    state = state.copyWith(loading: true);
    final result = await repo.getOnGoingPackages();
    result.fold(
      (l) => state = state.copyWith(
        loading: false,
        failure: l,
      ),
      (r) => state = state.copyWith(
        loading: false,
        onGoingPackages: r.data,
      ),
    );
  }

  void getCompletedPackages() async {
    state = state.copyWith(loading: true);
    final result = await repo.getCompletedPackages();
    result.fold(
      (l) => state = state.copyWith(
        loading: false,
        failure: l,
      ),
      (r) => state = state.copyWith(
        loading: false,
        completedPackages: r.data,
      ),
    );
  }

  void submitReview(ReviewBody body) async {
    state = state.copyWith(loading: true);
    final result = await repo.submitReviewRating(body);
    result.fold(
      (l) {
        showErrorToast(l.error);
        return state = state.copyWith(
          loading: false,
          failure: l,
        );
      },
      (r) {
        getCompletedPackages();
        return state = state.copyWith(
          loading: false,
        );
      },
    );
  }

  void getAllCarService() async {
    state = state.copyWith(loading: true);

    final result = await repo.getAllCarService();
    result.fold(
      (l) => state = state.copyWith(
        loading: false,
        failure: l,
      ),
      (r) {
        ref.read(hiveProvider).put(KStrings.myCar, r.toJson());
        Logger.d(
            'car service list: ${ref.read(hiveProvider).get(KStrings.myCar)}');
        return state = state.copyWith(
          loading: false,
          carServiceList: r.data,
        );
      },
    );
  }

  void addCarService(String carId) async {
    state = state.copyWith(loading: true);

    final result = await repo.addCarService(carId);
    result.fold(
      (l) {
        showErrorToast(l.error);
        return state = state.copyWith(
          loading: false,
          failure: l,
        );
      },
      (r) {
        final list = state.carServiceList.lock.add(r.data);
        ref.read(routerProvider).pop();
        return state = state.copyWith(
          loading: false,
          carServiceList: list.unlock,
        );
      },
    );
  }

  void updateCarService(CarServiceModel model) async {
    state = state.copyWith(loading: true);
    final result = await repo.updateCarService(model);
    result.fold(
      (l) => state = state.copyWith(
        loading: false,
        failure: l,
      ),
      (r) {
        final index = state.carServiceList.lock.indexWhere(
          (element) => element.id == r.data.id,
        );
        final list = state.carServiceList.lock.replace(index, r.data);
        ref.read(routerProvider).pop();
        return state = state.copyWith(
          loading: false,
          carServiceList: list.unlock,
        );
      },
    );
  }
}
