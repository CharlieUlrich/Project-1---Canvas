//Instantiating the arrayList which holds arrays of doubles
//Each array is 1x2 and holds the x and y coordinates for each pixel drawn
ArrayList<double[]> points = new ArrayList<double[]>();
ArrayList<String> xmlPaths = new ArrayList<String>();
class Unistroke {
  String name;
  ArrayList<double[]> unistrokes = new ArrayList<double[]>();
  int sub;
  public Unistroke(String n, ArrayList<double[]> unis, int num) {
    name = n;
    sub = num;
    for(int i = 0; i < unis.size(); i++)
      unistrokes.add(unis.get(i));
  }
}
ArrayList<Unistroke> templates1 = new ArrayList<Unistroke>();
double phi;
String info;
//Function called at the start of the progra, creates the canvas of size 1280x720
void setup(){
  size(250,250);
  phi = 0.5 * (-1.0 + Math.sqrt(5.0));
  info = "Result: ";
  String path = dataPath("");
  File dir = new File(path);
  readIn(dir);
    
}

//Draw is called each time the screen is refreshed, the default framerate is 60fps
//And therefore, the draw funtion is called 60 times per second
void draw(){
  //Sets the background of the window / canvas to white
  background(255);
  //Calls the draw button function creating a button that clears the canvas
  drawButton(10, 10, 40, 20, "Clear");
  drawButton(0,230,250,20,info);
  //Changes the color being drawn to green
  fill(0,255,0);
  //Loop that goes through the arrayList of pixels drawing a circle with a 1 pixel
  //Radius at each podouble
  for(int i = 0; i < points.size(); i++){
    strokeWeight(0);
    //Circle is called passing in the x and y coordinates drawing a circle of radius
    //1 at the location
    circle((int)points.get(i)[0],(int)points.get(i)[1], 1);
  }
}

//Whenever the mouse is pressed this function is called
void mousePressed(){ 
   //If statement check if the coordinates of the mouse were over the clear button 
   //When pressed
   if(mouseX >10 && mouseX < 50 && mouseY > 10 && mouseY < 30){
     //If it was over the button it empties the arrayList
     points.removeAll(points);
     info = "Result: ";
   }
   else{
   //If it wasn't over the button then a new array of size 2 is created, within it
   //The x and y coordinates are stored of the mouse are stored and this array
   //Is added to the arrayLsit
   double[] a = new double[2];
   a[0] = mouseX;
   a[1] = mouseY;
   points.add(a);
   }
}

//This function is called when the mouse is dragged, it has the same functionality
//As mouse clicked, except it doesn't clear the canvas / arrayList if the mouse is
//Dragged over the mouse button, it only clears the canvas if the button is clicked
void mouseDragged(){
   if(!(mouseX >10 && mouseX < 50 && mouseY > 10 && mouseY < 30)){
   double[] a = new double[2];
   a[0] = mouseX;
   a[1] = mouseY;
   points.add(a);  
   }
//   if(points.size()>1)
//     checkAdj();
}

void mouseReleased(){
   if(points.size()>10){
   ArrayList<double[]> pts = Resample(points,64);
   System.out.println(1);
   double rads = indicAngle(pts);
   System.out.println(2);
   pts = rotateBy(pts,-rads);
    System.out.println(3);
   pts = ScaleTo(pts,250);
    System.out.println(4);
   pts = TranslateTo(pts,new double[]{0,0});
    System.out.println(5);
   Result res = Recognize(pts,templates1);
   info = "Result: " + res.name + " (" + ((double)Math.round(res.score*100))  /100 + ")"; 
   System.out.println("Template: " + res.name);
   System.out.println("Score: " + res.score);
   }
}

void checkAdj(){
  /*while((((Math.abs(points.get(points.size()-2)[0]))-(Math.abs(points.get(points.size()-1)[0])))>1) && ((Math.abs(points.get(points.size()-2)[1]))-(Math.abs(points.get(points.size()-1)[1])))>1){
    
  }*/
  char alt = 'x';
  while(true){
   double[]p1=new double[2];
    p1 = points.get(points.size()-2);
   double[]p2=new double[2];
    p2 = points.get(points.size()-1); 
   double[]add = new double[2];
   if(((p2[0]-p1[0])>1) && alt=='x'){
     add[0] = p1[0]+1;
     add[1] = p1[1];
     points.add(add);
   }
   else if(((p2[0]-p1[0])<-1) && alt=='x'){
     add[0] = p1[0]-1;
     add[1] = p1[1];
     points.add(add);     
   }
   else if(((p2[1]-p1[1])>1) && alt=='y'){
     add[0] = p1[0];
     add[1] = p1[1]+1;
     points.add(add);
   }
   else if(((p2[1]-p1[1])<-1) && alt=='y'){
     add[0] = p1[0];
     add[1] = p1[1]-1;
     points.add(add);
   }
   else
     break;
   if(alt=='x')
     alt = 'y';
   else
     alt = 'x';
   
  }
}
//This function is usedto draw a button to the window, the x and y coordinates are
//Passed in as well as the width, weight, and text of the button
void drawButton(int x, int y, int wid, int hei, String text) {
  //Sets the color of the button
  fill(color(142, 201, 237));
  //Sets the weight for the border of the button
  strokeWeight(1);
  stroke(0);
  //The function draws a rectangle with the x, and y coordinates, as well as the
  //Width and height
  rect(x, y, wid, hei, 10);
  //This sets the mode for the text to be centered on the coordinates
  textAlign(CENTER, CENTER);
  //Sets the text size 
  textSize(13);
  //Sets the color of the text to black
  fill(0);
  //Draws the text to the window with the passed in text, x, y, width and height
  text(text, x + (wid / 2), y + (hei / 2));
}
  
  
    //shape.add(new double[] { 137,139}); shape.add(new double[] { 135,141}); shape.add(new double[] { 133,144});shape.add(new double[] { 132,146}); shape.add(new double[] { 130,149});shape.add(new double[] { 128,151});shape.add(new double[] { 126,155});shape.add(new double[] { 123,160});shape.add(new double[] { 120,166});shape.add(new double[] { 116,171});shape.add(new double[] { 112,177});
    //shape.add(new double[] { 107,183});shape.add(new double[] { 102,188});shape.add(new double[] { 100,191});shape.add(new double[] { 95,195});shape.add(new double[] { 90,199});shape.add(new double[] { 86,203});shape.add(new double[] { 82,206});shape.add(new double[] { 80,209});shape.add(new double[] { 75,213});shape.add(new double[] { 73,213});shape.add(new double[] { 70,216});
    //shape.add(new double[] { 67,219});shape.add(new double[] { 64,221});shape.add(new double[] { 61,223});shape.add(new double[] { 60,225});shape.add(new double[] { 62,226});shape.add(new double[] { 65,225});shape.add(new double[] { 67,226});shape.add(new double[] { 74,226});shape.add(new double[] { 77,227});shape.add(new double[] { 85,229});shape.add(new double[] { 91,230});
    //shape.add(new double[] { 99,231});shape.add(new double[] { 108,232});shape.add(new double[] { 116,233});shape.add(new double[] { 125,233});shape.add(new double[] { 134,234});shape.add(new double[] { 145,233});shape.add(new double[] { 153,232});shape.add(new double[] { 160,233});shape.add(new double[] { 170,234});shape.add(new double[] { 177,235});shape.add(new double[] { 179,236});
    //shape.add(new double[] { 186,237});shape.add(new double[] { 193,238});shape.add(new double[] { 198,239});shape.add(new double[] { 200,237});shape.add(new double[] { 202,239});shape.add(new double[] { 204,238});shape.add(new double[] { 206,234});shape.add(new double[] { 205,230});shape.add(new double[] { 202,222});shape.add(new double[] { 197,216});shape.add(new double[] { 192,207});
    //shape.add(new double[] { 186,198});shape.add(new double[] { 179,189});shape.add(new double[] { 174,183}); shape.add(new double[] { 170,178});shape.add(new double[] { 164,171});shape.add(new double[] { 161,168});shape.add(new double[] { 154,160});shape.add(new double[] { 148,155});shape.add(new double[] { 143,150});shape.add(new double[] { 138,148});shape.add(new double[] { 136,148});
    //Unistroke triangle = new Unistroke("triangle", shape);
    //shape.clear();    
    
    //shape.add(new double[] { 87,142});shape.add(new double[] { 89,145});shape.add(new double[] { 91,148});shape.add(new double[] { 93,151});shape.add(new double[] { 96,155});shape.add(new double[] { 98,157});shape.add(new double[] { 100,160});shape.add(new double[] { 102,162});shape.add(new double[] { 106,167});shape.add(new double[] { 108,169});shape.add(new double[] { 110,171});
    //shape.add(new double[] { 115,177});shape.add(new double[] { 119,183});shape.add(new double[] { 123,189});shape.add(new double[] { 127,193});shape.add(new double[] { 129,196});shape.add(new double[] { 133,200});shape.add(new double[] { 137,206});shape.add(new double[] { 140,209});shape.add(new double[] { 143,212});shape.add(new double[] { 146,215});shape.add(new double[] { 151,220});
    //shape.add(new double[] { 153,222});shape.add(new double[] { 155,223});shape.add(new double[] { 157,225});shape.add(new double[] { 158,223});shape.add(new double[] { 157,218});shape.add(new double[] { 155,211});shape.add(new double[] { 154,208});shape.add(new double[] { 152,200});shape.add(new double[] { 150,189});shape.add(new double[] { 148,179});shape.add(new double[] { 147,170});
    //shape.add(new double[] { 147,158});shape.add(new double[] { 147,148});shape.add(new double[] { 147,141});shape.add(new double[] { 147,136});shape.add(new double[] { 144,135});shape.add(new double[] { 142,137});shape.add(new double[] { 140,139});shape.add(new double[] { 135,145});shape.add(new double[] { 131,152});shape.add(new double[] { 124,163});shape.add(new double[] { 116,177});
    //shape.add(new double[] { 108,191});shape.add(new double[] { 100,206});shape.add(new double[] { 94,217});shape.add(new double[] { 91,222});shape.add(new double[] { 89,225});shape.add(new double[] { 87,226});shape.add(new double[] { 87,224});
    //Unistroke x = new Unistroke("x", shape);
    //shape.clear();
    
    //shape.add(new double[] { 78,149});shape.add(new double[] { 78,153});shape.add(new double[] { 78,157});shape.add(new double[] { 78,160});shape.add(new double[] { 79,162});shape.add(new double[] { 79,164});shape.add(new double[] { 79,167});shape.add(new double[] { 79,169});shape.add(new double[] { 79,173});shape.add(new double[] { 79,178});shape.add(new double[] { 79,183});
    //shape.add(new double[] { 80,189});shape.add(new double[] { 80,193});shape.add(new double[] { 80,198});shape.add(new double[] { 80,202});shape.add(new double[] { 81,208});shape.add(new double[] { 81,210});shape.add(new double[] { 81,216});shape.add(new double[] { 82,222});shape.add(new double[] { 82,224});shape.add(new double[] { 82,227});shape.add(new double[] { 83,229});
    //shape.add(new double[] { 83,231});shape.add(new double[] { 85,230});shape.add(new double[] { 88,232});shape.add(new double[] { 90,233});shape.add(new double[] { 92,232});shape.add(new double[] { 94,233});shape.add(new double[] { 99,232});shape.add(new double[] { 102,233});shape.add(new double[] { 106,233});shape.add(new double[] { 109,234});shape.add(new double[] { 117,235});
    //shape.add(new double[] { 123,236});shape.add(new double[] { 126,236});shape.add(new double[] { 135,237});shape.add(new double[] { 142,238});shape.add(new double[] { 145,238});shape.add(new double[] { 152,238});shape.add(new double[] { 154,239});shape.add(new double[] { 165,238});shape.add(new double[] { 174,237});shape.add(new double[] { 179,236});
    //shape.add(new double[] { 186,235});shape.add(new double[] { 191,235});shape.add(new double[] { 195,233});shape.add(new double[] { 197,233});shape.add(new double[] { 200,233});shape.add(new double[] { 201,235});shape.add(new double[] { 201,233});shape.add(new double[] { 199,231});shape.add(new double[] { 198,226});shape.add(new double[] { 198,220});
    //shape.add(new double[] { 196,207});shape.add(new double[] { 195,195});shape.add(new double[] { 195,181});shape.add(new double[] { 195,173});shape.add(new double[] { 195,163});shape.add(new double[] { 194,155});shape.add(new double[] { 192,145});shape.add(new double[] { 192,143});shape.add(new double[] { 192,138});shape.add(new double[] { 191,135});
    //shape.add(new double[] { 191,133});shape.add(new double[] { 191,130});shape.add(new double[] { 190,128});shape.add(new double[] { 188,129});shape.add(new double[] { 186,129});shape.add(new double[] { 181,132});shape.add(new double[] { 173,131});shape.add(new double[] { 162,131});shape.add(new double[] { 151,132});shape.add(new double[] { 149,132});
    //shape.add(new double[] { 138,132});shape.add(new double[] { 136,132});shape.add(new double[] { 122,131});shape.add(new double[] { 120,131});shape.add(new double[] { 109,130});shape.add(new double[] { 107,130});shape.add(new double[] { 90,132});shape.add(new double[] { 81,133});shape.add(new double[] { 76,133 });
    //Unistroke rectangle = new Unistroke("rectangle", shape);
    //shape.clear();
    
    //shape.add(new double[] { 127,141});shape.add(new double[] { 124,140});shape.add(new double[] { 120,139});shape.add(new double[] { 118,139});shape.add(new double[] { 116,139});shape.add(new double[] { 111,140});shape.add(new double[] { 109,141});shape.add(new double[] { 104,144});shape.add(new double[] { 100,147});shape.add(new double[] { 96,152});
    //shape.add(new double[] { 93,157});shape.add(new double[] { 90,163});shape.add(new double[] { 87,169});shape.add(new double[] { 85,175});shape.add(new double[] { 83,181});shape.add(new double[] { 82,190});shape.add(new double[] { 82,195});shape.add(new double[] { 83,200});shape.add(new double[] { 84,205});shape.add(new double[] { 88,213});shape.add(new double[] { 91,216});
    //shape.add(new double[] { 96,219});shape.add(new double[] { 103,222});shape.add(new double[] { 108,224});shape.add(new double[] { 111,224});shape.add(new double[] { 120,224});shape.add(new double[] { 133,223});shape.add(new double[] { 142,222});shape.add(new double[] { 152,218});shape.add(new double[] { 160,214});shape.add(new double[] { 167,210});shape.add(new double[] { 173,204});
    //shape.add(new double[] { 178,198});shape.add(new double[] { 179,196});shape.add(new double[] { 182,188});shape.add(new double[] { 182,177});shape.add(new double[] { 178,167});shape.add(new double[] { 170,150});shape.add(new double[] { 163,138});shape.add(new double[] { 152,130});shape.add(new double[] { 143,129});shape.add(new double[] { 140,131});shape.add(new double[] { 129,136});
    //shape.add(new double[] { 126,139});
    //Unistroke circle = new Unistroke("circle", shape);
    //shape.clear();
    
    //shape.add(new double[] { 91,185});shape.add(new double[] { 93,185});shape.add(new double[] { 95,185});shape.add(new double[] { 97,185});shape.add(new double[] { 100,188});shape.add(new double[] { 102,189});shape.add(new double[] { 104,190});shape.add(new double[] { 106,193});shape.add(new double[] { 108,195});shape.add(new double[] { 110,198});shape.add(new double[] { 112,201});
    //shape.add(new double[] { 114,204});shape.add(new double[] { 115,207});shape.add(new double[] { 117,210});shape.add(new double[] { 118,212});shape.add(new double[] { 120,214});shape.add(new double[] { 121,217});shape.add(new double[] { 122,219});shape.add(new double[] { 123,222});shape.add(new double[] { 124,224});shape.add(new double[] { 126,226});shape.add(new double[] { 127,229});
    //shape.add(new double[] { 129,231});shape.add(new double[] { 130,233});shape.add(new double[] { 129,231});shape.add(new double[] { 129,228});shape.add(new double[] { 129,226});shape.add(new double[] { 129,224});shape.add(new double[] { 129,221});shape.add(new double[] { 129,218});shape.add(new double[] { 129,212});shape.add(new double[] { 129,208});shape.add(new double[] { 130,198});
    //shape.add(new double[] { 132,189});shape.add(new double[] { 134,182});shape.add(new double[] { 137,173});shape.add(new double[] { 143,164});shape.add(new double[] { 147,157});shape.add(new double[] { 151,151});shape.add(new double[] { 155,144});shape.add(new double[] { 161,137});shape.add(new double[] { 165,131});shape.add(new double[] { 171,122});shape.add(new double[] { 174,118});
    //shape.add(new double[] { 176,114});shape.add(new double[] { 177,112});shape.add(new double[] { 177,114});shape.add(new double[] { 175,116});shape.add(new double[] { 173,118});
    //Unistroke check = new Unistroke("check", shape);
    //shape.clear();
    
    //shape.add(new double[] { 79,245});shape.add(new double[] { 79,242});shape.add(new double[] { 79,239});shape.add(new double[] { 80,237});shape.add(new double[] { 80,234});shape.add(new double[] { 81,232});shape.add(new double[] { 82,230});shape.add(new double[] { 84,224});shape.add(new double[] { 86,220});shape.add(new double[] { 86,218});shape.add(new double[] { 87,216});
    //shape.add(new double[] { 88,213});shape.add(new double[] { 90,207});shape.add(new double[] { 91,202});shape.add(new double[] { 92,200});shape.add(new double[] { 93,194});shape.add(new double[] { 94,192});shape.add(new double[] { 96,189});shape.add(new double[] { 97,186});shape.add(new double[] { 100,179});shape.add(new double[] { 102,173});shape.add(new double[] { 105,165});
    //shape.add(new double[] { 107,160});shape.add(new double[] { 109,158});shape.add(new double[] { 112,151});shape.add(new double[] { 115,144});shape.add(new double[] { 117,139});shape.add(new double[] { 119,136});shape.add(new double[] { 119,134});shape.add(new double[] { 120,132});shape.add(new double[] { 121,129});shape.add(new double[] { 122,127});
    //shape.add(new double[] { 124,125});shape.add(new double[] { 126,124});shape.add(new double[] { 129,125});shape.add(new double[] { 131,127});shape.add(new double[] { 132,130});shape.add(new double[] { 136,139});shape.add(new double[] { 141,154});shape.add(new double[] { 145,166});shape.add(new double[] { 151,182});shape.add(new double[] { 156,193});
    //shape.add(new double[] { 157,196});shape.add(new double[] { 161,209});shape.add(new double[] { 162,211});shape.add(new double[] { 167,223});shape.add(new double[] { 169,229});shape.add(new double[] { 170,231});shape.add(new double[] { 173,237});shape.add(new double[] { 176,242});shape.add(new double[] { 177,244});shape.add(new double[] { 179,250});
    //shape.add(new double[] { 181,255});shape.add(new double[] { 182,257 });
    //Unistroke caret = new Unistroke("caret", shape);
    //shape.clear();
    
    //shape.add(new double[] { 307,216});shape.add(new double[] { 333,186});shape.add(new double[] { 356,215});shape.add(new double[] { 375,186});shape.add(new double[] { 399,216});shape.add(new double[] { 418,186 });
    //Unistroke zigzag = new Unistroke("zig-zag", shape);
    //shape.clear();
    
    //shape.add(new double[] { 68,222});shape.add(new double[] { 70,220});shape.add(new double[] { 73,218});shape.add(new double[] { 75,217});shape.add(new double[] { 77,215});shape.add(new double[] { 80,213});shape.add(new double[] { 82,212});shape.add(new double[] { 84,210});shape.add(new double[] { 87,209});shape.add(new double[] { 89,208});shape.add(new double[] { 92,206});
    //shape.add(new double[] { 95,204});shape.add(new double[] { 101,201});shape.add(new double[] { 106,198});shape.add(new double[] { 112,194});shape.add(new double[] { 118,191});shape.add(new double[] { 124,187});shape.add(new double[] { 127,186});shape.add(new double[] { 132,183});shape.add(new double[] { 138,181});shape.add(new double[] { 141,180});shape.add(new double[] { 146,178});
    //shape.add(new double[] { 154,173});shape.add(new double[] { 159,171});shape.add(new double[] { 161,170});shape.add(new double[] { 166,167});shape.add(new double[] { 168,167});shape.add(new double[] { 171,166});shape.add(new double[] { 174,164});shape.add(new double[] { 177,162});shape.add(new double[] { 180,160});shape.add(new double[] { 182,158});shape.add(new double[] { 183,156});
    //shape.add(new double[] { 181,154});shape.add(new double[] { 178,153});shape.add(new double[] { 171,153});shape.add(new double[] { 164,153});shape.add(new double[] { 160,153});shape.add(new double[] { 150,154});shape.add(new double[] { 147,155});shape.add(new double[] { 141,157});shape.add(new double[] { 137,158});shape.add(new double[] { 135,158});shape.add(new double[] { 137,158});
    //shape.add(new double[] { 140,157});shape.add(new double[] { 143,156});shape.add(new double[] { 151,154});shape.add(new double[] { 160,152});shape.add(new double[] { 170,149});shape.add(new double[] { 179,147});shape.add(new double[] { 185,145});shape.add(new double[] { 192,144});shape.add(new double[] { 196,144});shape.add(new double[] { 198,144});shape.add(new double[] { 200,144});
    //shape.add(new double[] { 201,147});shape.add(new double[] { 199,149});shape.add(new double[] { 194,157});shape.add(new double[] { 191,160});shape.add(new double[] { 186,167});shape.add(new double[] { 180,176});shape.add(new double[] { 177,179});shape.add(new double[] { 171,187});shape.add(new double[] { 169,189});shape.add(new double[] { 165,194});shape.add(new double[] { 164,196});
    //Unistroke arrow = new Unistroke("arrow", shape);
    //shape.clear();
    
    //shape.add(new double[] { 140,124});shape.add(new double[] { 138,123});shape.add(new double[] { 135,122});shape.add(new double[] { 133,123});shape.add(new double[] { 130,123});shape.add(new double[] { 128,124});shape.add(new double[] { 125,125});shape.add(new double[] { 122,124});shape.add(new double[] { 120,124});shape.add(new double[] { 118,124});
    //shape.add(new double[] { 116,125});shape.add(new double[] { 113,125});shape.add(new double[] { 111,125});shape.add(new double[] { 108,124});shape.add(new double[] { 106,125});shape.add(new double[] { 104,125});shape.add(new double[] { 102,124});shape.add(new double[] { 100,123});shape.add(new double[] { 98,123});shape.add(new double[] { 95,124});shape.add(new double[] { 93,123});
    //shape.add(new double[] { 90,124});shape.add(new double[] { 88,124});shape.add(new double[] { 85,125});shape.add(new double[] { 83,126});shape.add(new double[] { 81,127});shape.add(new double[] { 81,129});shape.add(new double[] { 82,131});shape.add(new double[] { 82,134});shape.add(new double[] { 83,138});shape.add(new double[] { 84,141});shape.add(new double[] { 84,144});
    //shape.add(new double[] { 85,148});shape.add(new double[] { 85,151});shape.add(new double[] { 86,156});shape.add(new double[] { 86,160});shape.add(new double[] { 86,164});shape.add(new double[] { 86,168});shape.add(new double[] { 87,171});shape.add(new double[] { 87,175});shape.add(new double[] { 87,179});shape.add(new double[] { 87,182});shape.add(new double[] { 87,186});
    //shape.add(new double[] { 88,188});shape.add(new double[] { 88,195});shape.add(new double[] { 88,198});shape.add(new double[] { 88,201});shape.add(new double[] { 88,207});shape.add(new double[] { 89,211});shape.add(new double[] { 89,213});shape.add(new double[] { 89,217});shape.add(new double[] { 89,222});shape.add(new double[] { 88,225});shape.add(new double[] { 88,229});
    //shape.add(new double[] { 88,231});shape.add(new double[] { 88,233});shape.add(new double[] { 88,235});shape.add(new double[] { 89,237});shape.add(new double[] { 89,240});shape.add(new double[] { 89,242});shape.add(new double[] { 91,241});shape.add(new double[] { 94,241});shape.add(new double[] { 96,240});shape.add(new double[] { 98,239});shape.add(new double[] { 105,240});
    //shape.add(new double[] { 109,240});shape.add(new double[] { 113,239});shape.add(new double[] { 116,240});shape.add(new double[] { 121,239});shape.add(new double[] { 130,240});shape.add(new double[] { 136,237});shape.add(new double[] { 139,237});shape.add(new double[] { 144,238});shape.add(new double[] { 151,237});shape.add(new double[] { 157,236});shape.add(new double[] { 159,237 });
    //Unistroke lsb = new Unistroke("left square bracket", shape);
    //shape.clear();
    
    
    //shape.add(new double[] { 112,138});shape.add(new double[] { 112,136});shape.add(new double[] { 115,136});shape.add(new double[] { 118,137});shape.add(new double[] { 120,136});shape.add(new double[] { 123,136});shape.add(new double[] { 125,136});shape.add(new double[] { 128,136});shape.add(new double[] { 131,136});shape.add(new double[] { 134,135});
    //shape.add(new double[] { 137,135});shape.add(new double[] { 140,134});shape.add(new double[] { 143,133});shape.add(new double[] { 145,132});shape.add(new double[] { 147,132});shape.add(new double[] { 149,132});shape.add(new double[] { 152,132});shape.add(new double[] { 153,134});shape.add(new double[] { 154,137});shape.add(new double[] { 155,141});
    //shape.add(new double[] { 156,144});shape.add(new double[] { 157,152});shape.add(new double[] { 158,161});shape.add(new double[] { 160,170});shape.add(new double[] { 162,182});shape.add(new double[] { 164,192});shape.add(new double[] { 166,200});shape.add(new double[] { 167,209});shape.add(new double[] { 168,214});shape.add(new double[] { 168,216});
    //shape.add(new double[] { 169,221});shape.add(new double[] { 169,223});shape.add(new double[] { 169,228});shape.add(new double[] { 169,231});shape.add(new double[] { 166,233});shape.add(new double[] { 164,234});shape.add(new double[] { 161,235});shape.add(new double[] { 155,236});shape.add(new double[] { 147,235});shape.add(new double[] { 140,233});
    //shape.add(new double[] { 131,233});shape.add(new double[] { 124,233});shape.add(new double[] { 117,235});shape.add(new double[] { 114,238});shape.add(new double[] { 112,238});
    //Unistroke rsb = new Unistroke("right square bracket", shape);
    //shape.clear();
    
    //shape.add(new double[] { 89,164});shape.add(new double[] { 90,162});shape.add(new double[] { 92,162});shape.add(new double[] { 94,164});shape.add(new double[] { 95,166});shape.add(new double[] { 96,169});shape.add(new double[] { 97,171});shape.add(new double[] { 99,175});shape.add(new double[] { 101,178});shape.add(new double[] { 103,182});shape.add(new double[] { 106,189});
    //shape.add(new double[] { 108,194});shape.add(new double[] { 111,199});shape.add(new double[] { 114,204});shape.add(new double[] { 117,209});shape.add(new double[] { 119,214});shape.add(new double[] { 122,218});shape.add(new double[] { 124,222});shape.add(new double[] { 126,225});shape.add(new double[] { 128,228});shape.add(new double[] { 130,229});shape.add(new double[] { 133,233});
    //shape.add(new double[] { 134,236});shape.add(new double[] { 136,239});shape.add(new double[] { 138,240});shape.add(new double[] { 139,242});shape.add(new double[] { 140,244});shape.add(new double[] { 142,242});shape.add(new double[] { 142,240});shape.add(new double[] { 142,237});shape.add(new double[] { 143,235});shape.add(new double[] { 143,233});shape.add(new double[] { 145,229});
    //shape.add(new double[] { 146,226});shape.add(new double[] { 148,217});shape.add(new double[] { 149,208});shape.add(new double[] { 149,205});shape.add(new double[] { 151,196});shape.add(new double[] { 151,193});shape.add(new double[] { 153,182});shape.add(new double[] { 155,172});shape.add(new double[] { 157,165});shape.add(new double[] { 159,160});shape.add(new double[] { 162,155});
    //shape.add(new double[] { 164,150});shape.add(new double[] { 165,148});shape.add(new double[] { 166,146});
    //Unistroke v = new Unistroke("v", shape);
    //shape.clear();
    
    //shape.add(new double[] { 123,129});shape.add(new double[] { 123,131});shape.add(new double[] { 124,133});shape.add(new double[] { 125,136});shape.add(new double[] { 127,140});shape.add(new double[] { 129,142});shape.add(new double[] { 133,148});shape.add(new double[] { 137,154});shape.add(new double[] { 143,158});shape.add(new double[] { 145,161});shape.add(new double[] { 148,164});
    //shape.add(new double[] { 153,170});shape.add(new double[] { 158,176});shape.add(new double[] { 160,178});shape.add(new double[] { 164,183});shape.add(new double[] { 168,188});shape.add(new double[] { 171,191});shape.add(new double[] { 175,196});shape.add(new double[] { 178,200});shape.add(new double[] { 180,202});shape.add(new double[] { 181,205});shape.add(new double[] { 184,208});
    //shape.add(new double[] { 186,210});shape.add(new double[] { 187,213});shape.add(new double[] { 188,215});shape.add(new double[] { 186,212});shape.add(new double[] { 183,211});shape.add(new double[] { 177,208});shape.add(new double[] { 169,206});shape.add(new double[] { 162,205});shape.add(new double[] { 154,207});shape.add(new double[] { 145,209});shape.add(new double[] { 137,210});
    //shape.add(new double[] { 129,214});shape.add(new double[] { 122,217});shape.add(new double[] { 118,218});shape.add(new double[] { 111,221});shape.add(new double[] { 109,222});shape.add(new double[] { 110,219});shape.add(new double[] { 112,217});shape.add(new double[] { 118,209});shape.add(new double[] { 120,207});shape.add(new double[] { 128,196});shape.add(new double[] { 135,187});
    //shape.add(new double[] { 138,183});shape.add(new double[] { 148,167});shape.add(new double[] { 157,153});shape.add(new double[] { 163,145});shape.add(new double[] { 165,142});shape.add(new double[] { 172,133});shape.add(new double[] { 177,127});shape.add(new double[] { 179,127});shape.add(new double[] { 180,125});
    //Unistroke del = new Unistroke("delete", shape);
    //shape.clear();
    
    //shape.add(new double[] { 150,116});shape.add(new double[] { 147,117});shape.add(new double[] { 145,116});shape.add(new double[] { 142,116});shape.add(new double[] { 139,117});shape.add(new double[] { 136,117});shape.add(new double[] { 133,118});shape.add(new double[] { 129,121});shape.add(new double[] { 126,122});shape.add(new double[] { 123,123});shape.add(new double[] { 120,125});
    //shape.add(new double[] { 118,127});shape.add(new double[] { 115,128});shape.add(new double[] { 113,129});shape.add(new double[] { 112,131});shape.add(new double[] { 113,134});shape.add(new double[] { 115,134});shape.add(new double[] { 117,135});shape.add(new double[] { 120,135});shape.add(new double[] { 123,137});shape.add(new double[] { 126,138});shape.add(new double[] { 129,140});
    //shape.add(new double[] { 135,143});shape.add(new double[] { 137,144});shape.add(new double[] { 139,147});shape.add(new double[] { 141,149});shape.add(new double[] { 140,152});shape.add(new double[] { 139,155});shape.add(new double[] { 134,159});shape.add(new double[] { 131,161});shape.add(new double[] { 124,166});shape.add(new double[] { 121,166});shape.add(new double[] { 117,166});
    //shape.add(new double[] { 114,167});shape.add(new double[] { 112,166});shape.add(new double[] { 114,164});shape.add(new double[] { 116,163});shape.add(new double[] { 118,163});shape.add(new double[] { 120,162});shape.add(new double[] { 122,163});shape.add(new double[] { 125,164});shape.add(new double[] { 127,165});shape.add(new double[] { 129,166});shape.add(new double[] { 130,168});
    //shape.add(new double[] { 129,171});shape.add(new double[] { 127,175});shape.add(new double[] { 125,179});shape.add(new double[] { 123,184});shape.add(new double[] { 121,190});shape.add(new double[] { 120,194});shape.add(new double[] { 119,199});shape.add(new double[] { 120,202});shape.add(new double[] { 123,207});shape.add(new double[] { 127,211});shape.add(new double[] { 133,215});
    //shape.add(new double[] { 142,219});shape.add(new double[] { 148,220});shape.add(new double[] { 151,221});
    //Unistroke lcb = new Unistroke("left curly brace", shape);
    //shape.clear();
    
    //shape.add(new double[] { 117,132});shape.add(new double[] { 115,132});shape.add(new double[] { 115,129});shape.add(new double[] { 117,129});shape.add(new double[] { 119,128});shape.add(new double[] { 122,127});shape.add(new double[] { 125,127});shape.add(new double[] { 127,127});shape.add(new double[] { 130,127});shape.add(new double[] { 133,129});shape.add(new double[] { 136,129});
    //shape.add(new double[] { 138,130});shape.add(new double[] { 140,131});shape.add(new double[] { 143,134});shape.add(new double[] { 144,136});shape.add(new double[] { 145,139});shape.add(new double[] { 145,142});shape.add(new double[] { 145,145});shape.add(new double[] { 145,147});shape.add(new double[] { 145,149});shape.add(new double[] { 144,152});shape.add(new double[] { 142,157});
    //shape.add(new double[] { 141,160});shape.add(new double[] { 139,163});shape.add(new double[] { 137,166});shape.add(new double[] { 135,167});shape.add(new double[] { 133,169});shape.add(new double[] { 131,172});shape.add(new double[] { 128,173});shape.add(new double[] { 126,176});shape.add(new double[] { 125,178});shape.add(new double[] { 125,180});shape.add(new double[] { 125,182});
    //shape.add(new double[] { 126,184});shape.add(new double[] { 128,187});shape.add(new double[] { 130,187});shape.add(new double[] { 132,188});shape.add(new double[] { 135,189});shape.add(new double[] { 140,189});shape.add(new double[] { 145,189});shape.add(new double[] { 150,187});shape.add(new double[] { 155,186});shape.add(new double[] { 157,185});shape.add(new double[] { 159,184});
    //shape.add(new double[] { 156,185});shape.add(new double[] { 154,185});shape.add(new double[] { 149,185});shape.add(new double[] { 145,187});shape.add(new double[] { 141,188});shape.add(new double[] { 136,191});shape.add(new double[] { 134,191});shape.add(new double[] { 131,192});shape.add(new double[] { 129,193});shape.add(new double[] { 129,195});shape.add(new double[] { 129,197});
    //shape.add(new double[] { 131,200});shape.add(new double[] { 133,202});shape.add(new double[] { 136,206});shape.add(new double[] { 139,211});shape.add(new double[] { 142,215});shape.add(new double[] { 145,220});shape.add(new double[] { 147,225});shape.add(new double[] { 148,231});shape.add(new double[] { 147,239});shape.add(new double[] { 144,244});shape.add(new double[] { 139,248});
    //shape.add(new double[] { 134,250});shape.add(new double[] { 126,253});shape.add(new double[] { 119,253});shape.add(new double[] { 115,253});
    //Unistroke rcb = new Unistroke("right curly brace", shape);
    //shape.clear();
    
    //shape.add(new double[] { 75,250});shape.add(new double[] { 75,247});shape.add(new double[] { 77,244});shape.add(new double[] { 78,242});shape.add(new double[] { 79,239});shape.add(new double[] { 80,237});shape.add(new double[] { 82,234});shape.add(new double[] { 82,232});shape.add(new double[] { 84,229});shape.add(new double[] { 85,225});shape.add(new double[] { 87,222});
    //shape.add(new double[] { 88,219});shape.add(new double[] { 89,216});shape.add(new double[] { 91,212});shape.add(new double[] { 92,208});shape.add(new double[] { 94,204});shape.add(new double[] { 95,201});shape.add(new double[] { 96,196});shape.add(new double[] { 97,194});shape.add(new double[] { 98,191});shape.add(new double[] { 100,185});shape.add(new double[] { 102,178});
    //shape.add(new double[] { 104,173});shape.add(new double[] { 104,171});shape.add(new double[] { 105,164});shape.add(new double[] { 106,158});shape.add(new double[] { 107,156});shape.add(new double[] { 107,152});shape.add(new double[] { 108,145});shape.add(new double[] { 109,141});shape.add(new double[] { 110,139});shape.add(new double[] { 112,133});shape.add(new double[] { 113,131});
    //shape.add(new double[] { 116,127});shape.add(new double[] { 117,125});shape.add(new double[] { 119,122});shape.add(new double[] { 121,121});shape.add(new double[] { 123,120});shape.add(new double[] { 125,122});shape.add(new double[] { 125,125});shape.add(new double[] { 127,130});shape.add(new double[] { 128,133});shape.add(new double[] { 131,143});shape.add(new double[] { 136,153});
    //shape.add(new double[] { 140,163});shape.add(new double[] { 144,172});shape.add(new double[] { 145,175});shape.add(new double[] { 151,189});shape.add(new double[] { 156,201});shape.add(new double[] { 161,213});shape.add(new double[] { 166,225});shape.add(new double[] { 169,233});shape.add(new double[] { 171,236});shape.add(new double[] { 174,243});shape.add(new double[] { 177,247});
    //shape.add(new double[] { 178,249});shape.add(new double[] { 179,251});shape.add(new double[] { 180,253});shape.add(new double[] { 180,255});shape.add(new double[] { 179,257});shape.add(new double[] { 177,257});shape.add(new double[] { 174,255});shape.add(new double[] { 169,250});shape.add(new double[] { 164,247});shape.add(new double[] { 160,245});shape.add(new double[] { 149,238});
    //shape.add(new double[] { 138,230});shape.add(new double[] { 127,221});shape.add(new double[] { 124,220});shape.add(new double[] { 112,212});shape.add(new double[] { 110,210});shape.add(new double[] { 96,201});shape.add(new double[] { 84,195});shape.add(new double[] { 74,190});shape.add(new double[] { 64,182});shape.add(new double[] { 55,175});shape.add(new double[] { 51,172});
    //shape.add(new double[] { 49,170});shape.add(new double[] { 51,169});shape.add(new double[] { 56,169});shape.add(new double[] { 66,169});shape.add(new double[] { 78,168});shape.add(new double[] { 92,166});shape.add(new double[] { 107,164});shape.add(new double[] { 123,161});shape.add(new double[] { 140,162});shape.add(new double[] { 156,162});shape.add(new double[] { 171,160});
    //shape.add(new double[] { 173,160});shape.add(new double[] { 186,160});shape.add(new double[] { 195,160});shape.add(new double[] { 198,161});shape.add(new double[] { 203,163});shape.add(new double[] { 208,163});shape.add(new double[] { 206,164});shape.add(new double[] { 200,167});shape.add(new double[] { 187,172});shape.add(new double[] { 174,179});shape.add(new double[] { 172,181});
    //shape.add(new double[] { 153,192});shape.add(new double[] { 137,201});shape.add(new double[] { 123,211});shape.add(new double[] { 112,220});shape.add(new double[] { 99,229});shape.add(new double[] { 90,237});shape.add(new double[] { 80,244});shape.add(new double[] { 73,250});shape.add(new double[] { 69,254});shape.add(new double[] { 69,252});
    //Unistroke star = new Unistroke("star", shape);
    //shape.clear();
    
    //shape.add(new double[] { 81,219});shape.add(new double[] { 84,218});shape.add(new double[] { 86,220});shape.add(new double[] { 88,220});shape.add(new double[] { 90,220});shape.add(new double[] { 92,219});shape.add(new double[] { 95,220});shape.add(new double[] { 97,219});shape.add(new double[] { 99,220});shape.add(new double[] { 102,218});shape.add(new double[] { 105,217});
    //shape.add(new double[] { 107,216});shape.add(new double[] { 110,216});shape.add(new double[] { 113,214});shape.add(new double[] { 116,212});shape.add(new double[] { 118,210});shape.add(new double[] { 121,208});shape.add(new double[] { 124,205});shape.add(new double[] { 126,202});shape.add(new double[] { 129,199});shape.add(new double[] { 132,196});shape.add(new double[] { 136,191});
    //shape.add(new double[] { 139,187});shape.add(new double[] { 142,182});shape.add(new double[] { 144,179});shape.add(new double[] { 146,174});shape.add(new double[] { 148,170});shape.add(new double[] { 149,168});shape.add(new double[] { 151,162});shape.add(new double[] { 152,160});shape.add(new double[] { 152,157});shape.add(new double[] { 152,155});shape.add(new double[] { 152,151});
    //shape.add(new double[] { 152,149});shape.add(new double[] { 152,146});shape.add(new double[] { 149,142});shape.add(new double[] { 148,139});shape.add(new double[] { 145,137});shape.add(new double[] { 141,135});shape.add(new double[] { 139,135});shape.add(new double[] { 134,136});shape.add(new double[] { 130,140});shape.add(new double[] { 128,142});shape.add(new double[] { 126,145});
    //shape.add(new double[] { 122,150});shape.add(new double[] { 119,158});shape.add(new double[] { 117,163});shape.add(new double[] { 115,170});shape.add(new double[] { 114,175});shape.add(new double[] { 117,184});shape.add(new double[] { 120,190});shape.add(new double[] { 125,199});shape.add(new double[] { 129,203});shape.add(new double[] { 133,208});shape.add(new double[] { 138,213});
    //shape.add(new double[] { 145,215});shape.add(new double[] { 155,218});shape.add(new double[] { 164,219});shape.add(new double[] { 166,219});shape.add(new double[] { 177,219});shape.add(new double[] { 182,218});shape.add(new double[] { 192,216});shape.add(new double[] { 196,213});shape.add(new double[] { 199,212});shape.add(new double[] { 201,211});
    //Unistroke pigtail = new Unistroke("pigtail", shape);
    //shape.clear();
    
    //templates1.add(triangle); templates1.add(x); templates1.add(rectangle); templates1.add(circle); templates1.add(check); templates1.add(caret); templates1.add(zigzag); templates1.add(arrow); templates1.add(lsb); templates1.add(rsb); templates1.add(v); templates1.add(del); templates1.add(lcb); templates1.add(rcb); templates1.add(star); templates1.add(pigtail);
    //for(int i = 0; i < templates1.size(); i++){
    //   ArrayList<double[]> pts = Resample(templates1.get(i).unistrokes,64);
    //   double rads = indicAngle(pts);
    //   pts = rotateBy(pts,-rads);
    //   pts = ScaleTo(pts,250);
    //   pts = TranslateTo(pts,new double[]{0,0});
    //   templates1.get(i).unistrokes = pts;
    //   System.out.println(templates1.get(i).unistrokes.size());
    //}
