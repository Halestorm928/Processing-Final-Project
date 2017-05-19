Board board;
Ghost ghost;
Player player;
void setup()
{ 
  board  = new Board();
  player = new Player(0,0,0,0,100,100);
  background(51);
  fullScreen();
  //board.show();
}

void draw()
{
  background(51);
  board.show();
  player.show(); 
  
  
}

void keyPressed()
{
  if(key=='w') player.move(1);
  if(key=='s') player.move(2);
  if(key=='a') player.move(3);
  if(key=='d') player.move(4);
}

void keyReleased()
{
  
}