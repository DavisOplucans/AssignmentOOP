class Identifier_Button
{
  float xpos = width - 400;
  float ypos =  height - 206;
  float center_x = 1066;
  float center_y = 584.5;
  // Boolean varibles test if the button is pressed
  boolean goahead = false;
  boolean nogo = true;
  
  /*
    Function of the object is when the mouse is pressed this function will be carried out
    The values of mouseX and Y will be passed into the function and it's distance will be calculated between the button's center x,y postion using the dist() function.
    Value will be stored in the variable 'd'. If the value of 'd' is <45 'ight' will be true and 'nogo' will be false.
    Functions within the draw() and mousePressed() in the main program will be able to be carried out depending on the value 'goahead'.
  */
  void clicked_i(float px, float py)
  {
    float d = dist(px, py, center_x, center_y);
    if(d < 45)
    {
      if(nogo)
      {
        goahead = true;
        nogo = false;
      }
      else if(goahead)
      {
       goahead = false;
       nogo = true;
      }
    }
  }
  /*
    Function will display the button
  */
  void display_i()
  {
    if(nogo)
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