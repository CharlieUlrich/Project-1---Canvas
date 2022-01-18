ArrayList<int[]> points = new ArrayList<int[]>();
void setup(){
  //
  size(1280,720);
}

void draw(){
  background(255);
  drawButton(10, 10, 80, 60, "Clear");
  fill(0,255,0);
  for(int i = 0; i < points.size(); i++){
    strokeWeight(0);
    circle(points.get(i)[0],points.get(i)[1], 1);
  }
}

void mousePressed(){ 
   if(mouseX >10 && mouseX < 90 && mouseY > 10 && mouseY < 70){
     points.removeAll(points);
   }
   else{
   int[] a = new int[2];
   a[0] = mouseX;
   a[1] = mouseY;
   points.add(a);
   }
}

void mouseDragged(){
   if(!(mouseX >10 && mouseX < 90 && mouseY > 10 && mouseY < 70)){
   int[] a = new int[2];
   a[0] = mouseX;
   a[1] = mouseY;
   points.add(a);  
   }
}

void drawButton(int x, int y, int wid, int hei, String text) {
  fill(color(142, 201, 237));
  strokeWeight(5);
  stroke(0);
  rect(x, y, wid, hei, 10);
  textAlign(CENTER, CENTER);
  textSize(26);
  fill(0);
  text(text, x + (wid / 2), y + (hei / 2));
}
  
