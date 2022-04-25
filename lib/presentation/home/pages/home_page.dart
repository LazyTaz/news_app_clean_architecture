import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/helpers/snack_bar_helper.dart';
import '../../../core/helpers/throttle_helper.dart';
import '../blocs/home_bloc.dart';
import '../widgets/article_cell_widget.dart';

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
  Throttle throttle = Throttle(
    timeInMS: 300,
    callBack: (value) {
      if (value == null || value == '') {
        magic.get<HomeBloc>().load();
      } else {
        magic.get<HomeBloc>().search(value!);
      }
    },
  );

  @override
  void dispose() {
    super.dispose();
    throttle.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onChanged: (value) => throttle.restart(value),
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
