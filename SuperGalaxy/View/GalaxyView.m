//
//  GalaxyView.m
//  SuperGalaxy
//
//  Created by Maksym Hontar on 18/08/14.
//  Copyright (c) 2014 MH. All rights reserved.
//

#import "GalaxyView.h"
#import "Galaxy.h"
#import "LoggingUtils.h"
#import "CGGeometryUtils.h"
#import "UIView+DrawingUtils.h"
#include <math.h>

static CGFloat kScatteringCoef = 400.0f;

@implementation GalaxyView

- (void)drawRect:(CGRect)rect {

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);

    NSDate *methodStart = [NSDate date];
    
    int pointsCount = [self drawGalactic:context rect:rect];
    
    NSDate *methodFinish = [NSDate date];
    NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:methodStart];
    
    logInfo([NSString stringWithFormat:@"executionTime =%f; it=%d", executionTime, pointsCount]);

}

/**
 * this method draws galactic points
 *  
 * @returns number of points drawn
 */
- (int)drawGalactic:(CGContextRef)context rect:(CGRect)rect{
    CGPoint center = CGRectCenter(rect);
    int pointsCount = 0;
    if (!self.galaxyDelegate){
        logError(@"delegate is nil");
        return -1;
    }
    
    logInfo(NSStringFromCGRect(rect));
    
    CGFloat borderWidth = 1.0f;
    
    NSUInteger stars = [self.galaxyDelegate getNumberOfStarsInGalaxy];
    for (int i = 0; i < stars; i++) {
        
        CGFloat scatteringValue = kScatteringCoef * self.scaleFactor;
        CGPoint anGalacticPoint = [self.galaxyDelegate getStarLocationAtIndex:i];;
        CGPoint galacticPointCentered = CGPointMake(center.x + scatteringValue * anGalacticPoint.x,
                                            center.y + scatteringValue * anGalacticPoint.y);
        if (i == 120){
            logInfo([NSString stringWithFormat:@"%@", NSStringFromCGPoint(galacticPointCentered)]);
        }

        // draw if visible for user
//        if (CGRectContainsPoint(rect, galacticPointCentered)){
        [self drawPointAt:galacticPointCentered context:context borderWidth:borderWidth];
            pointsCount++;
//        }

    }
    
    return pointsCount;

}

@end

