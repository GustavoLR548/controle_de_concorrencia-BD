import 'lib/escalonamento.dart';
import 'lib/recuperavel.dart';

void main() {
  List<String> ts = [];

  ts.add('r1(x), r1(y), w1(x), r1(z)');
  ts.add('r2(z), r2(x), r2(y), w2(z)');
  ts.add('r3(y), r3(z), w3(y), r3(x)');
  var sa =
      'r3(y), r2(z), r1(x), r2(x), r3(z), r2(y), w3(y), r1(y), w2(z), w1(x), r3(x), r1(z)';

  print('Sa = ' + sa + '\n\n');

  ehEscalonada(ts, sa);
  ehRecuperavel(ts, sa);
}
