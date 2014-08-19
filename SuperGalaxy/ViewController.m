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
    
    // init model
    self.galaxy = [[Galaxy alloc] init];

    // configure galaxyView
    [self.galaxyView setGalaxyDelegate:self];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.scrollView setContentSize:self.galaxyView.bounds.size];
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

- (IBAction)pinch:(UIPinchGestureRecognizer*)sender {
    [self.galaxyView handlePinch:sender];
}

@end
