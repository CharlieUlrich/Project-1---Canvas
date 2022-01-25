//Resampling
//Creating the Resample function where an arrayList of the points, and the number of points to resample to
ArrayList<int[]> Resample(ArrayList<int[]> pts, int n){
  double interval = PathLength(pts) / (n-1); //
  double dist = 0;
  ArrayList<int[]> newPts = new ArrayList<int[]>();
  newPts.add(pts.get(0));
  for(int i = 1; i < pts.size(); i++){
    double d = Distance(pts.get(i-1),pts.get(i));
    if((dist+d)>=1){
      int[] np = new int[2];
      np[0] = (int)(pts.get(i-1)[0] + ((interval-dist)/d)*(pts.get(i)[0]-pts.get(i-1)[0]));
      newPts.add(np);
      pts.add(i, np);
    }
    else
      dist += d;
  }
  return newPts;
}
//Rotation

//Scaling + Translation

//Matching Process

double Distance(int[] p1, int[] p2){
  double xDist = p1[0]-p2[0];
  double yDist = p1[1]-p2[1];
  return Math.sqrt(xDist*xDist + yDist*yDist);
}

double PathLength(ArrayList<int[]>pts){
  double len = 0;
  for(int i = 1; i < pts.size(); i++){
     len = len + Distance(pts.get(i-1),pts.get(i));
  }
  return len;
}
