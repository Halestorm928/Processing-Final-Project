public class Player
{
  int x, y, direction, storedDir;
  boolean canMove;
  boolean stillMoving;
  //Node[] nList;
  public Node curNode;
  RectCollision body;
  
  public Player(int x, int y, int wCol, int hCol)
  {
    body = new RectCollision(width/2, height/2, wCol-1, hCol-1);
    this.x = x; this.y = y;
    
    
    
  }
  
  void show()  {    rect(this.x, this.y, 49, 49);          }
  
  public void getFirstNode()
  {
    Node temp = getNodeAtPos();
    if(temp != null)    {      curNode = temp; curNode.setNeighbors(temp.neighbors);    }
  }
  
  public Node getNodeAtPos()
  {
    int checker = board.isOLappingNode();
    if(checker != -1)
    {
      return board.nList[checker];
    }
    return null;
  }
  
  
  void keyPressed()
  {
    if(key=='w') {direction = 0; storedDirection = 0; moveToNode(direction);}
    if(key=='s') {direction = 1; storedDirection = 1; moveToNode(direction);}
    if(key=='a') {direction = 2; storedDirection = 2; moveToNode(direction);}
    if(key=='d') {direction = 3; storedDirection = 3; moveToNode(direction);}
  
    //if(key=='k') move = 1;
  }
  
  
  void moveToNode(int dir)
  {
    Node moveToNode = canMove(dir);
    if(moveToNode != null)  {player.x = moveToNode.x1;
                             player.y = moveToNode.y1; 
                             body.updateCol(x,y); 
                             curNode = moveToNode;}
  }
  /*
  void move(int direction)
  {
    
    if(!board.isTouchingWall())
    {
       switch(direction)
       {
         case 1: y-=1; break;
         case 2: y+=1; break;
         case 3: x-=1; break;
         case 4: x+=1; break;
         default: break;
       }
       body.updateCol(x, y);
    }
     if(board.isTouchingWall())
     {
       switch(direction)
       {
         case 1: y+=1; break;
         case 2: y-=1; break;
         case 3: x+=1; break;
         case 4: x-=1; break;
         default: break;
       }
       body.updateCol(x,y);
     }
     
     
     if(!board.isgoingtoOverlap())
     {
       switch(direction)
       {
         case 1: y=1; break;
         case 2: y+=1; break;
         case 3: x-=1; break;
         case 4: x+=1; break;
         default: break;
       }
       body.updateCol(x,y);
     }
  
  }
  */
  Node canMove(int dir)
  {
    Node moveToNode = null;
    
    if(curNode != null)
    {
      if(curNode.bools[0] == true && dir == 0)  {  moveToNode = curNode.neighbors[0];}
      if(curNode.bools[1] == true && dir == 1)  {  moveToNode = curNode.neighbors[1];}
      if(curNode.bools[2] == true && dir == 2)  {  moveToNode = curNode.neighbors[2];}
      if(curNode.bools[3] == true && dir == 3)  {  moveToNode = curNode.neighbors[3];}    
    }
    return moveToNode;
  }
  /*
  void queueStore(int direction)
  {
    storedDirection=direction;
  }
  
  void queueMove()
  {
    this.move(storedDirection);
  }
  */
}