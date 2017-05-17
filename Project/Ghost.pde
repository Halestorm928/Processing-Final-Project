public class Ghost 
{
  int x;
  int y;
  
  void draw()
  {
    rect(this.x, this.y, 100, 100);
    
    
  }
  
  void move(int direction)
  {
    switch(direction)
    {
      case 1: x++; break;
      case 2: x--; break;
      case 3: y++; break;
      case 4: y--; break;
      default: break;
    }
  }
}