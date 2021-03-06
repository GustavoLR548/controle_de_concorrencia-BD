import 'lib/transaction_processing/escalonamento.dart';
import 'lib/transaction_processing/recuperavel.dart';
import 'lib/transaction_processing/serializavel.dart';

void main() {
  List<String> ts = [];

  ts.add('r1(x), r1(y), w1(x), r1(z)');
  ts.add('r2(z), r2(x), r2(y), w2(z)');
  ts.add('r3(y), r3(z), w3(y), r3(x)');
  var sa =
      'r2(z), r3(y), r1(y), r1(x), w1(x), r2(x), r3(z), r1(z), r2(y), w2(z), w3(y), r3(x)';

  print('Sa = ' + sa + '\n\n');

  ehEscalonada(ts, sa);
  ehRecuperavel(ts, sa);
  ehSerializavel(ts, sa);
}
