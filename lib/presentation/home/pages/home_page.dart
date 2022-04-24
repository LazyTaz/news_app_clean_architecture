import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/helpers/snack_bar_helper.dart';
import 'package:news_app/presentation/home/blocs/home_bloc.dart';
import 'package:news_app/presentation/home/widgets/article_cell_widget.dart';

import '../../../injector.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            Expanded(flex: 1, child: _HomePageSearchBar()),
            Expanded(flex: 9, child: _HomePageListView()),
          ],
        ),
      ),
    );
  }
}

class _HomePageSearchBar extends StatefulWidget {
  const _HomePageSearchBar({Key? key}) : super(key: key);

  @override
  State<_HomePageSearchBar> createState() => _HomePageSearchBarState();
}

class _HomePageSearchBarState extends State<_HomePageSearchBar> {
  Timer? timer;
  String? textValue;

  void _textChanged(String val) {
    textValue = val;

    if (timer != null) {
      timer?.cancel();
    }

    timer = Timer(const Duration(milliseconds: 300), () {
      if (textValue == null || textValue == '') {
        magic.get<HomeBloc>().load();
      } else {
        magic.get<HomeBloc>().search(textValue!);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onChanged: _textChanged,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          contentPadding: const EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          hintText: 'Rechercher',
        ),
      ),
    );
  }
}

class _HomePageListView extends StatelessWidget {
  const _HomePageListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: magic(),
      builder: (context, state) {
        if (!state.hasNews()) {
          return const Center(child: Text("No news :("));
        }

        return ListView.builder(
          itemCount: state.news!.articles?.length ?? 0,
          itemBuilder: (context, index) => InkWell(
            child: ArticleCellWidget(article: state.news!.articles![index]),
            onTap: () {
              context.goNamed('details', extra: state.news!.articles![index]);
            },
          ),
        );
      },
      listener: (context, state) {
        if (state.failure == null) return;

        showErrorSnackBack(context, state.failure!.message);
      },
    );
  }
}
