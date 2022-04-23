part of 'home_bloc.dart';

class HomeState extends Equatable {
  final News? news;
  final Failure? failure;

  const HomeState({required this.news, this.failure});

  factory HomeState.initial() {
    return const HomeState(news: null);
  }

  HomeState copyWith({News? Function()? news, Failure? Function()? failure}) {
    return HomeState(
      news: news != null ? news() : this.news,
      failure: failure != null ? failure() : this.failure,
    );
  }

  bool hasNews() => news != null && ((news!.totalResults ?? 0) > 0);

  @override
  List<Object?> get props => [news, failure];
}
