import 'package:ebmrox_3version/tv_show/bloc/tv_show_bloc.dart';
import 'package:ebmrox_3version/tv_show/bloc/tv_show_event.dart';
import 'package:ebmrox_3version/tv_show/bloc/tv_show_state.dart';
import 'package:ebmrox_3version/tv_show/repository/model/tv_show_model.dart';
import 'package:ebmrox_3version/tv_show/view/tv_show_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search TV Shows',
            hintStyle: TextStyle(color: Colors.white),
          ),
          onChanged: (value) {
            if (value.length >= 2) {
              context.read<TVShowBloc>().add(SearchTVShowEvent(value));
            }
          },
        ),
      ),
      body: BlocBuilder<TVShowBloc, TVShowState>(
        builder: (context, state) {
          if (state is TVShowInitialState) {
            return const Center(
              child: Text('Type the show\'s name'),
            );
          } else if (state is TVShowLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
            );
          } else if (state is TVShowEmptyState) {
              return const Center(
                child: Text('Sorry, nothing found with this search'),
            );
          } else if (state is TVShowErrorState) {
              return const Center(
                child: Text('Sorry, we have trouble on server'),
            );
          } else if (state is TVShowLoadedState) {
              final List<TVShowModel> tvShows = state.shows;
              return ListView.builder(
                itemCount: tvShows.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: tvShows[index].image != null
                        ? Image.network(
                            tvShows[index].image!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            'https://via.placeholder.com/150',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                    title: Text(tvShows[index].name),
                    subtitle: tvShows[index].rating != null
                        ? Text("${tvShows[index].rating}")
                        : const Text("Rating is unapproachable"),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => DetailPage(
                          show: tvShows[index],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
