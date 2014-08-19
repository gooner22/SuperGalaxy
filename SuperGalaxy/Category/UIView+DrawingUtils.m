//
//  UIView+DrawingUtils.m
//  SuperGalaxy
//
//  Created by Maksym Hontar on 18/08/14.
//  Copyright (c) 2014 MH. All rights reserved.
//

#import "UIView+DrawingUtils.h"

@implementation UIView (DrawingUtils)
- (void)drawPointAt:(CGPoint)point context:(CGContextRef)context border:(CGFloat)border{
    CGContextFillRect(context, CGRectMake(point.x,point.y,border,border));
}

- (void)drawElipseAtPoint:(CGPoint)point context:(CGContextRef)context border:(CGFloat)border{
    CGContextFillEllipseInRect(context, CGRectMake(point.x,point.y,border, border));
}

- (UIColor*)randomColor{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}
@end
