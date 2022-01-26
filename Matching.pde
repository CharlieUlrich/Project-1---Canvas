//Matching Process
Result Recognize(ArrayList<int[]> pts, ArrayList<Unistroke> templates){
  double b = Double.POSITIVE_INFINITY;
  String name = "";
  for(int i = 0; i < templates.size(); i++){
    double d = distAtBestAngle(pts,templates.get(i),-45,+45,2); // CONVERT -45 45 and 2 to Rads
    if(d<b){
      b = d;
      name = templates.get(i).name;
    }
  }
  double score = (1-b)/(0.5*Math.sqrt(250^2+250^2));
  Result res = new Result(name,score);
  return res;
}
double distAtBestAngle(ArrayList<int[]> pts, Unistroke template, double angA, double angB, double angDif){
  double x1 = phi*angA + (1-phi)*angB;
  double f1 = distAtAngle(pts,template,x1);
  double x2 = (1-phi)*angA + phi*angB;
  double f2 = distAtAngle(pts,template,x2);
  while(Math.abs(angB-angA)>angDif){
    if(f1<f2){
      angB = x2;
      x2 = x1;
      f2 = f1;
      x1 = phi*angA + (1-phi)*angB;
      f2 = distAtAngle(pts,template,x1);
    }
    else{
      angA = x1;
      x1 = x2;
      f1 = f2;
      x1 = phi*angA + (1-phi)*angB;
      f2 = distAtAngle(pts,template,x2);
    }
  }
  return Math.min(f1,f2);
}

double distAtAngle(ArrayList<int[]> pts, Unistroke template, double angle){
    ArrayList<int[]> newPts = rotateBy(pts,angle);
    return pathDistance(newPts,template.unistrokes);
}

double pathDistance(ArrayList<int[]> p1, ArrayList<int[]> p2){
   double d = 0;
   for(int i = 0; i < p1.size(); i++){
      d+= Distance(p1.get(i),p2.get(i));
   } 
   return d / p1.size();
}

class Result{
  String name;
  double score;
  public Result(String n, double s){
     name = n;
     score = s;
  }
}
