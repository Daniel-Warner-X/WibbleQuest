//
//  WibbleQuestPrintingCategory.m
//  MyBoots
//
//  Created by orta therox on 10/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "WibbleQuestPrintingCategory.h"

@implementation WibbleQuest (WibbleQuestPrintingCategory)



-(void) print:(NSString*)string, ... {
  va_list      listOfArguments;
  va_start(listOfArguments, string);
  NSString * formattedString = [[NSString alloc] initWithFormat:string arguments:listOfArguments];
  NSLog(formattedString);
  // run a javascript function to add text to the screen
  NSString * function = [NSString stringWithFormat:@"addParagraph('%@')", formattedString];
  [self execJS:function];
}
-(void) heading:(NSString*)string {
  NSString * function = [NSString stringWithFormat:@"addHeader('%@')", string];
  [self execJS:function];
}
-(void) command:(NSString*)string {
  NSString * function = [NSString stringWithFormat:@"addCommand('%@')", string];
  [self execJS:function];
}
-(void) title:(NSString*)string{
  NSString * function = [NSString stringWithFormat:@"addTitle('%@')", string];
  [self execJS:function];
}
-(void) execJS:(NSString*) js {
  NSString * ok = [_webView stringByEvaluatingJavaScriptFromString:js];
  if([@"OK" isEqualToString:ok] == FALSE){
    NSLog(@"error printing to webview");
  }

}

@end
