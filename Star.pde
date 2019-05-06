class Star
{
  float xpos = random(0, width + 50); 
  float ypos = random(0, 550);
  float r = random(0, 3); 
  float speed = random(1, 3); 
  int hit = 0;
  
  void move()
  {
    xpos = xpos - speed;
    if(xpos < 0)
    {
      xpos = width + 50;
    }
  }
  
  void star_clicked(float px, float py)
  {
    float d = dist(px, py, xpos, ypos);
    if(d < r)
    {
      hit = 1;
    }
    else
    {
      hit = 0;
    }
  }
  
  boolean remove_s()
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
  
  void display_stars(int i)
  {
    if(i % 2 == 0)
    {
      noStroke();
    }
    else
    {
      stroke(255, 255, 0);
      strokeWeight(1);
    }
    fill(255);
    ellipse(xpos, ypos, r*2, r*2);
  }
}
  