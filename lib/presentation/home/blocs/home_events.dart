part of 'home_bloc.dart';

class HomeLoadEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeSearchEvent extends Equatable {
  final String search;

  const HomeSearchEvent(this.search);

  @override
  List<Object?> get props => [search];
}
