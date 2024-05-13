part of 'policy_bloc.dart';

@immutable
sealed class PolicyState {}

final class PolicyInitial extends PolicyState {}
final class PolicySuccess extends PolicyState{
  final PolicyData policyData;

  PolicySuccess({required this.policyData});
}
final class PolicyLoading extends PolicyState{}
final class PolicyFailure extends PolicyState{}