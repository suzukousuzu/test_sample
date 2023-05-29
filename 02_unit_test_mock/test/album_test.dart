import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:unit_test_mock/album.dart';

import 'album_test.mocks.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
void main() {
  group('fetch_album', () {
    //成功した場合
    test('success', () async {
      final client = MockClient();
      when(
        client.get(
          Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
        ),
      ).thenAnswer((_) async {
        return http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200);
      });
      expect(await fetchAlbum(client), isA<Album>());
    });

    // 失敗した場合
    test('fail', () async {
      final client = MockClient();
      when(
        client.get(
          Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
        ),
      ).thenAnswer((realInvocation) async {
        return http.Response('Not found', 404);
      });
      expect(await fetchAlbum(client), throwsException);
    });
  });
}
