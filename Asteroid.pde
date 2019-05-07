class Asteroid
{
 
  PImage asteroid; 
  float x = random(-20, width + 50); 
  float y = random(0, (height / 100) * 60); 
  float speed = random(1.5, 4);
  int hit = 0;
  //will check if the mouse is pressed over the button
  boolean rollover = false;
  /*
    The constructor comes from void setup(). The PImage array is first loaded and stored within the current index of the loop.
    The arraylist 'asteroids' gets a new asteriod object added to it
    Value of a[i] is passed to the constructor where it can be used
  */
  Asteroid(PImage tempAsteroid)
  {
    asteroid = tempAsteroid;
  }
  /*
    In the second constructor is only executed when the target button has been clicked.
    The mouse is pressed within the distance of the asteriods and they get deleted from the list, as they get deleted , new ones are created in its place, with a default x value.
    This avoids them from appearing randomly in the middle of the screen and instead scrolls through the screen
  */
  Asteroid(PImage tempAsteroid, float tempXpos)
  {
    asteroid = tempAsteroid;
    x = tempXpos;
  }
  
  void move()
  {
    x = x - speed; 
    if(x < -150)
    {
      x = width + 50; 
    }
  }
  
  /*
    This function will only activate when the object instance has been clicked first.
    Each time the mouse has been pressed the parameters of the mouse's current x,y co-ordinates wil be passed to this function.
    This will check if the x,y postions is less than the objects width.heihgt. 
    If it is the hit variable will be assigned 1, if not it will remain 0.
  */
  void asteroid_clicked(float px, float py)
  {
    float d = dist(px, py, x, y);
    if(d < 45)
    {
      hit = 1;
    }
    else
    {
      hit = 0;
    }
  }
  //this function takes place after the asteriod_cliecked function.
  //The variable hit will have its value checked and returned to a boolean value to the main program within the draw() function.
  boolean remove_a()
  {
    if(hit == 1)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
  void display() // function will display the asteriods object image itself
  {
    pushMatrix(); // pushmatrix will make sure all translations and rotations have been saved to the object declared before the popmatrix has been declared
    imageMode(CENTER); // make sure the image rotates from its center 
    translate(x, y); 
    rotate(-radians(frameCount));
    image(asteroid, 0, 0, 50, 50);
    popMatrix(); // popMatrix will reset all transitions and rotations previously specified with the pushmatrix
    if(rollover) // if rollover is true a box with the word asteriod will appear beside it
    {
      strokeWeight(2);
      stroke(255,0, 0);
      noFill();
      rect(mouseX - 40, mouseY + 20, 80, 30);
      textSize(15);
      fill(255);
      text("ASTEROID", mouseX - 35, mouseY + 40);
    }
  }
  // function checks if the mouse is on the asteriod if it's true it will display the box with the message
  void rollover(float px, float py) 
  {
    float d = dist(px, py, x, y);
    if (d < 20)
    {
        rollover = true; 
    } 
    else 
    {
        rollover = false;
    }
  }
}