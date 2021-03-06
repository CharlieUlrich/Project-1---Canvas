//Rotation
double indicAngle(ArrayList<double[]>pts){
   double[] cen = centroid(pts);
   return Math.atan2(cen[1]-pts.get(0)[1],cen[0]-pts.get(0)[0]); 
}

ArrayList<double[]> rotateBy(ArrayList<double[]>pts, double indAng){
  double[] cen = centroid(pts);
  ArrayList<double[]> newPts = new ArrayList<double[]>();
  for(int i = 0; i < pts.size(); i++){
    double[] newpt = new double[2];
    newpt[0] = (double)((pts.get(i)[0]-cen[0])*Math.cos(indAng)-(pts.get(i)[1]-cen[1])*sin((float)indAng)+cen[0]);
    newpt[1] = (double)((pts.get(i)[0]-cen[0])*Math.sin(indAng)+(pts.get(i)[1]-cen[1])*cos((float)indAng)+cen[1]);
    newPts.add(newpt);
  }
  return newPts;
}

double[] centroid(ArrayList<double[]> pts){
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
