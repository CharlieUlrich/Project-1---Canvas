//Resampling
//Creating the Resample function where an arrayList of the points, and the number of points to resample to
ArrayList<double[]> Resample(ArrayList<double[]> pts, double n){
  double interval = PathLength(pts) / (n-1); //
  double dist = 0;
  ArrayList<double[]> newPts = new ArrayList<double[]>();
  newPts.add(pts.get(0));
  for(int i = 1; i < pts.size(); i++){
    double d = Distance(pts.get(i-1),pts.get(i));
    if((dist+d)>=interval){
      double[] np = new double[2];
      np[0] = (double)(pts.get(i-1)[0] + ((interval-dist)/d)*(pts.get(i)[0]-pts.get(i-1)[0]));
      np[1] = (double)(pts.get(i-1)[1] + ((interval-dist)/d)*(pts.get(i)[1]-pts.get(i-1)[1]));
      newPts.add(np);
      pts.set(i, np);
      dist=0;
    }
    else
      dist += d;
  }
  if(newPts.size() == n-1){
    newPts.add(new double[] {pts.get(pts.size()-1)[0],pts.get(pts.size()-1)[1]});
  }
  return newPts;
}

double Distance(double[] p1, double[] p2){
  double xDist = p2[0]-p1[0];
  double yDist = p2[1]-p1[1];
  return Math.sqrt(xDist*xDist + yDist*yDist);
}

double PathLength(ArrayList<double[]>pts){
  double len = 0;
  for(int i = 1; i < pts.size(); i++){
     len += Distance(pts.get(i-1),pts.get(i));
  }
  return len;
}
