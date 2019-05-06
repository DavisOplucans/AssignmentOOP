class Planet
{
  PImage planet; 
  float x = random(-20, 650); 
  float y; 
  float speed = random(0.1, 1);
  String name;
  
  boolean rollover = false; 
  boolean no_go = false; 
  
  Planet(PImage tempPlanet, String tempName, float tempYpos)
  {
    planet = tempPlanet;
    name = tempName;
    y = tempYpos;
  }
  
  void move()
  {
   x = x - speed;
   if(x < -150)
   {
     x = width + 50;
   }
  }
  
  void display()
  {
    image(planet, x, y, 100, 100);
    
    if(rollover)
    {
      noFill();
      stroke(255, 255, 0);
      rect(mouseX - 50, mouseY + 20, 90, 30);
      textSize(15);
      fill(255);
      text(name, mouseX - 45, mouseY + 40);
    }
    
    if(no_go)
    {
      
      noFill();
      stroke(255, 255, 0);
      rect(mouseX - 50, mouseY + 20, 200, 60);
      textSize(15);
      fill(255);
      text("Weapons are too weak", mouseX - 45, mouseY + 40);
    
  }
  }
  
  void rollover(float px, float py) 
  {
    float d = dist(px, py, x, y);
    if (d < 40)
    {
        rollover = true; 
    } 
    else 
    {
        rollover = false;

    }
  }
  
  void scan(float px, float py) 
  {
    float d = dist(px, py, x, y);
    if (d < 40)
    {
       no_go = true;
    } 
    else 
    {
       no_go = false;
    }
  }
}
  