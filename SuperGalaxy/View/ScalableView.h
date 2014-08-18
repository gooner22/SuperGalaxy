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

- (void)handlePinch:(UIPinchGestureRecognizer*)sender;

@end
