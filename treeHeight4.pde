import processing.pdf.*;

int offsetHoriz;
int offsetVert;
int verDist = 20;
int horDist = 20;
float [][] positions = {{0}, {-2, 2}, {-3, -1, 1, 3}, 
  {-3.5, -2.5, -1.5, -0.5, 0.5, 1.5, 2.5, 3.5}};
int [][] sequence = {{1}, {0, 0}, {0, 0, 0, 0}, 
                  {0, 0, 0, 0, 0, 0, 0, 0}};

int treeHeight = 4;


void setup() {
  size(870, 1600, PDF, "treeHeight4.pdf");
  
  //size(870, 1600);
  background(255);
  offsetHoriz = 20;
  offsetVert = 50;

  
  noLoop();
    
    
}



void drawSeq(int[][] seq, int upToH){
    for (int i = 0; i<treeHeight; i++) {
      for (int j = 0; j<pow(2, i); j++) {
      if (seq[i][j]==1) {
        if (i>0) {
          line(offsetHoriz+horDist*positions[i-1][floor(j/2)], verDist*(i-1)+offsetVert, 
            offsetHoriz+horDist*positions[i][j], verDist*i+offsetVert);
        }
        fill(0);
        ellipse(offsetHoriz+horDist*positions[i][j], verDist*i+offsetVert, 10, 10);
      }
    }
  }
  text(binaryrep(seq, upToH), offsetHoriz+10*horDist/2-20, offsetVert+20);
}

String binaryrep(int[][] seq, int upToH){
  String seqString= "";
  for (int i=0;i<upToH+1;i++){
    for (int j=0;j<seq[i].length;j++){
      seqString+=seq[i][j];
    }
  }
  return seqString;
  
}

int countTrees = 0;

void draw() {
  background(255);
     
    int h =2;
    for (int k = 1; k<pow(2,2);k++){
      String c = binary(k,2);   
      for (int j=0;j<2; j++){
        sequence[1][j] = Character.getNumericValue(c.charAt(j));
      }
    
    int levelLength = sequence[h].length;
    for (int i = 1; i<pow(2,levelLength);i++){
      String b = binary(i,levelLength);   
      for (int j=0;j<levelLength; j++){
        sequence[h][j] = Character.getNumericValue(b.charAt(j));
      }
      
      for (int l = 1; l<pow(2,8);l++){
      String d = binary(l,8);   
      for (int m=0;m<8; m++){
        sequence[3][m] = Character.getNumericValue(d.charAt(m));
      }
      
      boolean isValid = true;
      for (int x = 1; x<4; x++){
        for (int y = 0; y<positions[x].length;y++){
        if (sequence[x-1][floor(y/2)]==0 && sequence[x][y]==1){
              isValid = false;
            }
          
        
        }
      }
      if (isValid){
        drawSeq(sequence, 3);
        offsetVert+=75;
        if(offsetVert>height*0.8){
          offsetVert=20;
          offsetHoriz+=300;
        }
      }
    }
    }
    }
    line(230,0,230,height);
    line(530,0,530,height);
  exit();
  
}
