class Planet
{
  PImage planet; //will be storing the image
  float x = random(-20, 650); //random value assigned to the planets x-axis
  float y; //This value is obtained from the array planet_ypos
  float speed = random(0.1, 1);
  String name;
  
  boolean rollover = false; 
  boolean no_go = false; 
  
  /*Object's constructor, it comes from void setup
    The Pimage array is first loaded and stored within the current index of the loop. 
    Values are passed to the constructor where it can be used
  */
  Planet(PImage tempPlanet, String tempName, float tempYpos)
  {
    planet = tempPlanet;
    name = tempName;
    y = tempYpos;
  }
  
  /* Function of this object is to move the planets by decreasing the value of the x position by 1 until x is <0
      it will reset back to width +50
  */
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
    // message will display if true
    if(rollover)
    {
      noFill();
      stroke(255, 255, 0);
      rect(mouseX - 50, mouseY + 20, 90, 30);
      textSize(15);
      fill(255);
      text(name, mouseX - 45, mouseY + 40);
    }
    //message will display if no_go is true
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
  //this function checks if the mouses current x and y values is over the image and will display the planets name
  // only active when the indentifier button has been pressed
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
  
  // Function checks if the mouse value x,y position is over the image. Function is only carried out when the target button is activated
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
  