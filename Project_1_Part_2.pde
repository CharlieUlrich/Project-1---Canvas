//Instantiating the arrayList which holds arrays of ints
//Each array is 1x2 and holds the x and y coordinates for each pixel drawn
ArrayList<int[]> points = new ArrayList<int[]>();
//Function called at the start of the progra, creates the canvas of size 1280x720
void setup(){
  size(250,250);
}

//Draw is called each time the screen is refreshed, the default framerate is 60fps
//And therefore, the draw funtion is called 60 times per second
void draw(){
  //Sets the background of the window / canvas to white
  background(255);
  //Calls the draw button function creating a button that clears the canvas
  drawButton(10, 10, 40, 20, "Clear");
  //Changes the color being drawn to green
  fill(0,255,0);
  //Loop that goes through the arrayList of pixels drawing a circle with a 1 pixel
  //Radius at each point
  for(int i = 0; i < points.size(); i++){
    strokeWeight(0);
    //Circle is called passing in the x and y coordinates drawing a circle of radius
    //1 at the location
    circle(points.get(i)[0],points.get(i)[1], 1);
  }
}

//Whenever the mouse is pressed this function is called
void mousePressed(){ 
   //If statement check if the coordinates of the mouse were over the clear button 
   //When pressed
   if(mouseX >10 && mouseX < 50 && mouseY > 10 && mouseY < 30){
     //If it was over the button it empties the arrayList
     points.removeAll(points);
   }
   else{
   //If it wasn't over the button then a new array of size 2 is created, within it
   //The x and y coordinates are stored of the mouse are stored and this array
   //Is added to the arrayLsit
   int[] a = new int[2];
   a[0] = mouseX;
   a[1] = mouseY;
   points.add(a);
   }
   if(points.size()>2)
     checkAdj();
}

//This function is called when the mouse is dragged, it has the same functionality
//As mouse clicked, except it doesn't clear the canvas / arrayList if the mouse is
//Dragged over the mouse button, it only clears the canvas if the button is clicked
void mouseDragged(){
   if(!(mouseX >10 && mouseX < 50 && mouseY > 10 && mouseY < 30)){
   int[] a = new int[2];
   a[0] = mouseX;
   a[1] = mouseY;
   points.add(a);  
   }
   if(points.size()>2)
     checkAdj();
}

void checkAdj(){
  /*while((((Math.abs(points.get(points.size()-2)[0]))-(Math.abs(points.get(points.size()-1)[0])))>1) && ((Math.abs(points.get(points.size()-2)[1]))-(Math.abs(points.get(points.size()-1)[1])))>1){
    
  }*/
  char alt = 'x';
  while(true){
   int[]p1=new int[2];
    p1 = points.get(points.size()-2);
   int[]p2=new int[2];
    p2 = points.get(points.size()-1); 
   int[]add = new int[2];
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
  
