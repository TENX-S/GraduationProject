import 'dart:io';

import 'package:grpc/grpc.dart';

import '../models/user.dart';
import 'proto/auth.pbgrpc.dart';
import 'proto/post.pbgrpc.dart';

const host = '1.116.216.141';
const port = 8080;

class Client {
  late AuthenticateClient auth;
  late PostClient post;
  static final Client client = Client._connect(host, port);

  factory Client() {
    return client;
  }

  Client._connect(
    String host,
    int port,
  ) {
    final trustedRoot = File('assets/tls/server.crt').readAsBytesSync();
    ClientChannel chan = ClientChannel(
      host,
      port: port,
      options: ChannelOptions(
        credentials: ChannelCredentials.secure(certificates: trustedRoot),
        codecRegistry: CodecRegistry(
          codecs: const [
            GzipCodec(),
            IdentityCodec(),
          ],
        ),
      ),
    );
    auth = AuthenticateClient(chan);
    post = PostClient(chan);
  }

  Future<AuthReply> onLogin(User user) async => await auth.onLogin(AuthRequest(
        name: user.email,
        password: user.password,
      ));

  Future<AuthReply> onSignUp(User user) async =>
      await auth.onSignUp(AuthRequest(
        name: user.email,
        password: user.password,
      ));

  Future<PostReply> onQuery(String uuid) async =>
      await post.onQuery(PostRequest(id: uuid));

  Future<Posts> onFetchAll() async => await post.onFetchAll(Empty());

  Future<Posts> onSearch(String token) async =>
      await post.onSearch(Token(value: token));
}
