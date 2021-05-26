import '../misc.dart';

const letters = const ['x', 'y', 'z'];

bool ehEscalonada(List<String> ts, String s) {
  bool result = true;
  var splitS = format(s);

  for (int i = 0; i < ts.length; i++) {
    var splitTS = format(ts[i]);

    var splitS2 =
        splitS.where((element) => element.contains('${i + 1}')).toList();

    if (!areListsEqual(splitTS, splitS2)) {
      result = false;
      break;
    }
  }

  int conflitoCounter = 0;

  for (int i = 0; i < ts.length; i++) {
    List<String> splitLetter =
        splitS.where((element) => element.contains(letters[i])).toList();

    var splitWithR = splitLetter.where((element) => element.contains('r'));

    var splitWithW = splitLetter.where((element) => element.contains('w'));

    splitWithR.forEach((r) {
      splitWithW.forEach((w) {
        if (r[1] == w[1]) conflitoCounter++;
      });
    });
  }

  if (conflitoCounter < 2) result = false;

  print('Sa ' + (result ? 'eh escalonado!' : 'não é escalonado!'));

  return result;
}
