//
//  GalacticModel.m
//  SuperGalaxy
//
//  Created by Maksym Hontar on 18/08/14.
//  Copyright (c) 2014 MH. All rights reserved.
//

#import "GalacticSpiral.h"

#define a 0.97
#define r 0.147
#define k -0.07
#define n 19

@implementation GalacticSpiral

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

@end
