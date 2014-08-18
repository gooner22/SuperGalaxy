//
//  ScalableView.m
//  SuperGalaxy
//
//  Created by Maksym Hontar on 18/08/14.
//  Copyright (c) 2014 MH. All rights reserved.
//

#import "ScalableView.h"
#import "LoggingUtils.h"

@interface ScalableView()
// used to rememeber old scale value
@property float oldScaleFactor;

@end

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
    _scaleFactor = 1.0;
    _oldScaleFactor = _scaleFactor;
    
    [self setBackgroundColor:[UIColor whiteColor]];
}

- (void)handleScaleChanged:(CGFloat)zoomScale{
    [self setScaleFactor:self.scaleFactor+zoomScale-self.oldScaleFactor];
    [self setOldScaleFactor: zoomScale];
    [self setNeedsDisplay];
}

- (void)handlePinch:(UIPinchGestureRecognizer*)sender{
    if ([sender isKindOfClass:[UIPinchGestureRecognizer class]]
        || sender == nil){
        if (sender.state == UIGestureRecognizerStateChanged){
            [self setScaleFactor:self.scaleFactor+sender.scale-self.oldScaleFactor];
            [self setOldScaleFactor:sender.scale];
            [self setNeedsDisplay];
        } else if (sender.state == UIGestureRecognizerStateEnded){
            [self setOldScaleFactor:1.0];
        }
    } else {
        logError(@"bad gesture recognizer");
    }
}
@end
