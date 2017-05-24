public class Player
{
  public int x, y, direction, storedDir;
  
  public Node curNode, prevNode, targetNode;
  RectCollision body;
  
  
  
  public Player(int x, int y, int wCol, int hCol) //CONSTRUCTOR
  {
    body = new RectCollision(width/2, height/2, wCol-1, hCol-1);
    this.x = x; this.y = y;  
    direction = 2;
    changePos(direction);
  }
  
  void show()  {    rect(this.x, this.y, 49, 49);          }
  
  public void getFirstNode()
  {
    Node temp = getNodeAtPos();
    if(temp != null)    {      curNode = temp; curNode.setNeighbors(temp.neighbors);    }
    else                {      curNode = board.nList[5];    }
  }
  
  
  
  //Check which node the player is at in global space,
  public Node getNodeAtPos()
  {
    int checker = board.isOLappingNode();
    if(checker != -1) return board.nList[checker];
    return null;
  }
  
  public void changePos(int dir)
  {
    if(dir != direction)  {storedDir = dir;}
    
    if(curNode != null)  
    {
      Node moveToNode = canMove(dir);
      if(moveToNode != null)
      {
        direction = dir;
        targetNode = moveToNode;
        prevNode = curNode;
        curNode = null;
      }
    }
  }
  
  public void move()
  {
    if (targetNode != curNode && targetNode != null)
    {
      if(overShotTarget())
      {
        if(curNode != null)
        {
        player.x = curNode.x1;
        player.y = curNode.y1;
        }
        
        Node moveToNode = canMove(storedDir); // can move returns the valid neighbor in which we are moving
        
        if(moveToNode != null)
          direction = storedDir;
          
        if(moveToNode == null)
          moveToNode = canMove(direction);
          
        if(moveToNode != null)
        {
          targetNode = moveToNode;
          prevNode = curNode;
          curNode = null;
        }
      }

      //if(curNode == ) {changePos(storedDir); System.out.println("true");}
      switch(direction)
    {
      case 0: y--; break;
      case 1: y++; break;
      case 2: x--; break;
      case 3: x++; break;
    }
    }
    
  }
  
  
  public void moveToNode(int dir) //THIS MOVES THE CHARACTER TO ONE OF THE POSSIBLE NEIGHBORING NODES  
  {
    Node moveToNode = canMove(dir);
    if(moveToNode != null)  
    {
      player.x = moveToNode.x1;
      player.y = moveToNode.y1; 
      body.updateCol(x,y); 
      curNode = moveToNode;
      direction = dir;
      System.out.println("Player @ ("+ player.x + ", "+ player.y + ")");
    }
  }
  
  public Node canMove(int dir) //THIS METHOD SUPPLEMENTS "void moveToNode(int dir)"
  {
    Node moveToNode = null;        
    for(int i = 0; i < curNode.neighbors.length; i++)
      if(curNode.bools[i] == true && i == dir)  {  moveToNode = curNode.neighbors[i];  break;  }
    return moveToNode;    
  }
  
  public boolean overShotTarget() // THIS METHOD WILL FIND OUT IF THE PLAYER HAS OVERSHOT THE TARGET NODE THEY WERE GOING TO
  {
    float nodeToTarget = lengthFromNode (targetNode.x1, targetNode.y1);
    float nodeToSelf = lengthFromNode (player.x, player.y);
    return nodeToSelf > nodeToTarget;
  }
  public float lengthFromNode (int x, int y) //THIS METHOD FINDS OUT THE LENGTH BEWTEEN THE PREVIOUS NODE AND THE TARGET POSITION OF THE NEXT NODE
  {
    int tempX = x - prevNode.x1;
    int tempY = y - prevNode.y1;
    return sqrt(abs(sq(tempX)+sq(tempY)));
  }
}