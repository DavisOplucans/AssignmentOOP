// The spaceship class has one function which is to display what the shipp looks like

class Spaceship
{
  //test here
  void display()
  {
    strokeWeight(2);
    stroke(255);
    fill(255);
    rect(0, height - 220, width, height);
    triangle(0, height - 280, width - 400, height - 220, 0, height - 220);
    triangle(width, height - 280, 400, height - 220, width, height - 220);
   
   
    stroke(0);
    line(width-1066,height-268,width-1066,height);
    line(width-1066,height-143,0,height-143);
    
    line(width -816,height-268,width-816,height);
    line(width-551,height-268,width-551,height);
    line(width-551,height-133,width,height-133);
  }
}