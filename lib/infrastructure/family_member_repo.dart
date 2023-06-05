import 'package:be_gelled/domain/family_member/family_member_response.dart';
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

  Future<Either<CleanFailure, FamilyMembersResponse>> getFamilyMember() async {
    return await api.get(
      fromData: (json) => FamilyMembersResponse.fromMap(json),
      endPoint: APIRoute.GET_FAMILY_MEMBER,
    );
  }
}
