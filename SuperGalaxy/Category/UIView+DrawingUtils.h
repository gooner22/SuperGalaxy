//
//  UIView+DrawingUtils.h
//  SuperGalaxy
//
//  Created by Maksym Hontar on 18/08/14.
//  Copyright (c) 2014 MH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DrawingUtils)
/**
 * this is helper for drawing point
 */
- (void)drawPointAt:(CGPoint)point context:(CGContextRef)context border:(CGFloat)border;
- (void)drawElipseAtPoint:(CGPoint)point context:(CGContextRef)context border:(CGFloat)border;
- (UIColor*)randomColor;
@end
