Board board;
Ghost ghost ;

void setup()
{ 
  board  = new Board();
  ghost = new Ghost(0,0,0,0,100,100);
  background(51);
  fullScreen();
  //board.show();
}

void draw()
{
  background(51);
  board.show();
  ghost.show();  
  //if(keyPressed) 
  
  if(key=='d') ghost.move(1);
  if(key=='a') ghost.move(2);
  //if(key=='s') ghost.move(3);
  //if(key=='d') ghost.move(4);
  
}

void keyPressed()
{
  if(key == 'd')
  {    
    ghost.move(1);
  }
}

void keyReleased()
{
  
}