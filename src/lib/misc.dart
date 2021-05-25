List<String> format(String s) {
  s = s.replaceAll(' ', '');
  var split = s.split(',');

  return split;
}

bool areListsEqual(var list1, var list2) {
  if (!(list1 is List && list2 is List)||
      list1.length != list2.length) 
    return false;

  for (int i = 0; i < list1.length; i++) 
    if (list1[i] != list2[i]) 
      return false;

  return true;
}