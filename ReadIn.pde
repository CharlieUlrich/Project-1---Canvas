import java.io.File;

void readIn(File dir){
   if(dir.isDirectory())
     System.out.println("TRUE");
   System.out.println(dir.getPath());
   for(File file: dir.listFiles()){
     if(!file.isDirectory()){
         XML xml = loadXML(file.getPath());
         XML[] childses = xml.getChildren("Point");
         ArrayList<double[]> shape = new ArrayList<double[]>();
         for(int i = 0; i < childses.length; i++){
            double x = Double.parseDouble(childses[i].getString("X"));
            double y = Double.parseDouble(childses[i].getString("Y"));
            double[] point = new double[]{x,y};
            shape.add(point);
         }
         //Getting the subject name
         String sub = file.getPath();
         Unistroke uni = new Unistroke(file.getName(),shape, Integer.parseInt(sub.substring(14,15))); 
         templates1.add(uni);
     }
     else{
       if(file.getName()!="fast" || file.getName()!="medium")
        readIn(file); 
     }
   }
}
