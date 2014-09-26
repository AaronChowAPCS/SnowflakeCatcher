SnowFlake [] particle;
Catcher stopper;
void setup()
{
  size(400,400);
  stopper = new Catcher();
  particle = new SnowFlake[100];
  for(int index = 0; index < particle.length; index++)
  {
      particle[index] = new SnowFlake();
  }

}
void draw()
{
    
    for(int index = 0; index < particle.length; index++)
    {
      particle[index].erase();
      particle[index].show();
      particle[index].lookDown();
      particle[index].move();

      if (particle[index].myY > 395)
        particle[index].recreate();
    }
    
}
void mouseDragged()
{
    
        stopper.show();
}
class Catcher
{
  void show()
  {
    fill(255,0,0);
    ellipse(mouseX,mouseY, 10, 10);
  }
}
class SnowFlake 
{
  int myX;
  int myY;
  int flakeSize;
  boolean isMoving;
  SnowFlake()
  {
    
    myX = (int)(Math.random() * 400);
    myY = (int)(Math.random() * 400);
    flakeSize = (int)(Math.random() * 5) + 4;
    isMoving = true;
  }

  void show()
  {
    fill(255);
    ellipse(myX,myY,flakeSize,flakeSize);
  }
  void move()
  {
    if(isMoving == true)
      myY = myY + 1;
  }
  void recreate()
  {
    myX = (int)(Math.random() * 400);
    myY = 0;
  }
  void erase()
  {
    fill(0);
    ellipse(myX,myY,flakeSize + 2,flakeSize + 2);
  }
  void lookDown()
  {
    if(get(myX + 4, myY + 4) == color(0,0,0))
      isMoving = true;
    else if (get(myX + 4, myY + 4) != color(0,0,0))
      isMoving = false;
  }
}


