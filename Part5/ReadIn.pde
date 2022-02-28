import java.io.File;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;

void readIn(File dir){
   if(dir.isDirectory())
     //System.out.println("TRUE");
   for(File file: dir.listFiles()){
     if(!file.isDirectory()){
       
       //There was in issue with xml format last time, have to erase last line then rewrite as "</Gesture>"
       try{
         FileReader t = new FileReader(file.getPath());
         String line;
         BufferedReader br = new BufferedReader(t);
         StringBuffer s = new StringBuffer("");
         int cnt = 0;
         while((line=br.readLine())!=null){
            cnt++;
         }
         br.close();
         FileReader t2 = new FileReader(file.getPath());
         br = new BufferedReader(t2);
         //cnt is the number of lines in file
         int cnt2=0;
         while((line=br.readLine())!=null){
            cnt2++;
            if(cnt!=cnt2){
              s.append(line+"\n");         
            }
         }
         br.close();
         FileWriter flWr = new FileWriter(new File(file.getPath()));
         flWr.write(s.toString() + "</Gesture>");
         flWr.close();
       }catch(Exception e){
         println("Broken");
       }
     
       
       print(file.getPath());
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
         int index = Integer.parseInt(sub.substring(sub.indexOf("\\data\\")+6, sub.indexOf("\\data\\")+7));
         //print(index);
         String n = file.getName().substring(0,file.getName().indexOf(".xml"));
         //System.out.println("Hello!!!!!!!" + index);
         Unistroke uni = new Unistroke(n,shape, index); 
         //println(uni.unistrokes.get(0)[1]);
         templates1.add(uni);
     }
     else{
       if(!file.getName().equals("fast") && !file.getName().equals("medium") && !file.getName().equals("s01 (pilot)")){
        //System.out.println(file.getName());
        readIn(file); 
       }
     }
   }
}
