public Board board;
public Ghost ghost;
public Player player;

int direction;
boolean checkRelease;

void setup()
{ 
  checkRelease = true;
  
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
}

void keyPressed()
  {
    if(key=='w' && checkRelease) {direction = 0; player.moveToNode(direction); checkRelease = false;}
    if(key=='s' && checkRelease) {direction = 1; player.moveToNode(direction); checkRelease = false;}
    if(key=='a' && checkRelease) {direction = 2; player.moveToNode(direction); checkRelease = false;}
    if(key=='d' && checkRelease) {direction = 3; player.moveToNode(direction); checkRelease = false;}
  
    //if(key=='k') move = 1;
  }

void keyReleased()
{
  if(key=='w') {checkRelease = true;}
  if(key=='s') {checkRelease = true;}
  if(key=='a') {checkRelease = true;}
  else if(key=='d') {checkRelease = true;}
}