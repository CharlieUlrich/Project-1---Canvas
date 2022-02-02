import java.util.Random;

void random100() {
  
  for (int user = 2; user <= 11; user++) { // Subject
    ArrayList<Unistroke> temps = new ArrayList<Unistroke>();
    for (int j = 0; j < templates1.size(); j++) {
      if (templates1.get(j).sub == user) {
        temps.add(templates1.get(j));
      }
    }
    for (int ex = 1; ex <= 9; ex++) { 
      for (int i = 1; i <= 100; i++) {
        ArrayList<Unistroke> examples = new ArrayList<Unistroke>();
        ArrayList<Unistroke> candidates = new ArrayList<Unistroke>();
        Unistroke candidate;
        for (int g = 0; g < gestures.length; g++) {
          ArrayList<Unistroke> gests = new ArrayList<Unistroke>();
          for (int j = 0; j < temps.size(); j++) {
            if (temps.get(j).gesture.equals(gestures[g])) {
              gests.add(temps.get(j));
            }
          }
          
          // choose E templates from U,G set
          int[] indices = new Random().ints(0, 10).distinct().limit(ex).toArray();
          //System.out.println(temps.size());
          for (int j = 0; j < indices.length; j++) {
            examples.add(gests.get(indices[j]));
          }
          
          // choose 1 candidate from U,G set
          Random r = new Random();
          int cn = r.nextInt(indices.length);
          candidate = examples.get(cn);
          candidates.add(candidate);
          
          Result ok = Recognize(candidate.unistrokes, examples);

          examples.clear();
          gests.clear();
        }
      }
    }
    temps.clear();
  }
}
