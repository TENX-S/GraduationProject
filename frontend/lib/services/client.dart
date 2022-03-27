import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:grpc/grpc.dart';

import '../models/user.dart';
import 'proto/auth.pbgrpc.dart';
import 'proto/post.pbgrpc.dart';

late String? host;
const port = 8080;
var deviceInfo = DeviceInfoPlugin();

Future<void> confirmHost() async {
  if (Platform.isAndroid) {
    var androidInfo = await deviceInfo.androidInfo;
    if (androidInfo.isPhysicalDevice!) {
      host = '1.116.216.141';
    } else {
      host = '10.0.2.2';
    }
  } else if (Platform.isIOS) {
    var iosInfo = await deviceInfo.iosInfo;
    if (iosInfo.isPhysicalDevice) {
      host = '1.116.216.141';
    } else {
      host = '192.168.3.3';
    }
  }
}

class Client {
  late AuthenticateClient auth;
  late PostClient post;
  static final Client client = Client._connect(host!, port);

  factory Client() {
    return client;
  }

  Client._connect(
    String host,
    int port,
  ) {
    ClientChannel chan = ClientChannel(
      host,
      port: port,
      options: ChannelOptions(
        credentials: const ChannelCredentials.insecure(),
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
}
