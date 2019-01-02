/*
 * 
 */

final int LED_LENGTH = 64;
final int BOX_WIDTH = 8;
final int BOX_HEIGHT = 8;

final int NUM_X = 2;
final int NUM_Y = 2;

final int CUBE_SIZE = 200;
final int CUBE_RESOLUTION_X = 8;
final int CUBE_RESOLUTION_Y = 8;

final int CUBE_LED_DIAMETER = 20;
final int CUBE_LED_SPACING = 20;
final int CUBE_LED_MARGIN = 10;

final int BOX_SPACING = 20;
final int STRIP_SPACING = 30;
final int LED_SIZE = 12;

//final int NUM_BEAMS = 4;
ArrayList<LedStrip> arrStrip = new ArrayList<LedStrip>();
int _ci = 0;

int bSlash[] = {
1,1,1,0,0,0,0,0,
0,1,1,1,0,0,0,0,
0,0,1,1,1,0,0,0,
0,0,0,1,1,1,0,0,
0,0,0,1,1,1,0,0,
0,0,1,1,1,0,0,0, 
0,1,1,1,0,0,0,0,
1,1,1,0,0,0,0,0
};

Character _c = new Character(8,8,bSlash);

ArrayList<Word> arrWords = new ArrayList<Word>();
//ArrayList<Beam> arrBeam = new ArrayList<Beam>();

void setup() {

  frameRate(60);
  background(0);

  size(800, 800);
  LedStrip _s = new LedStrip(LED_STRIP_TYPE_BOX, BOX_WIDTH, BOX_HEIGHT, LED_SIZE, 100, 100, BOX_SPACING, BOX_SPACING);

  arrStrip.add(_s);
  //arrStrip.add(new LedStrip(LED_STRIP_TYPE_BOX, BOX_WIDTH, BOX_HEIGHT, LED_SIZE, int(100 + _s.size.x), 100, 20, 20));
  //arrStrip.add(new LedStrip(LED_STRIP_TYPE_BOX, BOX_WIDTH, BOX_HEIGHT, LED_SIZE, 100, int(100 + _s.size.y), 20, 20));
  //arrStrip.add(new LedStrip(LED_STRIP_TYPE_BOX, BOX_WIDTH, BOX_HEIGHT, LED_SIZE, int(100 + _s.size.x), int(100 + _s.size.y), 20, 20));

   arrWords.add(new Word(0, .1, 1, 0, _c));
   
   arrWords.get(0).bMove = false;
 
}

void update() {

  //Update each Word
  for (int i=0; i<arrWords.size(); i++) {
    if(!arrWords.get(i).move()) {
      //arrWords.remove(i);
      //arrWords.add(new Beam(int(random(10,30)), random(.015,.15), random(.015,.02),1, int(random(0,LED_LENGTH*2-20)), LED_LENGTH*2));
    } 
  }
   

  /*
  _ci++;
  if (_ci > 255) {
    _ci = 0;
  }
  
  //Update the beams
  for (int i=0; i<arrBeam.size(); i++) {
    if(!arrBeam.get(i).move()) {
      arrBeam.remove(i);
      arrBeam.add(new Beam(int(random(10,30)), random(.015,.15), random(.015,.02),1, int(random(0,LED_LENGTH-20)), LED_LENGTH));
    } 
  }
  
  //for (int i=0; i<LED_LENGTH; i++)
  //{
  //  _strip.setColor(i,color(_ci, _ci, _ci));
  //}
  float _val = 0;
  for(int i=0; i<LED_LENGTH; i++){

    _val = 0;
    for (int j=0; j<arrBeam.size(); j++) {
      _val += arrBeam.get(j).getVal(i) * 255;
    }

    if (_val > 255) {
      _val = 255;
    }

    _strip.setColor(i,color(_val, _val, _val));
  }
  */

  float _val = 0;
  for(int i=0; i<LED_LENGTH; i++){

    _val = 0;
    for (int j=0; j<arrWords.size(); j++) {
      _val += arrWords.get(j).getVal(i) * 255;
    }

    if (_val > 255) {
      _val = 255;
    }
    
    if (i >= LED_LENGTH) {
     
      arrStrip.get(1).setColor((i-LED_LENGTH),color(_val, _val, _val));
      //arrStrip.get(2).setColor(i,color(_val, _val, _val));
      //arrStrip.get(3).setColor(i,color(_val, _val, _val));
    } else {
      arrStrip.get(0).setColor(i,color(_val, _val, _val));
    }    
  }

}

void draw() {

   update();

   for (int j=0; j<arrStrip.size(); j++) {
     arrStrip.get(j).draw();
   }
   
}
