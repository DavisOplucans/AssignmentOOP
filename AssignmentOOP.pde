T_Button b1; //object instance of the 'T_Button' class called 'b1'
Identifier_Button b2; // Creating an object instance of the 'Identifier_Button' class called 'b2'
Identifier id1;  // Creating an object instances of the 'Identifier' class called'id1'
Spaceship ship; // Creating an instance of the 'Spaceship' class called 't1'
Target t1; // Creating an instance of the 'Target' class called 't1'
Radar radar; // Creating an instance of the 'Radar' class called 'radar'
// Stat_Button1,2, are extended classes from the 'Stat_Button' class
Stat_Button1 stat_button;
Stat_Button2 stat_button2;

// PImage is a built in class that will encapsulate information
PImage[] p = new PImage[6]; // Using an array of type PImage to store five images called 'p'.Theses are images are the planet images
PImage[] a = new PImage[4]; // The images in this array are the asteriod ones
Planet[] planets = new Planet[6]; 
ArrayList<Star> stars; // using an Arraylist to store objects of the 'Star' class called 'stars'
ArrayList<Asteroid> asteroids;
float xpos = 1336 + 100;  // global variable passed to the 'asteroids' Arraylist type 'Asteriod' class when creating a new instance within the ArrayList

String[] planet_names = {"Mars", "Earth", "Galcantia", "Revlet", "DeathStar", "PICKLE RICK"}; // A string array used to pass the name o each planet to the constructor in 'Planet
float[] planet_ypos = {40, 100, 200, 250, 300, 400}; // An arry of type float to pass the y-axis position of the planets to the constructor in 'Planet'

int removed_stars = 0; // Variable will count the number of stars that the user has deleteed/destroyed/blown up , that have been removed from the 'stars' arraylist
int removed_asteroids = 0; // Variable will count the number of asteriods that the user has destroyed

import controlP5.*; //controlP5 is a library imported to the sketch
ControlP5 cp5; // a built in class in 'controlP5'
int music = 0;
// Using an imported library called 'Minum', 'import' will allow information from the 'minum' library to load in
import ddf.minim.*;
// A built in class in Minim called'minim'
Minim minim;
//built in class called 'AudioPlayer' which will contain the mp3 file
AudioPlayer player;
AudioPlayer laser;

void setup()
{
  /* All measurments are in realation to the size of my screen: 1366 x 768 */
  fullScreen();
  b1 = new T_Button();  // Initiliasing 'b1' as a new 'Button' object
  b2 = new Identifier_Button();
  id1 = new Identifier();
  t1 = new Target();
  ship = new Spaceship();
  radar = new Radar();
  stat_button = new Stat_Button1();
  stat_button2 = new Stat_Button2();
   
  stars = new ArrayList<Star>();  // Initiliasig 'b1' as a new 'Button' object
  for(int i = 0; i < 150;  i++)
  {
    stars.add(new Star()); // Adding 150 'Star' objects to the ArrayList 'stars'
  } 
  //Loading images
  for(int i = 0; i < planets.length; i++)
  {
    /*
      Images will be loaded from the same directory that has the string 'planet' at it's start and will take the value of i
      and add that to the string followed by 'png' which will continue through the loop while i < planets.length
    */
    p[i] = loadImage("planet"+i+".png");
    // A new Planet object will be created and stored in the 'planets' array and will pass on a new PIMage type from the PImage array''p' to the constructor
    // in the planet class, where it will be used in the display function
    planets[i] = new Planet(p[i], planet_names[i], planet_ypos[i]);
  }
  
  asteroids = new ArrayList<Asteroid>(); 
  for(int i = 0; i < 4; i++)
  {
    a[i] = loadImage("asteroid"+i+".png");
    asteroids.add(new Asteroid(a[i]));
  }
  
  minim = new Minim(this); 
  player = minim.loadFile("Apex.mp3");
  player.loop(); 
  laser = minim.loadFile("Laser.mp3");
  
  cp5 = new ControlP5(this);  // initialsing 'cp5' as a new ' ControlP5' object
  cp5.addSlider("music") // addd a horizontal slider, the value of this slider will be linked to the variable music
  .setPosition(100, (height / 100) * 95)
  .setRange(0, 1); 
}

void draw()
{
  // when the stat_button is clicked it will go to the view_stats function and display the screen differently
  if(stat_button.clicked)
  {
    view_stats();
  }
  else
  {
    background(0);
    draw_planets();
    draw_stars();  
    draw_asteroids(); 
 
    ship.display(); 
    b1.display_b(); 
    b2.display_i();
    radar.draw_radar(); 
    
    if(b2.goahead)
    {
      for(int i = asteroids.size()-1; i >= 0; i--)
      {
        Asteroid a1 = asteroids.get(i);
        a1.rollover(mouseX, mouseY);
      }
      
      for(int i = 0; i < planets.length; i++)
      {
        planets[i].rollover(mouseX, mouseY); 
      }
    }
    
    if(b1.on)
    {
      for(int i = 0; i < planets.length; i++)
      {
         planets[i].scan(mouseX, mouseY); 
      }
    }
    
    stat_button.stat_button(); 
    stat_button.text_display(); 
    
    if(b1.on)
    {
   
      t1.display_t();
    }
    if(b2.goahead)
    {
   
      id1.display_id();
    }
  }
  wave_length(); 
  fill(0,0,139);
  textSize(15);
  text("Radio Galaktica", 90, 700);
}

void mousePressed()
{
  if(!b2.goahead)
  {
    b1.clicked_b(mouseX, mouseY);
  }
  
  if(!b1.on)
  {
    b2.clicked_i(mouseX, mouseY);
  }
  // If the boolean variable 'on' is true, the user will be able to delete stars and asteriods when clicked
  if(b1.on)
  {
    for(int i = stars.size()-1; i >= 0; i--)
    {
      Star b = stars.get(i);
      b.star_clicked(mouseX, mouseY);
    }
    
    for(int i = asteroids.size()-1; i >= 0; i--)
    {
      Asteroid a1 = asteroids.get(i);
      a1.asteroid_clicked(mouseX, mouseY);
    }
  }
}

void mouseClicked()
{
  if(mouseX > width - 400 && mouseX < width - 400 + 200 && mouseY > height - 100 && mouseY < height - 100 + 45)
  {
    stat_button.clicked();
  }
}
// function to draw planets
void draw_planets()
{
  for(int i = 0; i < planets.length; i++)
  {
    planets[i].move(); 
    planets[i].display(); 
  }
}

 // function to draw stars
void draw_stars()
{
 for(int i = stars.size()-1; i >= 0; i--)
 {
   Star b = stars.get(i);
   b.display_stars(i);
   b.move();
  
   if(b.remove_s())
   {
     laser.rewind();
     laser.play();
     stars.remove(i);
     stars.add(new Star());
     removed_stars++;
    }
  }
}
//function draws asteriods
void draw_asteroids()
{
 for(int i = asteroids.size()-1; i >= 0; i--)
 {
   Asteroid a1 = asteroids.get(i); // An arraylist doesn't know that it is storing so we have to cast the object coming out, in this case as 'a1'
   a1.display();
   a1.move();
   if(a1.remove_a())
   {
    laser.rewind();
    laser.play();
    asteroids.remove(i);
    asteroids.add(new Asteroid(a[i], xpos));
    removed_asteroids++;
   }
  }
}
//function to draw the wave_lengths of the song when it is played
void wave_length()
{
  fill(0);
  stroke(218, 112, 214);
  rect(350, 600, 160, 90);
  if(music == 1)
  {
    player.play();
    for(int i = 0; i < player.bufferSize() - 1; i++)
    {
      stroke(255);
      /*
        The map() function will map the ranges of 'x1' and 'i' together. The ranges of 'x1 is 350 and 510. 
        The ranges of 'i' is 0 and player.bufferSize().
        This will restrict the waves when drawn between the range of 350 and 510.
      */
      float x1 = map(i, 0, player.bufferSize(), 350, 510);
      float x2 = map(i+1, 0, player.bufferSize(), 350, 510);
      line(x1, 645 + player.right.get(i) * 50, x2, 645 + player.right.get(i+1) * 50);
    }
  }
  else
  {
    player.pause();
    stroke(255);
    strokeWeight(3);
    line(350, 645, 510, 645);
  }
}
void view_stats()
{
  background(95,158,160);
  stat_button2.stat_button();
  stat_button2.text_display();
  fill(255);
  rect(100, 50, 400, 400);
  rect(600, 50, 480, 400);
  textSize(40);
  fill(0);
  text("Stars destroyed", 150, 100);
  text(removed_stars, 280, 300);
  text("Asteroids destroyed", 650, 100);
  text(removed_asteroids, 840, 300);
}