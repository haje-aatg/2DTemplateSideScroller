//  SideScroller by haje-aatg (Hans-ChristianBJensen)
// An assignment template for a 2D array containing objects
// Contains no comments, since the student needs to make these
// 
// Link: https://github.com/haje-aatg/2DTemplateSideScroller

class Player extends WorldObject {
  Player() {
    super();
    worldObjectColor = color(255, 0, 0);
  }
  Player(boolean tempblocked) {
    super(tempblocked);
    worldObjectColor = color(255, 0, 0);
  }
  void moveForward() {
    print(place + " : " + direction);
    if (int(place.y+direction.y)>0 && int(place.x+direction.x)>0) {
      place.add(direction);
      println(" .Now: " + place);
    }
  }
  /*void selfNavigate() {
   println(place + " : " + direction);
   if (int(place.y-direction.x)>0 && int(place.x+direction.y)>0) {
   if (World[int(place.y-direction.x)][int(place.x+direction.y)].passable == true) {
   println("Nothing to left");
   place.x+=direction.y;
   place.y-=direction.x;
   int temp = int(direction.x);
   direction.x=int(direction.y);
   direction.y=-temp;
   }
   } else {
   println("Something to left");
   if (int(place.y+direction.y)>0 && int(place.x+direction.x)>0) {
   if (World[int(place.y+direction.y)][int(place.x+direction.x)].passable == true) {
   println("Something to left. Nothing in front");
   place.add(direction);
   }
   } else {
   println("Something in front");
   if (World[int(place.y+direction.x)][int(place.x-direction.y)].passable == true) {
   println("Something to left & in front. Nothing to right");
   place.x-=direction.y;
   place.y+=direction.x;
   int temp = int(direction.x);
   direction.x=-int(direction.y);
   direction.y=temp;
   } else {
   println("Something to left & in front & to right = deadend");
   place.x-=direction.x;
   place.y-=direction.y;
   direction.x=-int(direction.x);
   direction.y=-int(direction.y);
   }
   }
   }
   }*/
  void action(boolean tJump) {
    /*for (int index =50; index<100; index++) {//downCodedKeys.length
     //println(index + " : " + downCodedKeys[index]);
     println(index + " : " + downKeys[index]);
     }*/
    PVector sumDirection = new PVector(0, 0);
    if (downCodedKeys[38]) {
      direction = new PVector(0, -1);
      sumDirection.add(direction);
      if (worldOne[int(player.place.x)][int(player.place.y-1)].passable && tJump) {
        place.add(direction);
      }
    }
    if (downCodedKeys[40] ) {
      direction = new PVector(0, 1);
      sumDirection.add(direction);
    }
    if (downCodedKeys[37]) {
      direction = new PVector(-1, 0);
      sumDirection.add(direction);
      if (int(player.place.x-1)>=0) {
        if (worldOne[int(player.place.x-1)][int(player.place.y)].passable) {
          place.add(direction);
        }
      }
    }
    if (downCodedKeys[39]) {
      direction = new PVector(1, 0);
      sumDirection.add(direction);
      if (int(player.place.x)<worldOne.length-1) {
        if (worldOne[int(player.place.x+1)][int(player.place.y)].passable) {
          place.add(direction);
        }
      }
    }
    if (sumDirection.mag()>0) {
      direction=sumDirection;
    }
    if (downKeys[97]) {
      if (int(place.x+direction.x) >= 0 && int(place.x+direction.x) <= worldOne.length-1 && int(place.y+direction.y) <= worldOne[0].length-1) {
        print("Attacking! " + direction);
        worldOne[int(place.x+direction.x)][int(place.y+direction.y)].attacked(byte(1));
      }
    }
  }
}
