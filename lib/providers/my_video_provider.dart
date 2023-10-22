import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:video_player/video_player.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyVideoProvider with ChangeNotifier {
  VideoPlayerController? _vCont;
  VideoPlayerController? get getVidCont => _vCont;
  bool isSaved = false;
  late Database _database;

  MyVideoProvider() {
    _initializeDatabase();
  }

  Future<void> _initializeDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'video_progress.db');
    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE video_progress (
          id INTEGER PRIMARY KEY,
          path TEXT,
          position INTEGER
        )
      ''');
    });
  }

  void initializeVideoPlayer(String filePath) async {
    _vCont = VideoPlayerController.file(File(filePath))
      ..addListener(() => notifyListeners())
      ..setLooping(false);

    // Load video progress from SQLite
    final progressData = await loadConfigs(filePath);
    if (progressData != null) {
      final position = progressData['position'] as int;
      _vCont!.seekTo(Duration(milliseconds: position));
    }

    await _vCont!.initialize();
  }

  void isPlayOrPause(bool isPlay) {
    if (isPlay) {
      _vCont!.pause();
    } else {
      _vCont!.play();
    }
    notifyListeners();
  }

  Future<Map<String, dynamic>?> loadConfigs(String path) async {
    final maps = await _database.query(
      'video_progress',
      columns: ['position'],
      where: 'path = ?',
      whereArgs: [path],
    );

    if (maps.isNotEmpty) {
      return maps.first;
    }
    return null;
  }

  Future saveConfigs() async {
    try {
      final position = _vCont!.value.position;
      await _database.insert(
        'video_progress',
        {'path': _vCont!.dataSource, 'position': position.inMilliseconds},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      isSaved = true;
      notifyListeners();
    } catch (e) {
      print("Error al guardar: $e");
      isSaved = false;
      notifyListeners();
    }
  }
}