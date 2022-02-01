import java.io.File;

void readIn(File dir){
   if(dir.isDirectory())
     System.out.println("TRUE");
   for(File file: dir.listFiles()){
     if(!file.isDirectory()){
       print(file.getPath());
         XML xml = loadXML(file.getPath()); //<>//
         XML[] childses = xml.getChildren("Point");
         ArrayList<double[]> shape = new ArrayList<double[]>();
         for(int i = 0; i < childses.length; i++){
            double x = Double.parseDouble(childses[i].getString("X"));
            double y = Double.parseDouble(childses[i].getString("Y"));
            double[] point = new double[]{x,y};
            shape.add(point);
         }
         //Getting the subject name //<>//
         String sub = file.getPath();
         int index = sub.indexOf("\\slow\\")-1;
         Unistroke uni = new Unistroke(file.getName(),shape, index); 
         templates1.add(uni);
     }
     else{
       if(!file.getName().equals("fast") && !file.getName().equals("medium") && !file.getName().equals("s01 (pilot)")){
        System.out.println(file.getName());
        readIn(file); 
       }
     }
   }
}
