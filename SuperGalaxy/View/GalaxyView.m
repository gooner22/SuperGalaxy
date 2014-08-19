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

@interface GalaxyView()
@property (strong) NSArray* colors;
@end
static CGFloat kScatteringCoef = 500.0f;

@implementation GalaxyView

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]){
        NSMutableArray *aColors = [NSMutableArray array];
        for (int i=0; i<50; i++) {
            [aColors addObject:[self randomColor]];
        }
        _colors = aColors;
    }
    return self;
}
- (void)drawRect:(CGRect)rect {

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
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
    if (!self.galaxyDelegate){
        logError(@"delegate is nil");
        return -1;
    }

    CGFloat x = self.center.x;
    CGFloat y = self.center.y;
    if(!CGPointEqualToPoint(self.locationPoint, CGPointZero)){
        x = self.locationPoint.x + (self.centerPoint.x - self.locationPoint.x) * self.zoomScale;
        y = self.locationPoint.y + (self.centerPoint.y - self.locationPoint.y) * self.zoomScale;

        [self setOldCenterPoint:CGPointMake(x, y)];
    } else{
        [self setCenterPoint:self.center];
        [self setOldCenterPoint:self.center];
    }

    int pointsCount = 0;
    NSUInteger stars = [self.galaxyDelegate getNumberOfStarsInGalaxy];
    for (int i = 0; i < stars; i++) {
        
        CGFloat scatteringValue = kScatteringCoef * self.scaleFactor;
        CGPoint anGalacticPoint = [self.galaxyDelegate getStarLocationAtIndex:i];
        
        CGPoint galacticPointCentered = CGPointMake(floorf(x + scatteringValue * anGalacticPoint.x),
                                            floorf(y + scatteringValue * anGalacticPoint.y));

        // draw if visible for user
        if (CGRectContainsPoint(rect, galacticPointCentered)){
            CGContextSetFillColorWithColor(context, [(UIColor*)[[self colors] objectAtIndex:arc4random() % [[self colors] count]]CGColor]);
            [self drawPointAt:galacticPointCentered context:context border:(2.0f * self.scaleFactor/1.5)];
            pointsCount++;
        }

    }
    
    if(self.zoomScale != 1){
        CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
        [self drawElipseAtPoint:self.locationPoint context:context border:10.0f];
    }

    return pointsCount;

}

@end

