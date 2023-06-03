import 'package:be_gelled/domain/family_member/member_info_model.dart';

import '../utils/utils.dart';

class FamilyMemberRepo {
  final api = NetworkHandler.instance;

  Future<Either<CleanFailure, MemberInfoModel>> getFamilyMember() async {
    return await api.get(
      fromData: (json) => MemberInfoModel.fromMap(json),
      endPoint: APIRoute.ADD_FAMILY_MEMBER,
    );
  }
}
