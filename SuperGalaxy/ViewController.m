//
//  ViewController.m
//  SuperGalaxy
//
//  Created by Maksym Hontar on 18/08/14.
//  Copyright (c) 2014 MH. All rights reserved.
//

#import "ViewController.h"
#import "Galaxy.h"

@interface ViewController ()<GalaxyProtocol>
@property (strong) Galaxy *galaxy;
@end

@implementation ViewController

#pragma mark VC lifecycle
- (void)viewDidLoad{
    [super viewDidLoad];
    self.galaxy = [[Galaxy alloc] init];
    [self.galaxyView setGalaxyDelegate:self];
}
#pragma mark -

#pragma mark GalaxyProtocol
- (NSUInteger)getNumberOfStarsInGalaxy{
    return [self.galaxy getNumberOfStarsInGalaxy];
}
- (CGPoint)getStarLocationAtIndex:(int)indexOfStar{
    return [self.galaxy getStarLocationAtIndex:indexOfStar];
}
#pragma mark -

#pragma mark IBActions
- (IBAction)pinch:(id)sender {
    if ([sender isKindOfClass:[UIPinchGestureRecognizer class]])
        [self.galaxyView handlePinch:sender];
    
}
#pragma mark -
@end
