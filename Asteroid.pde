class Asteroid
{
 
  PImage asteroid; 
  float x = random(-20, width + 50); 
  float y = random(0, (height / 100) * 60); 
  float speed = random(1.5, 4);
  int hit = 0;
  boolean rollover = false;
  
  Asteroid(PImage tempAsteroid)
  {
    asteroid = tempAsteroid;
  }
  
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
  
  void display()
  {
    pushMatrix();
    imageMode(CENTER); 
    translate(x, y); 
    rotate(-radians(frameCount));
    image(asteroid, 0, 0, 50, 50);
    popMatrix();
    if(rollover)
    {
      strokeWeight(2);
      stroke(255, 255, 0);
      noFill();
      rect(mouseX - 40, mouseY + 20, 80, 30);
      textSize(15);
      fill(255);
      text("ASTEROID", mouseX - 35, mouseY + 40);
    }
  }
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