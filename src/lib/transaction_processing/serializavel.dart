import '../misc.dart';

bool ehSerializavel(List<String> ts, String sa) {
  bool result = true;

  final saF = format(sa);

  List<List<int>> graph = [];

  for (int i = 0; i < ts.length; i++) {
    graph.add([]);
  }

  for (int i = 1; i < ts.length + 1; i++) {
    final allReads = saF.where((element) => element.contains('r$i')).toList();

    for (int j = 0; j < allReads.length; j++) {
      final allWReads = saF
          .where((element) =>
              element.contains('w') &&
              element.contains(allReads[j][3]) &&
              !element.contains(allReads[j][1]))
          .toList();

      if (allWReads.length == 0) continue;

      final indexR =
          saF.indexWhere((element) => element.compareTo(allReads[j]) == 0);

      final indexW =
          saF.indexWhere((element) => element.compareTo(allWReads[0]) == 0);

      //print(allReads[j]);
      //print(allWReads[0]);

      if (indexW < indexR) {
        final graphIndex = int.parse(allReads[j][1]) - 1;
        final trNumber = int.parse(allWReads[0][1]) - 1;

        //print(allReads[j][1] + '->' + allWReads[0][1]);
        //print('index: ' + graphIndex.toString() + ',' + trNumber.toString());
        if (!graph[graphIndex].contains(trNumber))
          graph[graphIndex].add(trNumber);
      } else {
        final graphIndex = int.parse(allReads[j][1]) - 1;
        final trNumber = int.parse(allWReads[0][1]) - 1;

        //print(allWReads[0][1] + '->' + allReads[j][1]);
        //print('index: ' + allReads[j][1] + ',' + allWReads[0][1]);
        if (!graph[graphIndex].contains(trNumber))
          graph[graphIndex].add(trNumber);
      }
    }
  }

  print(graph);

  result = findCycle(graph);

  print('Sa ' + (result ? 'eh serializavel' : 'não é serializavel!'));

  return findCycle(graph);
}

bool findCycle(List<List<int>> graph) {
  bool result = false;

  List<bool> visited = [];
  for (int i = 0; i < graph.length; i++) visited.add(false);

  for (int i = 0; i < graph.length; i++) {
    if (!visited[i]) {
      bool result = visit(graph, visited, i, -1);
      if (result) break;
    }
  }
  return result;
}

bool visit(List<List<int>> graph, List<bool> visited, int index, int root) {
  bool result = false;
  final adj = graph[index];

  visited[index] = true;

  for (int i = 0; i < adj.length; i++) {
    if (adj[i] == root) {
      result = true;
      break;
    }

    if (!visited[adj[i]]) result = visit(graph, visited, adj[i], index);
  }

  return result;
}
