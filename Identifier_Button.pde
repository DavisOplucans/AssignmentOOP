class Identifier_Button
{
  float xpos = width - 400;
  float ypos =  height - 206;
  float center_x = 1066;
  float center_y = 584.5;
  boolean light = false;
  boolean dark = true;
  
  void clicked_i(float px, float py)
  {
    float d = dist(px, py, center_x, center_y);
    if(d < 45)
    {
      if(dark)
      {
        light = true;
        dark = false;
      }
      else if(light)
      {
       light = false;
       dark = true;
      }
    }
  }
  
  void display_i()
  {
    if(dark)
    {
      stroke(0, 100, 0);
      fill(34, 139, 34);
    }
    else
    {
      stroke(34, 139, 34);
      fill(50, 205, 50);
    }
    rect(xpos, ypos, 200, 45);
    fill(255);
    text("IDENTIFIER", 1025, 590);
  }
}