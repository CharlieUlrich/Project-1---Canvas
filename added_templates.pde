//Instantiating the arrayList which holds arrays of ints
//Each array is 1x2 and holds the x and y coordinates for each pixel drawn
ArrayList<int[]> points = new ArrayList<int[]>();
//Function called at the start of the progra, creates the canvas of size 1280x720
void setup(){
  size(250,250);
  class Unistroke {
    String name;
    ArrayList<int[]> unistrokes = new ArrayList<int[]>();
    
    public Unistroke(String n, ArrayList<int[]> unis) {
      name = n;
      unistrokes = unis;
    }
  }
  
  

  ArrayList<int[]> shape = new ArrayList<int[]>();
    shape.add(new int[] { 137,139}); shape.add(new int[] { 135,141}); shape.add(new int[] { 133,144});shape.add(new int[] { 132,146}); shape.add(new int[] { 130,149});shape.add(new int[] { 128,151});shape.add(new int[] { 126,155});shape.add(new int[] { 123,160});shape.add(new int[] { 120,166});shape.add(new int[] { 116,171});shape.add(new int[] { 112,177});
    shape.add(new int[] { 107,183});shape.add(new int[] { 102,188});shape.add(new int[] { 100,191});shape.add(new int[] { 95,195});shape.add(new int[] { 90,199});shape.add(new int[] { 86,203});shape.add(new int[] { 82,206});shape.add(new int[] { 80,209});shape.add(new int[] { 75,213});shape.add(new int[] { 73,213});shape.add(new int[] { 70,216});
    shape.add(new int[] { 67,219});shape.add(new int[] { 64,221});shape.add(new int[] { 61,223});shape.add(new int[] { 60,225});shape.add(new int[] { 62,226});shape.add(new int[] { 65,225});shape.add(new int[] { 67,226});shape.add(new int[] { 74,226});shape.add(new int[] { 77,227});shape.add(new int[] { 85,229});shape.add(new int[] { 91,230});
    shape.add(new int[] { 99,231});shape.add(new int[] { 108,232});shape.add(new int[] { 116,233});shape.add(new int[] { 125,233});shape.add(new int[] { 134,234});shape.add(new int[] { 145,233});shape.add(new int[] { 153,232});shape.add(new int[] { 160,233});shape.add(new int[] { 170,234});shape.add(new int[] { 177,235});shape.add(new int[] { 179,236});
    shape.add(new int[] { 186,237});shape.add(new int[] { 193,238});shape.add(new int[] { 198,239});shape.add(new int[] { 200,237});shape.add(new int[] { 202,239});shape.add(new int[] { 204,238});shape.add(new int[] { 206,234});shape.add(new int[] { 205,230});shape.add(new int[] { 202,222});shape.add(new int[] { 197,216});shape.add(new int[] { 192,207});
    shape.add(new int[] { 186,198});shape.add(new int[] { 179,189});shape.add(new int[] { 174,183}); shape.add(new int[] { 170,178});shape.add(new int[] { 164,171});shape.add(new int[] { 161,168});shape.add(new int[] { 154,160});shape.add(new int[] { 148,155});shape.add(new int[] { 143,150});shape.add(new int[] { 138,148});shape.add(new int[] { 136,148});
    Unistroke triangle = new Unistroke("triangle", shape);
    shape.clear();
    
    
    shape.add(new int[] { 87,142});shape.add(new int[] { 89,145});shape.add(new int[] { 91,148});shape.add(new int[] { 93,151});shape.add(new int[] { 96,155});shape.add(new int[] { 98,157});shape.add(new int[] { 100,160});shape.add(new int[] { 102,162});shape.add(new int[] { 106,167});shape.add(new int[] { 108,169});shape.add(new int[] { 110,171});
    shape.add(new int[] { 115,177});shape.add(new int[] { 119,183});shape.add(new int[] { 123,189});shape.add(new int[] { 127,193});shape.add(new int[] { 129,196});shape.add(new int[] { 133,200});shape.add(new int[] { 137,206});shape.add(new int[] { 140,209});shape.add(new int[] { 143,212});shape.add(new int[] { 146,215});shape.add(new int[] { 151,220});
    shape.add(new int[] { 153,222});shape.add(new int[] { 155,223});shape.add(new int[] { 157,225});shape.add(new int[] { 158,223});shape.add(new int[] { 157,218});shape.add(new int[] { 155,211});shape.add(new int[] { 154,208});shape.add(new int[] { 152,200});shape.add(new int[] { 150,189});shape.add(new int[] { 148,179});shape.add(new int[] { 147,170});
    shape.add(new int[] { 147,158});shape.add(new int[] { 147,148});shape.add(new int[] { 147,141});shape.add(new int[] { 147,136});shape.add(new int[] { 144,135});shape.add(new int[] { 142,137});shape.add(new int[] { 140,139});shape.add(new int[] { 135,145});shape.add(new int[] { 131,152});shape.add(new int[] { 124,163});shape.add(new int[] { 116,177});
    shape.add(new int[] { 108,191});shape.add(new int[] { 100,206});shape.add(new int[] { 94,217});shape.add(new int[] { 91,222});shape.add(new int[] { 89,225});shape.add(new int[] { 87,226});shape.add(new int[] { 87,224});
    Unistroke x = new Unistroke("x", shape);
    shape.clear();
    
    shape.add(new int[] { 78,149});shape.add(new int[] { 78,153});shape.add(new int[] { 78,157});shape.add(new int[] { 78,160});shape.add(new int[] { 79,162});shape.add(new int[] { 79,164});shape.add(new int[] { 79,167});shape.add(new int[] { 79,169});shape.add(new int[] { 79,173});shape.add(new int[] { 79,178});shape.add(new int[] { 79,183});
    shape.add(new int[] { 80,189});shape.add(new int[] { 80,193});shape.add(new int[] { 80,198});shape.add(new int[] { 80,202});shape.add(new int[] { 81,208});shape.add(new int[] { 81,210});shape.add(new int[] { 81,216});shape.add(new int[] { 82,222});shape.add(new int[] { 82,224});shape.add(new int[] { 82,227});shape.add(new int[] { 83,229});
    shape.add(new int[] { 83,231});shape.add(new int[] { 85,230});shape.add(new int[] { 88,232});shape.add(new int[] { 90,233});shape.add(new int[] { 92,232});shape.add(new int[] { 94,233});shape.add(new int[] { 99,232});shape.add(new int[] { 102,233});shape.add(new int[] { 106,233});shape.add(new int[] { 109,234});shape.add(new int[] { 117,235});
    shape.add(new int[] { 123,236});shape.add(new int[] { 126,236});shape.add(new int[] { 135,237});shape.add(new int[] { 142,238});shape.add(new int[] { 145,238});shape.add(new int[] { 152,238});shape.add(new int[] { 154,239});shape.add(new int[] { 165,238});shape.add(new int[] { 174,237});shape.add(new int[] { 179,236});
    shape.add(new int[] { 186,235});shape.add(new int[] { 191,235});shape.add(new int[] { 195,233});shape.add(new int[] { 197,233});shape.add(new int[] { 200,233});shape.add(new int[] { 201,235});shape.add(new int[] { 201,233});shape.add(new int[] { 199,231});shape.add(new int[] { 198,226});shape.add(new int[] { 198,220});
    shape.add(new int[] { 196,207});shape.add(new int[] { 195,195});shape.add(new int[] { 195,181});shape.add(new int[] { 195,173});shape.add(new int[] { 195,163});shape.add(new int[] { 194,155});shape.add(new int[] { 192,145});shape.add(new int[] { 192,143});shape.add(new int[] { 192,138});shape.add(new int[] { 191,135});
    shape.add(new int[] { 191,133});shape.add(new int[] { 191,130});shape.add(new int[] { 190,128});shape.add(new int[] { 188,129});shape.add(new int[] { 186,129});shape.add(new int[] { 181,132});shape.add(new int[] { 173,131});shape.add(new int[] { 162,131});shape.add(new int[] { 151,132});shape.add(new int[] { 149,132});
    shape.add(new int[] { 138,132});shape.add(new int[] { 136,132});shape.add(new int[] { 122,131});shape.add(new int[] { 120,131});shape.add(new int[] { 109,130});shape.add(new int[] { 107,130});shape.add(new int[] { 90,132});shape.add(new int[] { 81,133});shape.add(new int[] { 76,133 });
    Unistroke rectangle = new Unistroke("rectangle", shape);
    shape.clear();
    
    shape.add(new int[] { 127,141});shape.add(new int[] { 124,140});shape.add(new int[] { 120,139});shape.add(new int[] { 118,139});shape.add(new int[] { 116,139});shape.add(new int[] { 111,140});shape.add(new int[] { 109,141});shape.add(new int[] { 104,144});shape.add(new int[] { 100,147});shape.add(new int[] { 96,152});
    shape.add(new int[] { 93,157});shape.add(new int[] { 90,163});shape.add(new int[] { 87,169});shape.add(new int[] { 85,175});shape.add(new int[] { 83,181});shape.add(new int[] { 82,190});shape.add(new int[] { 82,195});shape.add(new int[] { 83,200});shape.add(new int[] { 84,205});shape.add(new int[] { 88,213});shape.add(new int[] { 91,216});
    shape.add(new int[] { 96,219});shape.add(new int[] { 103,222});shape.add(new int[] { 108,224});shape.add(new int[] { 111,224});shape.add(new int[] { 120,224});shape.add(new int[] { 133,223});shape.add(new int[] { 142,222});shape.add(new int[] { 152,218});shape.add(new int[] { 160,214});shape.add(new int[] { 167,210});shape.add(new int[] { 173,204});
    shape.add(new int[] { 178,198});shape.add(new int[] { 179,196});shape.add(new int[] { 182,188});shape.add(new int[] { 182,177});shape.add(new int[] { 178,167});shape.add(new int[] { 170,150});shape.add(new int[] { 163,138});shape.add(new int[] { 152,130});shape.add(new int[] { 143,129});shape.add(new int[] { 140,131});shape.add(new int[] { 129,136});
    shape.add(new int[] { 126,139});
    Unistroke circle = new Unistroke("circle", shape);
    shape.clear();
    
    shape.add(new int[] { 91,185});shape.add(new int[] { 93,185});shape.add(new int[] { 95,185});shape.add(new int[] { 97,185});shape.add(new int[] { 100,188});shape.add(new int[] { 102,189});shape.add(new int[] { 104,190});shape.add(new int[] { 106,193});shape.add(new int[] { 108,195});shape.add(new int[] { 110,198});shape.add(new int[] { 112,201});
    shape.add(new int[] { 114,204});shape.add(new int[] { 115,207});shape.add(new int[] { 117,210});shape.add(new int[] { 118,212});shape.add(new int[] { 120,214});shape.add(new int[] { 121,217});shape.add(new int[] { 122,219});shape.add(new int[] { 123,222});shape.add(new int[] { 124,224});shape.add(new int[] { 126,226});shape.add(new int[] { 127,229});
    shape.add(new int[] { 129,231});shape.add(new int[] { 130,233});shape.add(new int[] { 129,231});shape.add(new int[] { 129,228});shape.add(new int[] { 129,226});shape.add(new int[] { 129,224});shape.add(new int[] { 129,221});shape.add(new int[] { 129,218});shape.add(new int[] { 129,212});shape.add(new int[] { 129,208});shape.add(new int[] { 130,198});
    shape.add(new int[] { 132,189});shape.add(new int[] { 134,182});shape.add(new int[] { 137,173});shape.add(new int[] { 143,164});shape.add(new int[] { 147,157});shape.add(new int[] { 151,151});shape.add(new int[] { 155,144});shape.add(new int[] { 161,137});shape.add(new int[] { 165,131});shape.add(new int[] { 171,122});shape.add(new int[] { 174,118});
    shape.add(new int[] { 176,114});shape.add(new int[] { 177,112});shape.add(new int[] { 177,114});shape.add(new int[] { 175,116});shape.add(new int[] { 173,118});
    Unistroke check = new Unistroke("check", shape);
    shape.clear();
    
    shape.add(new int[] { 79,245});shape.add(new int[] { 79,242});shape.add(new int[] { 79,239});shape.add(new int[] { 80,237});shape.add(new int[] { 80,234});shape.add(new int[] { 81,232});shape.add(new int[] { 82,230});shape.add(new int[] { 84,224});shape.add(new int[] { 86,220});shape.add(new int[] { 86,218});shape.add(new int[] { 87,216});
    shape.add(new int[] { 88,213});shape.add(new int[] { 90,207});shape.add(new int[] { 91,202});shape.add(new int[] { 92,200});shape.add(new int[] { 93,194});shape.add(new int[] { 94,192});shape.add(new int[] { 96,189});shape.add(new int[] { 97,186});shape.add(new int[] { 100,179});shape.add(new int[] { 102,173});shape.add(new int[] { 105,165});
    shape.add(new int[] { 107,160});shape.add(new int[] { 109,158});shape.add(new int[] { 112,151});shape.add(new int[] { 115,144});shape.add(new int[] { 117,139});shape.add(new int[] { 119,136});shape.add(new int[] { 119,134});shape.add(new int[] { 120,132});shape.add(new int[] { 121,129});shape.add(new int[] { 122,127});
    shape.add(new int[] { 124,125});shape.add(new int[] { 126,124});shape.add(new int[] { 129,125});shape.add(new int[] { 131,127});shape.add(new int[] { 132,130});shape.add(new int[] { 136,139});shape.add(new int[] { 141,154});shape.add(new int[] { 145,166});shape.add(new int[] { 151,182});shape.add(new int[] { 156,193});
    shape.add(new int[] { 157,196});shape.add(new int[] { 161,209});shape.add(new int[] { 162,211});shape.add(new int[] { 167,223});shape.add(new int[] { 169,229});shape.add(new int[] { 170,231});shape.add(new int[] { 173,237});shape.add(new int[] { 176,242});shape.add(new int[] { 177,244});shape.add(new int[] { 179,250});
    shape.add(new int[] { 181,255});shape.add(new int[] { 182,257 });
    Unistroke caret = new Unistroke("caret", shape);
    shape.clear();
    
    shape.add(new int[] { 307,216});shape.add(new int[] { 333,186});shape.add(new int[] { 356,215});shape.add(new int[] { 375,186});shape.add(new int[] { 399,216});shape.add(new int[] { 418,186 });
    Unistroke zigzag = new Unistroke("zig-zag", shape);
    shape.clear();
    
    shape.add(new int[] { 68,222});shape.add(new int[] { 70,220});shape.add(new int[] { 73,218});shape.add(new int[] { 75,217});shape.add(new int[] { 77,215});shape.add(new int[] { 80,213});shape.add(new int[] { 82,212});shape.add(new int[] { 84,210});shape.add(new int[] { 87,209});shape.add(new int[] { 89,208});shape.add(new int[] { 92,206});
    shape.add(new int[] { 95,204});shape.add(new int[] { 101,201});shape.add(new int[] { 106,198});shape.add(new int[] { 112,194});shape.add(new int[] { 118,191});shape.add(new int[] { 124,187});shape.add(new int[] { 127,186});shape.add(new int[] { 132,183});shape.add(new int[] { 138,181});shape.add(new int[] { 141,180});shape.add(new int[] { 146,178});
    shape.add(new int[] { 154,173});shape.add(new int[] { 159,171});shape.add(new int[] { 161,170});shape.add(new int[] { 166,167});shape.add(new int[] { 168,167});shape.add(new int[] { 171,166});shape.add(new int[] { 174,164});shape.add(new int[] { 177,162});shape.add(new int[] { 180,160});shape.add(new int[] { 182,158});shape.add(new int[] { 183,156});
    shape.add(new int[] { 181,154});shape.add(new int[] { 178,153});shape.add(new int[] { 171,153});shape.add(new int[] { 164,153});shape.add(new int[] { 160,153});shape.add(new int[] { 150,154});shape.add(new int[] { 147,155});shape.add(new int[] { 141,157});shape.add(new int[] { 137,158});shape.add(new int[] { 135,158});shape.add(new int[] { 137,158});
    shape.add(new int[] { 140,157});shape.add(new int[] { 143,156});shape.add(new int[] { 151,154});shape.add(new int[] { 160,152});shape.add(new int[] { 170,149});shape.add(new int[] { 179,147});shape.add(new int[] { 185,145});shape.add(new int[] { 192,144});shape.add(new int[] { 196,144});shape.add(new int[] { 198,144});shape.add(new int[] { 200,144});
    shape.add(new int[] { 201,147});shape.add(new int[] { 199,149});shape.add(new int[] { 194,157});shape.add(new int[] { 191,160});shape.add(new int[] { 186,167});shape.add(new int[] { 180,176});shape.add(new int[] { 177,179});shape.add(new int[] { 171,187});shape.add(new int[] { 169,189});shape.add(new int[] { 165,194});shape.add(new int[] { 164,196});
    Unistroke arrow = new Unistroke("arrow", shape);
    shape.clear();
    
    shape.add(new int[] { 140,124});shape.add(new int[] { 138,123});shape.add(new int[] { 135,122});shape.add(new int[] { 133,123});shape.add(new int[] { 130,123});shape.add(new int[] { 128,124});shape.add(new int[] { 125,125});shape.add(new int[] { 122,124});shape.add(new int[] { 120,124});shape.add(new int[] { 118,124});
    shape.add(new int[] { 116,125});shape.add(new int[] { 113,125});shape.add(new int[] { 111,125});shape.add(new int[] { 108,124});shape.add(new int[] { 106,125});shape.add(new int[] { 104,125});shape.add(new int[] { 102,124});shape.add(new int[] { 100,123});shape.add(new int[] { 98,123});shape.add(new int[] { 95,124});shape.add(new int[] { 93,123});
    shape.add(new int[] { 90,124});shape.add(new int[] { 88,124});shape.add(new int[] { 85,125});shape.add(new int[] { 83,126});shape.add(new int[] { 81,127});shape.add(new int[] { 81,129});shape.add(new int[] { 82,131});shape.add(new int[] { 82,134});shape.add(new int[] { 83,138});shape.add(new int[] { 84,141});shape.add(new int[] { 84,144});
    shape.add(new int[] { 85,148});shape.add(new int[] { 85,151});shape.add(new int[] { 86,156});shape.add(new int[] { 86,160});shape.add(new int[] { 86,164});shape.add(new int[] { 86,168});shape.add(new int[] { 87,171});shape.add(new int[] { 87,175});shape.add(new int[] { 87,179});shape.add(new int[] { 87,182});shape.add(new int[] { 87,186});
    shape.add(new int[] { 88,188});shape.add(new int[] { 88,195});shape.add(new int[] { 88,198});shape.add(new int[] { 88,201});shape.add(new int[] { 88,207});shape.add(new int[] { 89,211});shape.add(new int[] { 89,213});shape.add(new int[] { 89,217});shape.add(new int[] { 89,222});shape.add(new int[] { 88,225});shape.add(new int[] { 88,229});
    shape.add(new int[] { 88,231});shape.add(new int[] { 88,233});shape.add(new int[] { 88,235});shape.add(new int[] { 89,237});shape.add(new int[] { 89,240});shape.add(new int[] { 89,242});shape.add(new int[] { 91,241});shape.add(new int[] { 94,241});shape.add(new int[] { 96,240});shape.add(new int[] { 98,239});shape.add(new int[] { 105,240});
    shape.add(new int[] { 109,240});shape.add(new int[] { 113,239});shape.add(new int[] { 116,240});shape.add(new int[] { 121,239});shape.add(new int[] { 130,240});shape.add(new int[] { 136,237});shape.add(new int[] { 139,237});shape.add(new int[] { 144,238});shape.add(new int[] { 151,237});shape.add(new int[] { 157,236});shape.add(new int[] { 159,237 });
    Unistroke lsb = new Unistroke("left square bracket", shape);
    shape.clear();
    
    
    shape.add(new int[] { 112,138});shape.add(new int[] { 112,136});shape.add(new int[] { 115,136});shape.add(new int[] { 118,137});shape.add(new int[] { 120,136});shape.add(new int[] { 123,136});shape.add(new int[] { 125,136});shape.add(new int[] { 128,136});shape.add(new int[] { 131,136});shape.add(new int[] { 134,135});
    shape.add(new int[] { 137,135});shape.add(new int[] { 140,134});shape.add(new int[] { 143,133});shape.add(new int[] { 145,132});shape.add(new int[] { 147,132});shape.add(new int[] { 149,132});shape.add(new int[] { 152,132});shape.add(new int[] { 153,134});shape.add(new int[] { 154,137});shape.add(new int[] { 155,141});
    shape.add(new int[] { 156,144});shape.add(new int[] { 157,152});shape.add(new int[] { 158,161});shape.add(new int[] { 160,170});shape.add(new int[] { 162,182});shape.add(new int[] { 164,192});shape.add(new int[] { 166,200});shape.add(new int[] { 167,209});shape.add(new int[] { 168,214});shape.add(new int[] { 168,216});
    shape.add(new int[] { 169,221});shape.add(new int[] { 169,223});shape.add(new int[] { 169,228});shape.add(new int[] { 169,231});shape.add(new int[] { 166,233});shape.add(new int[] { 164,234});shape.add(new int[] { 161,235});shape.add(new int[] { 155,236});shape.add(new int[] { 147,235});shape.add(new int[] { 140,233});
    shape.add(new int[] { 131,233});shape.add(new int[] { 124,233});shape.add(new int[] { 117,235});shape.add(new int[] { 114,238});shape.add(new int[] { 112,238});
    Unistroke rsb = new Unistroke("right square bracket", shape);
    shape.clear();
    
    shape.add(new int[] { 89,164});shape.add(new int[] { 90,162});shape.add(new int[] { 92,162});shape.add(new int[] { 94,164});shape.add(new int[] { 95,166});shape.add(new int[] { 96,169});shape.add(new int[] { 97,171});shape.add(new int[] { 99,175});shape.add(new int[] { 101,178});shape.add(new int[] { 103,182});shape.add(new int[] { 106,189});
    shape.add(new int[] { 108,194});shape.add(new int[] { 111,199});shape.add(new int[] { 114,204});shape.add(new int[] { 117,209});shape.add(new int[] { 119,214});shape.add(new int[] { 122,218});shape.add(new int[] { 124,222});shape.add(new int[] { 126,225});shape.add(new int[] { 128,228});shape.add(new int[] { 130,229});shape.add(new int[] { 133,233});
    shape.add(new int[] { 134,236});shape.add(new int[] { 136,239});shape.add(new int[] { 138,240});shape.add(new int[] { 139,242});shape.add(new int[] { 140,244});shape.add(new int[] { 142,242});shape.add(new int[] { 142,240});shape.add(new int[] { 142,237});shape.add(new int[] { 143,235});shape.add(new int[] { 143,233});shape.add(new int[] { 145,229});
    shape.add(new int[] { 146,226});shape.add(new int[] { 148,217});shape.add(new int[] { 149,208});shape.add(new int[] { 149,205});shape.add(new int[] { 151,196});shape.add(new int[] { 151,193});shape.add(new int[] { 153,182});shape.add(new int[] { 155,172});shape.add(new int[] { 157,165});shape.add(new int[] { 159,160});shape.add(new int[] { 162,155});
    shape.add(new int[] { 164,150});shape.add(new int[] { 165,148});shape.add(new int[] { 166,146});
    Unistroke v = new Unistroke("v", shape);
    shape.clear();
    
    shape.add(new int[] { 123,129});shape.add(new int[] { 123,131});shape.add(new int[] { 124,133});shape.add(new int[] { 125,136});shape.add(new int[] { 127,140});shape.add(new int[] { 129,142});shape.add(new int[] { 133,148});shape.add(new int[] { 137,154});shape.add(new int[] { 143,158});shape.add(new int[] { 145,161});shape.add(new int[] { 148,164});
    shape.add(new int[] { 153,170});shape.add(new int[] { 158,176});shape.add(new int[] { 160,178});shape.add(new int[] { 164,183});shape.add(new int[] { 168,188});shape.add(new int[] { 171,191});shape.add(new int[] { 175,196});shape.add(new int[] { 178,200});shape.add(new int[] { 180,202});shape.add(new int[] { 181,205});shape.add(new int[] { 184,208});
    shape.add(new int[] { 186,210});shape.add(new int[] { 187,213});shape.add(new int[] { 188,215});shape.add(new int[] { 186,212});shape.add(new int[] { 183,211});shape.add(new int[] { 177,208});shape.add(new int[] { 169,206});shape.add(new int[] { 162,205});shape.add(new int[] { 154,207});shape.add(new int[] { 145,209});shape.add(new int[] { 137,210});
    shape.add(new int[] { 129,214});shape.add(new int[] { 122,217});shape.add(new int[] { 118,218});shape.add(new int[] { 111,221});shape.add(new int[] { 109,222});shape.add(new int[] { 110,219});shape.add(new int[] { 112,217});shape.add(new int[] { 118,209});shape.add(new int[] { 120,207});shape.add(new int[] { 128,196});shape.add(new int[] { 135,187});
    shape.add(new int[] { 138,183});shape.add(new int[] { 148,167});shape.add(new int[] { 157,153});shape.add(new int[] { 163,145});shape.add(new int[] { 165,142});shape.add(new int[] { 172,133});shape.add(new int[] { 177,127});shape.add(new int[] { 179,127});shape.add(new int[] { 180,125});
    Unistroke del = new Unistroke("delete", shape);
    shape.clear();
    
    shape.add(new int[] { 150,116});shape.add(new int[] { 147,117});shape.add(new int[] { 145,116});shape.add(new int[] { 142,116});shape.add(new int[] { 139,117});shape.add(new int[] { 136,117});shape.add(new int[] { 133,118});shape.add(new int[] { 129,121});shape.add(new int[] { 126,122});shape.add(new int[] { 123,123});shape.add(new int[] { 120,125});
    shape.add(new int[] { 118,127});shape.add(new int[] { 115,128});shape.add(new int[] { 113,129});shape.add(new int[] { 112,131});shape.add(new int[] { 113,134});shape.add(new int[] { 115,134});shape.add(new int[] { 117,135});shape.add(new int[] { 120,135});shape.add(new int[] { 123,137});shape.add(new int[] { 126,138});shape.add(new int[] { 129,140});
    shape.add(new int[] { 135,143});shape.add(new int[] { 137,144});shape.add(new int[] { 139,147});shape.add(new int[] { 141,149});shape.add(new int[] { 140,152});shape.add(new int[] { 139,155});shape.add(new int[] { 134,159});shape.add(new int[] { 131,161});shape.add(new int[] { 124,166});shape.add(new int[] { 121,166});shape.add(new int[] { 117,166});
    shape.add(new int[] { 114,167});shape.add(new int[] { 112,166});shape.add(new int[] { 114,164});shape.add(new int[] { 116,163});shape.add(new int[] { 118,163});shape.add(new int[] { 120,162});shape.add(new int[] { 122,163});shape.add(new int[] { 125,164});shape.add(new int[] { 127,165});shape.add(new int[] { 129,166});shape.add(new int[] { 130,168});
    shape.add(new int[] { 129,171});shape.add(new int[] { 127,175});shape.add(new int[] { 125,179});shape.add(new int[] { 123,184});shape.add(new int[] { 121,190});shape.add(new int[] { 120,194});shape.add(new int[] { 119,199});shape.add(new int[] { 120,202});shape.add(new int[] { 123,207});shape.add(new int[] { 127,211});shape.add(new int[] { 133,215});
    shape.add(new int[] { 142,219});shape.add(new int[] { 148,220});shape.add(new int[] { 151,221});
    Unistroke lcb = new Unistroke("left curly brace", shape);
    shape.clear();
    
    shape.add(new int[] { 117,132});shape.add(new int[] { 115,132});shape.add(new int[] { 115,129});shape.add(new int[] { 117,129});shape.add(new int[] { 119,128});shape.add(new int[] { 122,127});shape.add(new int[] { 125,127});shape.add(new int[] { 127,127});shape.add(new int[] { 130,127});shape.add(new int[] { 133,129});shape.add(new int[] { 136,129});
    shape.add(new int[] { 138,130});shape.add(new int[] { 140,131});shape.add(new int[] { 143,134});shape.add(new int[] { 144,136});shape.add(new int[] { 145,139});shape.add(new int[] { 145,142});shape.add(new int[] { 145,145});shape.add(new int[] { 145,147});shape.add(new int[] { 145,149});shape.add(new int[] { 144,152});shape.add(new int[] { 142,157});
    shape.add(new int[] { 141,160});shape.add(new int[] { 139,163});shape.add(new int[] { 137,166});shape.add(new int[] { 135,167});shape.add(new int[] { 133,169});shape.add(new int[] { 131,172});shape.add(new int[] { 128,173});shape.add(new int[] { 126,176});shape.add(new int[] { 125,178});shape.add(new int[] { 125,180});shape.add(new int[] { 125,182});
    shape.add(new int[] { 126,184});shape.add(new int[] { 128,187});shape.add(new int[] { 130,187});shape.add(new int[] { 132,188});shape.add(new int[] { 135,189});shape.add(new int[] { 140,189});shape.add(new int[] { 145,189});shape.add(new int[] { 150,187});shape.add(new int[] { 155,186});shape.add(new int[] { 157,185});shape.add(new int[] { 159,184});
    shape.add(new int[] { 156,185});shape.add(new int[] { 154,185});shape.add(new int[] { 149,185});shape.add(new int[] { 145,187});shape.add(new int[] { 141,188});shape.add(new int[] { 136,191});shape.add(new int[] { 134,191});shape.add(new int[] { 131,192});shape.add(new int[] { 129,193});shape.add(new int[] { 129,195});shape.add(new int[] { 129,197});
    shape.add(new int[] { 131,200});shape.add(new int[] { 133,202});shape.add(new int[] { 136,206});shape.add(new int[] { 139,211});shape.add(new int[] { 142,215});shape.add(new int[] { 145,220});shape.add(new int[] { 147,225});shape.add(new int[] { 148,231});shape.add(new int[] { 147,239});shape.add(new int[] { 144,244});shape.add(new int[] { 139,248});
    shape.add(new int[] { 134,250});shape.add(new int[] { 126,253});shape.add(new int[] { 119,253});shape.add(new int[] { 115,253});
    Unistroke rcb = new Unistroke("right curly brace", shape);
    shape.clear();
    
    shape.add(new int[] { 75,250});shape.add(new int[] { 75,247});shape.add(new int[] { 77,244});shape.add(new int[] { 78,242});shape.add(new int[] { 79,239});shape.add(new int[] { 80,237});shape.add(new int[] { 82,234});shape.add(new int[] { 82,232});shape.add(new int[] { 84,229});shape.add(new int[] { 85,225});shape.add(new int[] { 87,222});
    shape.add(new int[] { 88,219});shape.add(new int[] { 89,216});shape.add(new int[] { 91,212});shape.add(new int[] { 92,208});shape.add(new int[] { 94,204});shape.add(new int[] { 95,201});shape.add(new int[] { 96,196});shape.add(new int[] { 97,194});shape.add(new int[] { 98,191});shape.add(new int[] { 100,185});shape.add(new int[] { 102,178});
    shape.add(new int[] { 104,173});shape.add(new int[] { 104,171});shape.add(new int[] { 105,164});shape.add(new int[] { 106,158});shape.add(new int[] { 107,156});shape.add(new int[] { 107,152});shape.add(new int[] { 108,145});shape.add(new int[] { 109,141});shape.add(new int[] { 110,139});shape.add(new int[] { 112,133});shape.add(new int[] { 113,131});
    shape.add(new int[] { 116,127});shape.add(new int[] { 117,125});shape.add(new int[] { 119,122});shape.add(new int[] { 121,121});shape.add(new int[] { 123,120});shape.add(new int[] { 125,122});shape.add(new int[] { 125,125});shape.add(new int[] { 127,130});shape.add(new int[] { 128,133});shape.add(new int[] { 131,143});shape.add(new int[] { 136,153});
    shape.add(new int[] { 140,163});shape.add(new int[] { 144,172});shape.add(new int[] { 145,175});shape.add(new int[] { 151,189});shape.add(new int[] { 156,201});shape.add(new int[] { 161,213});shape.add(new int[] { 166,225});shape.add(new int[] { 169,233});shape.add(new int[] { 171,236});shape.add(new int[] { 174,243});shape.add(new int[] { 177,247});
    shape.add(new int[] { 178,249});shape.add(new int[] { 179,251});shape.add(new int[] { 180,253});shape.add(new int[] { 180,255});shape.add(new int[] { 179,257});shape.add(new int[] { 177,257});shape.add(new int[] { 174,255});shape.add(new int[] { 169,250});shape.add(new int[] { 164,247});shape.add(new int[] { 160,245});shape.add(new int[] { 149,238});
    shape.add(new int[] { 138,230});shape.add(new int[] { 127,221});shape.add(new int[] { 124,220});shape.add(new int[] { 112,212});shape.add(new int[] { 110,210});shape.add(new int[] { 96,201});shape.add(new int[] { 84,195});shape.add(new int[] { 74,190});shape.add(new int[] { 64,182});shape.add(new int[] { 55,175});shape.add(new int[] { 51,172});
    shape.add(new int[] { 49,170});shape.add(new int[] { 51,169});shape.add(new int[] { 56,169});shape.add(new int[] { 66,169});shape.add(new int[] { 78,168});shape.add(new int[] { 92,166});shape.add(new int[] { 107,164});shape.add(new int[] { 123,161});shape.add(new int[] { 140,162});shape.add(new int[] { 156,162});shape.add(new int[] { 171,160});
    shape.add(new int[] { 173,160});shape.add(new int[] { 186,160});shape.add(new int[] { 195,160});shape.add(new int[] { 198,161});shape.add(new int[] { 203,163});shape.add(new int[] { 208,163});shape.add(new int[] { 206,164});shape.add(new int[] { 200,167});shape.add(new int[] { 187,172});shape.add(new int[] { 174,179});shape.add(new int[] { 172,181});
    shape.add(new int[] { 153,192});shape.add(new int[] { 137,201});shape.add(new int[] { 123,211});shape.add(new int[] { 112,220});shape.add(new int[] { 99,229});shape.add(new int[] { 90,237});shape.add(new int[] { 80,244});shape.add(new int[] { 73,250});shape.add(new int[] { 69,254});shape.add(new int[] { 69,252});
    Unistroke star = new Unistroke("star", shape);
    shape.clear();
    
    shape.add(new int[] { 81,219});shape.add(new int[] { 84,218});shape.add(new int[] { 86,220});shape.add(new int[] { 88,220});shape.add(new int[] { 90,220});shape.add(new int[] { 92,219});shape.add(new int[] { 95,220});shape.add(new int[] { 97,219});shape.add(new int[] { 99,220});shape.add(new int[] { 102,218});shape.add(new int[] { 105,217});
    shape.add(new int[] { 107,216});shape.add(new int[] { 110,216});shape.add(new int[] { 113,214});shape.add(new int[] { 116,212});shape.add(new int[] { 118,210});shape.add(new int[] { 121,208});shape.add(new int[] { 124,205});shape.add(new int[] { 126,202});shape.add(new int[] { 129,199});shape.add(new int[] { 132,196});shape.add(new int[] { 136,191});
    shape.add(new int[] { 139,187});shape.add(new int[] { 142,182});shape.add(new int[] { 144,179});shape.add(new int[] { 146,174});shape.add(new int[] { 148,170});shape.add(new int[] { 149,168});shape.add(new int[] { 151,162});shape.add(new int[] { 152,160});shape.add(new int[] { 152,157});shape.add(new int[] { 152,155});shape.add(new int[] { 152,151});
    shape.add(new int[] { 152,149});shape.add(new int[] { 152,146});shape.add(new int[] { 149,142});shape.add(new int[] { 148,139});shape.add(new int[] { 145,137});shape.add(new int[] { 141,135});shape.add(new int[] { 139,135});shape.add(new int[] { 134,136});shape.add(new int[] { 130,140});shape.add(new int[] { 128,142});shape.add(new int[] { 126,145});
    shape.add(new int[] { 122,150});shape.add(new int[] { 119,158});shape.add(new int[] { 117,163});shape.add(new int[] { 115,170});shape.add(new int[] { 114,175});shape.add(new int[] { 117,184});shape.add(new int[] { 120,190});shape.add(new int[] { 125,199});shape.add(new int[] { 129,203});shape.add(new int[] { 133,208});shape.add(new int[] { 138,213});
    shape.add(new int[] { 145,215});shape.add(new int[] { 155,218});shape.add(new int[] { 164,219});shape.add(new int[] { 166,219});shape.add(new int[] { 177,219});shape.add(new int[] { 182,218});shape.add(new int[] { 192,216});shape.add(new int[] { 196,213});shape.add(new int[] { 199,212});shape.add(new int[] { 201,211});
    Unistroke pigtail = new Unistroke("pigtail", shape);
    shape.clear();
}

//Draw is called each time the screen is refreshed, the default framerate is 60fps
//And therefore, the draw funtion is called 60 times per second
void draw(){
  //Sets the background of the window / canvas to white
  background(255);
  //Calls the draw button function creating a button that clears the canvas
  drawButton(10, 10, 80, 60, "Clear");
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
   if(mouseX >10 && mouseX < 90 && mouseY > 10 && mouseY < 70){
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
   if(!(mouseX >10 && mouseX < 90 && mouseY > 10 && mouseY < 70)){
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
  strokeWeight(5);
  stroke(0);
  //The function draws a rectangle with the x, and y coordinates, as well as the
  //Width and height
  rect(x, y, wid, hei, 10);
  //This sets the mode for the text to be centered on the coordinates
  textAlign(CENTER, CENTER);
  //Sets the text size 
  textSize(26);
  //Sets the color of the text to black
  fill(0);
  //Draws the text to the window with the passed in text, x, y, width and height
  text(text, x + (wid / 2), y + (hei / 2));
}
