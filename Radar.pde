// radars class function is to display the radar for the ship

class Radar
{
  void draw_radar()
  {
   pushMatrix();// pushMatrix makes sure that all translation and rotations until popMatrix() is declared
    int timer = second(); //acts as a timer, storing each second that passes
    translate(width / 100 * 52.5, height / 100 * 92); 
    stroke(255,0,0);
  // The background of the radar will change colour every 4 seconds
    if (timer % 4 == 0)
    {
     fill(119, 136, 153);
    }
    else
    {
     fill(105, 105, 105);
    }
    ellipse(0,0, 150, 150);
    ellipse(0, 0, 115, 115);
    ellipse(0, 0, 80, 80);
    ellipse(0, 0, 45, 45);
    fill(255, 0, 0);
    ellipse(0, 0, 10, 10);
    rotate(radians(frameCount));
    line(0, 0, 75, 0);
    
   popMatrix();// popMatrix() function will reset all translations and rotations specified with the pushMatrix(), the rotate() and translate() can have different values without changeing the previous ones
  }
}