//
//  CGGeometryUtils.m
//  SuperGalaxy
//
//  Created by Maksym Hontar on 18/08/14.
//  Copyright (c) 2014 MH. All rights reserved.
//

#import "CGGeometryUtils.h"

@implementation CGGeometryUtils
CGPoint CGRectCenter(CGRect rect)
{
    return CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
}

@end
