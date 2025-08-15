class GetMyTaskModel {
  GetMyTaskModel({
    required this.pendingApproval,
    required this.pendingRequest,
    required this.trainingInvitation,
  });
  late final int pendingApproval;
  late final int pendingRequest;
  late final int trainingInvitation;
  
  GetMyTaskModel.fromJson(Map<String, dynamic> json){
    pendingApproval = json['pendingApproval'];
    pendingRequest = json['pendingRequest'];
    trainingInvitation = json['trainingInvitation'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['pendingApproval'] = pendingApproval;
    data['pendingRequest'] = pendingRequest;
    data['trainingInvitation'] = trainingInvitation;
    return data;
  }
}