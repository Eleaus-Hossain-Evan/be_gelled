import 'package:be_gelled/domain/family_member/member_info_model.dart';

import '../utils/utils.dart';

class FamilyMemberRepo {
  final api = NetworkHandler.instance;

  Future<Either<CleanFailure, MemberInfoModel>> addFamilyMember(
      MemberInfoModel body) async {
    return await api.post(
      body: body.toMapAdd(),
      fromData: (json) => MemberInfoModel.fromMap(json),
      endPoint: APIRoute.ADD_FAMILY_MEMBER,
    );
  }
}
