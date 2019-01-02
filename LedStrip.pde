final int LED_STRIP_TYPE_REGULAR = 0;
final int LED_STRIP_TYPE_CIRCLE = 1;
final int LED_STRIP_TYPE_BOX = 2;

class LedStrip {
  
  int sSize;
  int lSizeX;
  int lSizeY;

  PVector locSpacing;
  PVector locOrigin;
  PVector marginSpacing;
  PVector size;

  int lLedSize;
  int lType;
  int lRadius;

  PVector stripStart;
  PVector stripEnd;

  Led[] arrLeds;

  LedStrip (int _stripType, int _sizeX, int _sizeY, int _ledSize, int _x, int _y, int _spacingX, int _spacingY) {

    lLedSize = _ledSize;
    lType = _stripType;
    sSize = _sizeX * _sizeY;

    lSizeX = _sizeX;
    lSizeY = _sizeY;
    
    lRadius = _ledSize;
    
    locSpacing = new PVector(_spacingX, _spacingY);
    marginSpacing = new PVector(_spacingX - 2*lRadius, _spacingY - 2*lRadius);
    locOrigin = new PVector(_x, _y);

    size = new PVector(_spacingX * _sizeX, _spacingY * _sizeY);

    arrLeds = new Led[sSize];

    //println(arrLeds.length);
    switch(lType) {
      
      case LED_STRIP_TYPE_BOX:
      
        for (int i=0; i<_sizeY; i++) {
          for (int j=0; j<_sizeX; j++) {
            arrLeds[_sizeX * i + j] = new Led(int(j*locSpacing.x), int(i*locSpacing.y));
          }
        }
        break;
        
      case LED_STRIP_TYPE_REGULAR:
            
        for (int i=0; i<sSize; i++) {
          arrLeds[i] = new Led(int(i*locSpacing.x), int(i*locSpacing.y));
        }
        break;
        
      case LED_STRIP_TYPE_CIRCLE:
        
        for (int i=0; i<sSize; i++) {
          arrLeds[i] = new Led(lRadius,0);
        }
        break;
    }
    
    //stripStart = new PVector(locOrigin.x - LED_SIZE, locOrigin.y - LED_SIZE);
    //stripEnd = new PVector(sSize * (locSpacing.x), locOrigin.y);
    
    stripStart = new PVector(
      -lRadius - marginSpacing.x*.5, 
      -lRadius - marginSpacing.y*.5
    );
    
    stripEnd = new PVector(
                _sizeX * (locSpacing.x), 
                _sizeY * (locSpacing.y)
     );
  }

  void update() { 
  } 

  void setColor(int _i, color _c) {
    //println("color " + red(_c));
     arrLeds[_i].c = _c;
  }
  
  void draw() {
    //Draw Rectangle
       
    pushMatrix();
    translate(locOrigin.x, locOrigin.y);
      
    if (lType == LED_STRIP_TYPE_REGULAR)
    {

      for (int i=0; i<sSize; i++) {
        arrLeds[i].draw();   
      }

      noFill();
      rect(stripStart.x, stripStart.y, stripEnd.x, stripEnd.y);
    }
    else if (lType == LED_STRIP_TYPE_BOX)
    {
 
      for (int i=0; i<sSize; i++) {
        arrLeds[i].draw();   
      }

      noFill();
      rect(stripStart.x, stripStart.y, stripEnd.x, stripEnd.y);
 
    } else {
      for (int i=0; i<sSize; i++) {
        rotate(TWO_PI/sSize);
        arrLeds[i].draw();   
      }
    }

    popMatrix();
  }

}  

class LedStripGroup {
  
    LedStrip[] arrLedStrips;
    
    LedStripGroup() {
      
    }

    
}

class Led {
  
  color c;
  int x, y;
  int lSize;

  Led () {}

  Led (int _x, int _y) { 
    x = _x;
    y = _y;
  }

  void setLoc(int _x, int _y) {
  
    //println("here");
    //println(_x);

    x = _x;
    y = _y;
  }

  void update(color _c) { 
    c = _c;
  } 
  
  void draw() {
    
    //println("Draw " + c);
    //c = color(255,0,0);
    
    fill(c);
    stroke(150);
    ellipse(x, y, LED_SIZE, LED_SIZE);
  }

}
