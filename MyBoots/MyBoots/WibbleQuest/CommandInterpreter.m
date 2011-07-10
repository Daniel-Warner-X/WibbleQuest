//
//  CommandInterpreter.m
//  MyBoots
//
//  Created by orta therox on 10/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "CommandInterpreter.h"

@implementation CommandInterpreter
@synthesize wq;

-(void)parse:(NSString*) string {
  string = [string lowercaseString];
  NSArray * parameters = [string componentsSeparatedByString:@" "];
  if ([parameters count] == 1) {
    NSString * command = [parameters objectAtIndex:0];
    if([@"help" isEqualToString:command]){
      [self help];
    }
    
    if([@"north" isEqualToString:command] || [@"n" isEqualToString:command]){
      if (wq.currentRoom.north) {
        wq.currentRoom = wq.currentRoom.north;
        [wq describeSurroundings];
        return;
      }else{
        [wq print:@"There is nothing to the north."];
      }
    }
    
    if([@"west" isEqualToString:command] || [@"w" isEqualToString:command]){
      if (wq.currentRoom.west) {
        wq.currentRoom = wq.currentRoom.west;
        [wq describeSurroundings];
        return;
      }else{
        [wq print:@"There is nothing to the west."];
      }
    }
    
    if([@"east" isEqualToString:command] || [@"e" isEqualToString:command]){
      if (wq.currentRoom.east) {
        wq.currentRoom = wq.currentRoom.east;
        [wq describeSurroundings];
        return;
      }else{
        [wq print:@"There is nothing to the east."];
      }
    }

    if([@"south" isEqualToString:command] || [@"s" isEqualToString:command]){
      if (wq.currentRoom.south) {
        wq.currentRoom = wq.currentRoom.south;
        [wq describeSurroundings];
        return;
      }else{
        [wq print:@"There is nothing to the south."];
      }
    }
    
    if([@"look" isEqualToString:command] || [@"l" isEqualToString:command]){
      [wq describeSurroundings];
      return;
    }
    
  }

}


-(void) help {
  if([wq.game respondsToSelector:@selector(help)]){
    [wq.game help];
  }else{
    
    [wq title:@"Help File"];
    
    [wq print:@"Directions: type in north, east, south or west to move."];
    [wq print:@"Directions: type in north, east, south or west to go to another room."];    
  }
}

@end
