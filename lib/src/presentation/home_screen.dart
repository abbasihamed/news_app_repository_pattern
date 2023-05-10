import 'package:flutter/material.dart';
import 'package:news_repo_pattern/src/data/repository/news_repository.dart';
import 'package:news_repo_pattern/src/domain/entities/error.dart';
import 'package:news_repo_pattern/src/domain/entities/news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late NewsRepository newsRepository;

  @override
  void initState() {
    super.initState();
    // getData();
  }

  getData() async {
    newsRepository = NewsRepository();
    newsRepository.getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tesla News'),
      ),
      body: FutureBuilder(
          future: NewsRepository().getNews(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data is Error) {
              return Center(
                child: Text(snapshot.data.message),
              );
            }

            final List<News> data = snapshot.data;

            return ListView.builder(
              itemCount: (snapshot.data as List<News>).length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          spreadRadius: 1,
                          offset: Offset(0, 5),
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: SizedBox(
                              height: double.maxFinite,
                              width: 150,
                              child: Image.network(
                                data[index].urlToImage!,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(child: Text('error'));
                                },
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Title: ${data[index].title}'),
                                    const SizedBox(height: 12),
                                    Text(
                                      'Description:  ${data[index].description}',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                Text('Source: ${data[index].source.name}'),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
