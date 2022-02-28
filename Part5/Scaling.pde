//Scaling + Translation
ArrayList<double[]> ScaleTo(ArrayList<double[]> pts, double size) {
  
  Rectangle box = BoundingBox(pts);
  ArrayList<double[]> newpts = new ArrayList<double[]>();
  
  for (int i = 0; i < pts.size(); i++) {
    double qx = pts.get(i)[0] * (size / box.Width);
    double qy = pts.get(i)[1] * (size / box.Height);
    double[] qp = new double[2];
    qp[0] = qx;
    qp[1] = qy;
    newpts.add(qp);
  }
    
  return newpts;
}

ArrayList<double[]> TranslateTo(ArrayList<double[]> pts, double[] pt) {
  
  double[] c = centroid(pts);
  ArrayList<double[]> newpts = new ArrayList<double[]>();
  
  for (int i = 0; i < pts.size(); i++) {
    double qx = pts.get(i)[0] + pt[0] - (double)c[0];
    double qy = pts.get(i)[1] + pt[1] - (double)c[1];
    double[] qp = new double[2];
    qp[0] = qx;
    qp[1] = qy;
    newpts.add(qp);
  }
  
  return newpts;
}
class Rectangle {
  double X;
  double Y;
  double Width;
  double Height;
  
  public Rectangle(double x, double y, double wid, double hei) {
    X = x;
    Y = y;
    Width = wid;
    Height = hei;
  }
  
}


Rectangle BoundingBox(ArrayList<double[]> pts) {
  double minX = Integer.MAX_VALUE;
  double minY = Integer.MAX_VALUE;
  double maxX = Integer.MIN_VALUE;
  double maxY = Integer.MIN_VALUE;
  
  for (int i = 0; i < pts.size(); i++) {
    minX = Math.min(minX, pts.get(i)[0]);
    minY = Math.min(minY, pts.get(i)[1]);
    maxX = Math.max(maxX, pts.get(i)[0]);
    maxY = Math.max(maxY, pts.get(i)[1]);
  }
  return new Rectangle(minX, minY, maxX - minX, maxY - minY);
}
