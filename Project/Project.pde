Board board = new Board();
Ghost ghost = new Ghost();

void setup()
{
  background(51);
  fullScreen();
}

void draw()
{
  //board.draw();
  ghost.draw();
  if(keyPressed) if(key == 'b')
  ghost.move(1);
}