final int STATE_WAIT = 0;
final int STATE_CONNECTED = 1;

final int RECT_SIZE = 100;
final int ON_SIZE = 10;

class Cube {

    int iID;
    int iState;
    boolean[] arrOn;

    String setName;
    int posX, posY;

    Cube(int _id)
    {

      iID = _id;
      iState = STATE_WAIT;
      
      arrOn = new boolean[4];
      
      for (int i=0; i<4; i++) {
        arrOn[i] = false;  
      }
    }

    void on(int _index) {

      arrOn[_index] = true;
    }

    void off(int _index) {

      arrOn[_index] = false;
      
      iState = STATE_WAIT;
      for (int i=0; i<4; i++) {
        
        if (arrOn[_index] == true) {
         iState = STATE_CONNECTED;   
        }
      }
 
    }
    
    void attach(int _id, String _setName, int _posX, int _posY) //int _connectionIndex)
    {
      
      //arrConnection[_connectionIndex] = _id;
      iState = STATE_CONNECTED;
      
      setName = _setName;
      posX = _posX;
      posY = _posY;
    }

    void detach(int _connectionIndex) 
    {
      iState = STATE_WAIT;
      
      //arrConnection[_connectionIndex] = -1;
      
      /*
      boolean _activeConnected = false;
      for (int i=0; i<4; i++) {
        if (arrConnection[i] != -1) {
           _activeConnected = true; 
        }
      }
 
      if (_activeConnected) {
        iState = STATE_CONNECTED;
      } else {
        iState = STATE_WAIT;
      }
      */
      
    }

    void draw() {
  
      rect(0,0,RECT_SIZE,RECT_SIZE);
      
      for (int i=0; i<4; i++) {
       
        switch(i) {
         
          case 0:
            rect(RECT_SIZE, RECT_SIZE*.5, ON_SIZE, ON_SIZE);
            break;
          case 1:
            rect(RECT_SIZE*.5, RECT_SIZE, ON_SIZE, ON_SIZE);
            break;
          case 2:
            rect(0, RECT_SIZE*.5, ON_SIZE, ON_SIZE);
            break;
          case 3:
            rect(RECT_SIZE*.5, 0, ON_SIZE, ON_SIZE);
            break;
        }
      }
    }
};
