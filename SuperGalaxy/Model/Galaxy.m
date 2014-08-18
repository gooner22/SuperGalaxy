//
//  GalacticModel.m
//  SuperGalaxy
//
//  Created by Maksym Hontar on 18/08/14.
//  Copyright (c) 2014 MH. All rights reserved.
//

#import "Galaxy.h"
#import <UIKit/UIGeometry.h>

#define a 0.97
#define r 0.147
#define k -0.07
#define n 19

#define N M_PI*19
#define kStep 0.01

@interface Galaxy()
@property NSArray *stars;
@end

@implementation Galaxy

- (id) init{
    if (self = [super init]){
        _stars = [self computeStars];
    }
    return self;
}

- (NSArray*)computeStars{
    NSMutableArray *aStars = [NSMutableArray array];
    
    for (float s = 0.0; s < N; s+=kStep) {
        CGPoint anGalacticPoint = galacticPoint(s);
        [aStars addObject:[NSValue valueWithCGPoint:anGalacticPoint]];
    }
    return aStars;
}

CGPoint galacticPoint(float s){
    return CGPointMake(galacticX(s), galacticY(s));
}

float galacticX(float s){
    return rnd(r) + a * exp(k*s) * cos(s);
}
float galacticY(float s){
    return rnd(r) + a * exp(k*s) * sin(s);
}

// returns random number in invterval between [0..x]
#define dInterval 10
float rnd(float x){
    float interval = x/dInterval;
    return arc4random()%dInterval*interval;
}

- (NSUInteger)getNumberOfStarsInGalaxy{
    return [self.stars count];
}
- (CGPoint)getStarLocationAtIndex:(int)indexOfStar{
    if (indexOfStar>=0 &&
        [self getNumberOfStarsInGalaxy] > indexOfStar){
        return [[self.stars objectAtIndex:indexOfStar] CGPointValue];
    }
    return CGPointZero;
}

@end
