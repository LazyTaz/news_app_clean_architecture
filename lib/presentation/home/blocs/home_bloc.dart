import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/error/failure.dart';
import '../../../core/usecases/usecase.dart';

import '../../../domain/news/entities/news.dart';
import '../../../domain/news/usecases/get_top_news.dart';
import '../../../domain/news/usecases/search_news.dart';

part 'home_state.dart';
part 'home_events.dart';

class HomeBloc extends Bloc<Equatable, HomeState> {
  final GetTopNews getTopNews;
  final SearchNews searchNews;

  HomeBloc({
    required this.getTopNews,
    required this.searchNews,
  }) : super(HomeState.initial()) {
    on<HomeLoadEvent>(_handleLoadEvent);
    on<HomeSearchEvent>(_handleSearchEvent);
  }

  void load() => add(HomeLoadEvent());
  void search(String search) => add(HomeSearchEvent(search));

  void _handleLoadEvent(HomeLoadEvent event, Emitter emit) async {
    var result = await getTopNews(NoParams());

    result.fold(
      (l) => emit(state.copyWith(failure: () => l)),
      (r) => emit(state.copyWith(news: () => r, failure: () => null)),
    );
  }

  void _handleSearchEvent(HomeSearchEvent event, Emitter emit) async {
    var result = await searchNews(SearchNewsParam(event.search));

    result.fold(
      (l) => emit(state.copyWith(failure: () => l)),
      (r) => emit(state.copyWith(news: () => r, failure: () => null)),
    );
  }
}
