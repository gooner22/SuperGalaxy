//
//  ViewController.m
//  SuperGalaxy
//
//  Created by Maksym Hontar on 18/08/14.
//  Copyright (c) 2014 MH. All rights reserved.
//

#import "ViewController.h"
#import "Galaxy.h"

@interface ViewController ()<GalaxyProtocol, UIScrollViewDelegate>
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
    
    // configure scroll view
    [self.scrollView setDelegate:self];
//    [self.scrollView setZoomScale:1.0f];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
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
- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidZoom");
    [self.galaxyView handleScaleChanged:scrollView.zoomScale];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.galaxyView;
}
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view{
    NSLog(@"scrollViewWillBeginZooming");
}
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
    NSLog(@"scrollViewDidEndZooming");

}

- (void)zoomToRect:(CGRect)rect animated:(BOOL)animated{
    
}

@end
