Board board;
Ghost ghost;
public Player player;
int direction = 0;
void setup()
{ 
  
  board  = new Board();
  player = new Player(width/2,height/2,0,0,50,50);
  background(51);
  fullScreen();
  //board.show();
}

void draw()
{
  background(51);
  board.show();
  player.show(); 
  player.amIMovingAndNotTouchingDisBooty(direction);
  
}

void keyPressed()
{
  if(key=='w') {direction = 1;}
  if(key=='s') {direction = 2;}
  if(key=='a') {direction = 3;}
  if(key=='d') {direction = 4;}
}

void keyReleased()
{
  
}