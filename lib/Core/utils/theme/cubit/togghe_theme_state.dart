

import 'package:equatable/equatable.dart';

sealed class ToggheThemeState extends Equatable {
  const ToggheThemeState();

  @override
  List<Object> get props => [];
}

final class ToggheThemeInitial extends ToggheThemeState {}
