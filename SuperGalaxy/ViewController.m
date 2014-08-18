//
//  ViewController.m
//  SuperGalaxy
//
//  Created by Maksym Hontar on 18/08/14.
//  Copyright (c) 2014 MH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
            
- (IBAction)pinch:(id)sender {
    if ([sender isKindOfClass:[UIPinchGestureRecognizer class]])
        [self.galaxyView handlePinch:sender];
    
}
@end
