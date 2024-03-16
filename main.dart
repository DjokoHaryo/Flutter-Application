// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Book App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BookListPage(),
    );
  }
}

class BookListPage extends StatelessWidget {
  final List<Map<String, String>> books = [
    {"Mapel": "Matematika", "Master Teacher": "Bu Febri"},
    {"Mapel": "Fisika", "Master Teacher": "Bu Esthi"},
    {"Mapel": "Kimia", "Master Teacher": "Bu Fiud"},
    {"Mapel": "Biologi", "Master Teacher": "Bu Mutmainah"}
  ];
  final Map<String, List<String>> bookChapters = {
    "Kimia": [
      "Stokiometri",
      "Hidrokarbon",
      "Termokimia",
      "Laju Reaksi",
    ],
    "Biologi": [
      "Stokiometri",
      "Hidrokarbon",
      "Termokimia",
      "Laju Reaksi",
    ],
    "Fisika": [
      'Hukum Newton',
      'Gelombang Elektromagnetik',
      'Teori Relativitas',
      'Fisika Kuantum',
    ],
    "Matematika": [
      'Polinomial',
      'Suku Banyak',
      'Matriks',
      'Transformasi Geometri',
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mau Belajar Apah :3',
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              books[index]['Mapel']!,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '${books[index]['Master Teacher']}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailPage(
                    title: books[index]['Mapel']!,
                    author: books[index]['Master Teacher']!,
                    chapters: bookChapters[books[index]['Mapel']] ?? [],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class BookDetailPage extends StatelessWidget {
  final String title;
  final String author;
  final List<String> chapters;

  const BookDetailPage({
    required this.title,
    required this.author,
    required this.chapters,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Semua Bab',
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Mapel: $title',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              'Master Teacher: $author',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'Daftar Bab:',
              style: TextStyle(
                fontSize: 16,
                height: 2,
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                children: List.generate(chapters.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChapterDetailPage(
                            title: chapters[index],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.lightBlueAccent,
                      elevation: 5,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Bab ${index + 1}: ${chapters[index]}',
                                  style: TextStyle(fontSize: 14),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                // Image.asset(
                                //   'assets/images/You.png',
                                //   width: 100,
                                //   height: 100,
                                // ),
                              ]),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChapterDetailPage extends StatelessWidget {
  final String title;

  const ChapterDetailPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'Konten untuk bab $title akan ditampilkan di sini',
          style: const TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
