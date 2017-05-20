Board board;
Ghost ghost;
public Player player;
int direction = 0;
int storedDirection = 0;
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
  player.move(direction);
  
}

void keyPressed()
{
  if(key=='w') {direction = 1; storedDirection = 1; player.queueStore(storedDirection);}
  if(key=='s') {direction = 2; storedDirection = 2; player.queueStore(storedDirection);}
  if(key=='a') {direction = 3; storedDirection = 3; player.queueStore(storedDirection);}
  if(key=='d') {direction = 4; storedDirection = 4; player.queueStore(storedDirection);}
}

void keyReleased()
{
  
}