//  SideScroller by haje-aatg (Hans-ChristianBJensen)
// An assignment template for a 2D array containing objects
// Contains no comments, since the student needs to make these
// 
// Link: https://github.com/haje-aatg/2DTemplateSideScroller

World[][] worldOne;
Player player = new Player();
int squaresize = 10;
WorldObject exit;
boolean[] downKeys = new boolean[256];
boolean[] downCodedKeys = new boolean[256];

void setup() {
  size(800, 600);
  //size(1280, 960);
  //size(1440, 900);
  //size(1600, 900);
  //size(1680, 1050);
  //size(1920, 1080);
  //fullScreen();
  background(0);
  fill(255);
  stroke(255);
  worldOne = new World[70][40];  //x , y
  println("Dungeon size is: " + worldOne.length + " in x direction &: " + worldOne[0].length + " in y direction");
  for (int xline = squaresize; xline<width; xline+=squaresize) {
    line(xline, 0, xline, height);
  }
  for (int yline = squaresize; yline<height; yline+=squaresize) {
    line(0, yline, width, yline);
  }
  for (int ydir = 0; ydir<worldOne[0].length; ydir++) {
    for (int xdir = 0; xdir<worldOne.length; xdir++) {
      worldOne[xdir][ydir] = new World(worldOne[0].length, ydir);
    }
  }
  exit = new WorldObject(false,new PVector(worldOne.length-1, 3), color(0, 255, 0));
  frameRate(10);
  println("Finished setup @: " + millis());
}

void draw() {
  if (player.place.y<worldOne[0].length-1) {
    if (player.falling(worldOne[int(player.place.x)][int(player.place.y+1)].passable)) {
      player.action(false);
    } else {
      player.action(true);
    }
  } else {
    player.health = 0;
  }
  if (player.isDead()) {
    background(255, 0, 0);
  } else {
    for (int xdir = 0; xdir<worldOne.length; xdir++) {
      for (int ydir = 0; ydir<worldOne[0].length; ydir++) {
        worldOne[xdir][ydir].draw(xdir, ydir, squaresize);
      }
    }
    exit.draw();
    player.draw();
    if ((int)player.place.x == exit.place.x && (int)player.place.y == exit.place.y) {
      exit();
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    //print("Code: " + keyCode + ". ");
    if (keyCode<256) {
      downCodedKeys[keyCode] = true;
    }
  } else {
    //print("Key: " + (int)key + ". ");
    if (key<256) {
      downKeys[key] = true;
    }
  }
}
void keyReleased() {
  if (key == CODED) {
    //print("LiftCode: " + keyCode + ". ");
    if (keyCode<256) {
      downCodedKeys[keyCode] = false;
    }
  } else {
    //print("LiftKey: " + (int)key + ". ");
    if (key<256) {
      downKeys[key] = false;
    }
  }
}
