//
//  GalaxyView.m
//  SuperGalaxy
//
//  Created by Maksym Hontar on 18/08/14.
//  Copyright (c) 2014 MH. All rights reserved.
//

#import "GalaxyView.h"
#import "GalacticSpiral.h"
#import "LoggingUtils.h"
#import "CGGeometryUtils.h"
#import "UIView+DrawingUtils.h"
#include <math.h>

#define kScatteringCoef 500.0f;

@implementation GalaxyView


- (void)drawRect:(CGRect)rect {

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor yellowColor].CGColor);

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
    for (float s = 0.0; s < N; s+=0.01) {
        CGFloat scatteringValue = self.scaleFactor * kScatteringCoef;
        CGPoint anGalacticPoint = galacticPoint(s);
        CGPoint galacticPointCentered = CGPointMake(center.x + scatteringValue * anGalacticPoint.x,
                                            center.y + scatteringValue * anGalacticPoint.y);
        // draw if visible for user
        if (CGRectContainsPoint(rect, galacticPointCentered)){
            [self drawPointAt:galacticPointCentered context:context];
            pointsCount++;
        }
    }
    return pointsCount;

}

@end

