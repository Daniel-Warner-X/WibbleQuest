//
//  WibbleQuestPrintingCategory.h
//  MyBoots
//
//  Created by orta therox on 10/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "WibbleQuest.h"

@interface WibbleQuest (WibbleQuestPrintingCategory) 

// any extra narratives
-(void) print:(NSString*)string;
-(void) heading:(NSString*)string;
-(void) command:(NSString*)string;
-(void) title:(NSString*)string;

-(void) execJS:(NSString*) js;

@end