public class Node extends RectCollision
{
  public boolean[] bools;
  
  public Node(int x, int y, int w, int h, boolean a, boolean b, boolean c, boolean d)
  {
    super(x,y,w,h);
    bools = new boolean[4];
    bools[0] = a;
    bools[1] = b;
    bools[2] = c;
    bools[3] = d;
  }
  
  public boolean isOver(RectCollision other)
  { // other = l2.x&y, r2.x&y (x1,y1)(x2,y2)
    if(this.x1 == other.x1 && other.y1 == this.y1) //this  = l1.x&y, r1.x&y (x1,y1)(x2,y2)
    {      return true;    }
        
    else
    {
    return false;
    }
  }
  
  public boolean[] getDir()
  {
    return bools;
  }
  

}