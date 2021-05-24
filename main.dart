void main() {
  List<String> ts = [];
  
  ts.add('r1(x), r1(y), w1(x), r1(z)');
  ts.add('r2(z), r2(x), r2(y), w2(z)');
  ts.add('r3(y), r3(z), w3(y), r3(x)');
  var sa = 'r3(y), r2(z), r1(x), r2(x), r3(z), r2(y), w3(y), w2(z), w1(x), r3(x), r1(z)';
  
  bool resultado1 = ehEscalonada(ts,sa);
  
  print('Sa ' + (resultado1 ? 'eh escalonado!' : 'não é escalonado!'));
  
}

bool ehEscalonada(List<String> ts, String s) {
  bool result = true;
  var splitS = format(s);
  
  for(int i =0 ; i < ts.length; i++) { 
    var splitTS = format(ts[i]);
    
    print(splitTS);
  
    var splitS2 = splitS.where((element) => element.contains('${i+1}')).toList();
    
    print(splitS2);
    
    if(!areListsEqual(splitTS,splitS2)) {
        result = false;
        break;
    }
    
  }
  
  for(int i =0; i < splitS.length; i++) {
    
  }
  
  return result;
}


List<String> format(String s) {
  s = s.replaceAll(' ', '');
  var split = s.split(',');
  
  return split;
}

bool areListsEqual(var list1, var list2) {
  
    // check if both are lists
    if(!(list1 is List && list2 is List)
        // check if both have same length
        || list1.length!=list2.length) {
        return false;
    }
     
    // check if elements are equal
    for(int i=0;i<list1.length;i++) {
        if(list1[i]!=list2[i]) {
            return false;
        }
    }
     
    return true;
}

