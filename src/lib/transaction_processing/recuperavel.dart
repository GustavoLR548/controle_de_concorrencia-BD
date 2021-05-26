import '../misc.dart';

List<List<String>> ehRecuperavel(List<String> ts, String s) {
  List<List<String>> result = [];

  var splitS = saComCommit(format(s), ts.length);

  var allCommits = splitS.where((element) => element.contains('c')).toList();

  for (int i = 0; i < allCommits.length; i++) {
    String nCommit = allCommits[i][1];

    var allRwithN =
        splitS.where((element) => element.contains('r$nCommit')).toList();

    for (int j = 0; j < allRwithN.length; j++) {
      int indexR =
          splitS.indexWhere((element) => element.contains(allRwithN[j]));

      var allWwithoutN = splitS
          .where((element) =>
              element.contains('w') &&
              !element.contains(nCommit) &&
              element.contains(splitS[indexR][3]))
          .toList();

      for (int k = 0; k < allWwithoutN.length; k++) {
        int indexW =
            splitS.indexWhere((element) => element.contains(allWwithoutN[k]));

        if (indexW > indexR) {
          break;
        } else {
          String commitNumber1 = splitS[indexW][1];
          String commitNumber2 = splitS[indexR][1];

          int indexCWS = splitS
              .indexWhere((element) => element.contains('c' + commitNumber1));

          int indexCW = allCommits
              .indexWhere((element) => element.contains(commitNumber1));
          int indexCR = allCommits
              .indexWhere((element) => element.contains(commitNumber2));

          if (indexCWS > indexR && indexCW > indexCR) {
            List<String> tmp = [];
            tmp.add(splitS[indexW]);
            tmp.add(splitS[indexR]);
            result.add(tmp);
          }
        }
      }
    }
  }

  if (result.length > 0) {
    print(
        'Essa operação não é recuperável, por conta das seguintes leituras sujas');
    print(result);
  } else {
    print('Essa leitura é recuperável');
  }

  return result;
}

List<String> saComCommit(List<String> splitS, int n) {
  List<String> saWithCommit = [];

  List<bool> commits = [];

  for (int i = 0; i < n; i++) {
    commits.add(false);
  }

  for (int i = splitS.length - 1; i >= 0; i--) {
    int tsNumber = int.parse(splitS[i][1]) - 1;

    if (commits[tsNumber] == false) {
      commits[tsNumber] = true;
      saWithCommit.add('c${tsNumber + 1}');
    }

    saWithCommit.add(splitS[i]);
  }

  saWithCommit = saWithCommit.reversed.toList();

  return saWithCommit;
}
