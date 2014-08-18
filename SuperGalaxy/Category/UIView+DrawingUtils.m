//
//  UIView+DrawingUtils.m
//  SuperGalaxy
//
//  Created by Maksym Hontar on 18/08/14.
//  Copyright (c) 2014 MH. All rights reserved.
//

#import "UIView+DrawingUtils.h"

@implementation UIView (DrawingUtils)
- (void)drawPointAt:(CGPoint)point context:(CGContextRef)context{
    CGContextFillRect(context, CGRectMake(point.x,point.y,1,1));
}

@end
