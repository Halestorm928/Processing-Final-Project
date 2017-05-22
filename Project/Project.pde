public Board board;
public Ghost ghost;
public Player player;
int direction = 0;
int storedDirection = 4;
int move;
void setup()
{ 
  board  = new Board();
  player = new Player(width/2,height/2,50,50);
  player.getFirstNode();
  background(51);
  fullScreen();
  //board.show();
}

void draw()
{
  background(51);
  board.show();
  player.show(); 
  player.moveToNode(direction);
  
}

void keyPressed()
  {
    if(key=='w') {direction = 0; storedDirection = 0; player.moveToNode(direction);}
    if(key=='s') {direction = 1; storedDirection = 1; player.moveToNode(direction);}
    if(key=='a') {direction = 2; storedDirection = 2; player.moveToNode(direction);}
    if(key=='d') {direction = 3; storedDirection = 3; player.moveToNode(direction);}
  
    //if(key=='k') move = 1;
  }

void keyReleased()
{
  
}