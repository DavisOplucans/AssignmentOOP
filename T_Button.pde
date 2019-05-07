class T_Button
{
  float xpos = 150;
  float ypos =  height - 200;
  float r = 24;
  //boolean variables to test if the button is pressed
  boolean on = false;
  boolean off = true;
  
  /*
    Function of the objecy is when the mouse is pressed this function will be carried out.
    The values of mouseX,y will be passed into the function and its distance will be calculated between the button's x and y postionsusing the dist() function.
    if the value of 'd' is < then the radius of the button will be turned on for true and stay off for false.
    Functions within the draw() and mousePressed() that require on to be true will be able to be carried out.
    if the value of 'd' is > then the radius of the button on will remain false and off will stay true and other functions wont be able to be carried out
  */
  void clicked_b(float px, float py)
  {
    float d = dist(px, py, xpos, ypos);
    if( d < r)
    {
      if(off)
      {
        on = true;
        off = false;
      }
      else if(on)
      {
       on = false;
       off = true;
      }
    }
  }
  void display_b() // Function will display the button and depending of the variable 'on' the colour of the button will be changed.
  {
    if(on)
    {
       stroke(217, 25, 25);
       fill(0, 255, 0);
    }
    else
    {
      stroke(140, 3, 3);
      fill(215, 25, 25);
    }
    ellipse(xpos, ypos, r*2, r*2);
    textSize(15);
    fill(255, 0, 0);
    text("WEAPONS", 115, 530);
  }
}