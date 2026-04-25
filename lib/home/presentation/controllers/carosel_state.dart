part of 'carosel_cubit.dart';

@immutable
sealed class CaroselState {}

final class CaroselInitial extends CaroselState {}
final class CaroselLoading extends CaroselState {}
final class CaroselSuccess extends CaroselState {}
final class CaroselFaliure extends CaroselState {}
