//
//  ScalableView.m
//  SuperGalaxy
//
//  Created by Maksym Hontar on 18/08/14.
//  Copyright (c) 2014 MH. All rights reserved.
//

#import "ScalableView.h"
#import "LoggingUtils.h"

#define kMinScale 1.0

@implementation ScalableView

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]){
        [self setup];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self setup];
    }
    return self;
}

- (void)setup {
    _locationPoint = CGPointZero;
    _scaleFactor = kMinScale;
    _zoomScale = _scaleFactor;
    
    [self setBackgroundColor:[UIColor whiteColor]];
}

- (void)handlePinch:(UIPinchGestureRecognizer*)sender{
    
    if ([sender isKindOfClass:[UIPinchGestureRecognizer class]]
        || sender == nil){
            
        CGFloat newScale = self.scaleFactor+sender.scale-self.zoomScale;
        if (newScale < kMinScale) {
            logError(@"scale limit");
        }else{
            if (sender.state == UIGestureRecognizerStateBegan) {
                UIView *piece = sender.view;
                CGPoint locationInView = [sender locationInView:piece];
                self.locationPoint = locationInView;
                logInfo([NSString stringWithFormat:@"new location point %@", NSStringFromCGPoint(locationInView)]);
            }
            
            if (sender.state == UIGestureRecognizerStateChanged){
                [self setScaleFactor:newScale];
                [self setZoomScale:sender.scale];
                [self setNeedsDisplay];
            } else if (sender.state == UIGestureRecognizerStateEnded){
                [self setZoomScale:kMinScale];
                [self setScaleFactor:kMinScale];
                [self setNeedsDisplay];

            }
        }
    } else {
        logError(@"bad gesture recognizer");
    }
}

@end
