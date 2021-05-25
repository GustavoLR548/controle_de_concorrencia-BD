import 'misc.dart';

bool ehRecuperavel(List<String> ts, String s) {
  bool result = true;

  var splitS = saComCommit(format(s), ts.length);

  print(splitS);

  return result;
}

List<String> saComCommit(List<String> splitS, int n) {
  List<String> saWithCommit = [];

  List<bool> commits = [];

  for (int i = 0; i < n + 1; i++) {
    commits.add(false);
  }

  for (int i = splitS.length - 1; i >= 0; i--) {
    int tsNumber = int.parse(splitS[i][1]);

    if (commits[tsNumber] == false) {
      commits[tsNumber] = true;
      saWithCommit.add('c${tsNumber}');
    }

    saWithCommit.add(splitS[i]);
  }

  saWithCommit = saWithCommit.reversed.toList();

  return saWithCommit;
}
