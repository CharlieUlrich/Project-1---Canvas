import java.util.Random;

Table table;


void random100() {
  
  table = new Table();
  
  table.addColumn("User");
  table.addColumn("GestureType");
  table.addColumn("RandomIteration");
  table.addColumn("#ofTrainingExamples");
  table.addColumn("TotalSizeOfTrainingSet");
  table.addColumn("TrainingSetContents");
  table.addColumn("Candidate");
  table.addColumn("RecoResultGestureType");
  table.addColumn("CorrectIncorrect");
  table.addColumn("RecoResultScore");
  table.addColumn("RecoResultBestMatch");
  table.addColumn("RecoResultNBestSorted");
  
  
  double avgAccuracy = 0.0;
  int tot = 0;
  
  for (int user = 1; user <= 6; user++) { // Subject
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
        String tSetContents = "{";
        for (int g = 0; g < gestures.length; g++) {
          ArrayList<Unistroke> gests = new ArrayList<Unistroke>();
          for (int j = 0; j < temps.size(); j++) {
            println(temps.get(j).gesture, " ",gestures[g], " ", temps.get(j).name);
            if (temps.get(j).gesture.equals(gestures[g])) {
              gests.add(temps.get(j)); 
            }
          }
          
          // choose 1 candidate from U,G set
          Random r = new Random();
          println("a", temps.size());
          println("b", gests.size());
          int cn = r.nextInt(gests.size());
          candidate = gests.get(cn);
          gests.remove(cn);
          candidates.add(candidate);
          
          // choose E templates from U,G set
          int[] indices = new Random().ints(0, 9).distinct().limit(ex).toArray();
          for (int j = 0; j < indices.length; j++) {
            examples.add(gests.get(indices[j]));
            tSetContents += str(user) + "-" + gests.get(indices[j]).name + ", ";
          }
        }
        tSetContents += "}";
        
        for (int x = 0; x < candidates.size(); x++) {
          Result ok = Recognize(candidates.get(x).unistrokes, examples);
          int correct = 0;
          if (ok.name.substring(0, ok.name.length()-2).equals(gestures[x])) {
            correct = 1;
            avgAccuracy += 1;
          }
          tot += 1;
          
          
          TableRow row = table.addRow();
          row.setInt("User", user);
          row.setString("GestureType", gestures[x]);
          row.setInt("RandomIteration", i);
          row.setInt("#ofTrainingExamples", ex);
          row.setInt("TotalSizeOfTrainingSet", examples.size());
          row.setString("TrainingSetContents", tSetContents);
          String thing = str(user) + "-" + candidates.get(x).name;
          row.setString("Candidate", thing);
          row.setString("RecoResultGestureType", ok.name.substring(0, ok.name.length()-2));
          row.setInt("CorrectIncorrect", correct);
          row.setDouble("RecoResultScore", 1 - ok.score);
          String thing2 = str(user) + "-" + ok.name;
          row.setString("RecoResultBestMatch", thing2);
          ArrayList<Unistroke> help = new ArrayList<Unistroke>();
          ArrayList<Double> scores = new ArrayList<Double>();
          ArrayList<String> output = new ArrayList<String>();
          for (int l = 0; l < examples.size(); l++) {
            help.add(examples.get(l));
            Result y = Recognize(candidates.get(x).unistrokes, help); 
            help.clear();
            scores.add(y.score);
            output.add(str(user) + "-" + examples.get(l).name);
          }
          for (int outer = 0; outer < scores.size()-1; outer++) {
            for (int inner = 0; inner < scores.size()-outer-1; inner++) {
              if (scores.get(inner) > scores.get(inner+1)) {
                double temp1 = scores.get(inner);
                scores.set(inner, scores.get(inner+1));
                scores.set(inner+1, temp1);
                
                String temp2 = output.get(inner+1);
                output.set(inner, output.get(inner+1));
                output.set(inner+1, temp2);
              } 
            }
          }
          String cat = "{";
          for (int dd = 0; dd < scores.size(); dd++) {
            cat += output.get(dd) + "," + scores.get(dd) + ",";
          }
          cat += "}";
          row.setString("RecoResultNBestSorted", cat);
        }
      }
    }
    //System.out.println("fhiwehfow");
    temps.clear();
  }
  
  TableRow row = table.addRow();
  row = table.addRow();
  row.setString("User", "Total Avg Accuracy");
  row.setDouble("GestureType", avgAccuracy/tot);
  
  saveTable(table, "data/table.csv");
  
}
