class PolicyModel{
  late final String message,status;
  late final PolicyData policyData;
  PolicyModel.fromJson(Map<String,dynamic>json){
    message = json['message']??'';
    status = json['message']??'';
    policyData = PolicyData.fromJson(json['data']);
  }
}
class PolicyData{
  late final String policy;
  PolicyData.fromJson(Map<String,dynamic>json){
    policy =json['policy']??'';
  }
}