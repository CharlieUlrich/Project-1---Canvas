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

class Rectangle {
  int X;
  int Y;
  int Width;
  int Height;
  
  public Rectangle(int x, int y, int wid, int hei) {
    X = x;
    Y = y;
    Width = wid;
    Height = hei;
  }
  
}
double[] centroid(ArrayList<int[]> pts){
  double x=0, y=0;
  for(int i = 0; i < pts.size(); i++){
    x+=pts.get(i)[0];
    y+=pts.get(i)[1];
  }
  x/=pts.size();
  y/=pts.size();
  double[] centr = new double[2];
  centr[0]=x;
  centr[1]=y;
  return centr;
}

Rectangle BoundingBox(ArrayList<int[]> pts) {
  int minX = Integer.MAX_VALUE;
  int minY = Integer.MAX_VALUE;
  int maxX = Integer.MIN_VALUE;
  int maxY = Integer.MIN_VALUE;
  
  for (int i = 0; i < pts.size(); i++) {
    minX = Math.min(minX, pts.get(i)[0]);
    minY = Math.min(minY, pts.get(i)[1]);
    maxX = Math.max(maxX, pts.get(i)[0]);
    maxY = Math.max(maxY, pts.get(i)[1]);
  }
  return new Rectangle(minX, minY, maxX - minX, maxY - minY);
}

ArrayList<int[]> ScaleTo(ArrayList<int[]> pts, int size) {
  
  Rectangle box = BoundingBox(pts);
  ArrayList<int[]> newpts = new ArrayList<int[]>();
  
  for (int i = 0; i < pts.size(); i++) {
    int qx = pts.get(i)[0] * (size / box.Width);
    int qy = pts.get(i)[1] * (size / box.Height);
    int[] qp = new int[2];
    qp[0] = qx;
    qp[1] = qy;
    newpts.add(qp);
  }
    
  return newpts;
}

ArrayList<int[]> TranslateTo(ArrayList<int[]> pts, int[] pt) {
  
  double[] c = centroid(pts);
  ArrayList<int[]> newpts = new ArrayList<int[]>();
  
  for (int i = 0; i < pts.size(); i++) {
    int qx = pts.get(i)[0] + pt[0] - (int)c[0];
    int qy = pts.get(i)[1] + pt[1] - (int)c[1];
    int[] qp = new int[2];
    qp[0] = qx;
    qp[1] = qy;
    newpts.add(qp);
  }
  
  return newpts;
}

double Deg2Rad(double d) {
  return (d * Math.PI / 180.0);
}
