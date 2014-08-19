//
//  ScalableView.h
//  SuperGalaxy
//
//  Created by Maksym Hontar on 18/08/14.
//  Copyright (c) 2014 MH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScalableView : UIView
// used to rememeber old scale value
@property float scaleFactor;
@property CGPoint locationPoint;
@property CGPoint centerPoint;
@property CGPoint oldCenterPoint;
@property float zoomScale;

- (void)handlePinch:(UIPinchGestureRecognizer*)sender;
@end
