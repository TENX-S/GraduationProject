import 'package:grpc/grpc.dart';
import '../grpc/auth.pbgrpc.dart';
import '../models/user.dart';

const serverAddr = '10.0.2.2';
const serverPort = 8080;

abstract class Client {
  String? serverAddr;
  int? serverPort;

  Client({
    this.serverAddr,
    this.serverPort,
  });
}

class AuthClient extends Client {
  late AuthenticateClient stub;
  late ClientChannel channel;

  AuthClient({
    String? serverAddr,
    int? serverPort,
  }) : super(
    serverAddr: serverAddr,
    serverPort: serverPort,
  ) {
    ClientChannel channel = ClientChannel(
      serverAddr!,
      port: serverPort!,
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
    stub = AuthenticateClient(channel);
  }

  Future<AuthReply> onLogin(User user) async => await stub.onLogin(AuthRequest(
    name: user.name,
    password: user.password,
  ));

  Future<AuthReply> onSignUp(User user) async =>
      await stub.onSignUp(AuthRequest(
        name: user.name,
        password: user.password,
      ));
}
