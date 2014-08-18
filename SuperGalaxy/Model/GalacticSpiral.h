//
//  GalacticModel.h
//  SuperGalaxy
//
//  Created by Maksym Hontar on 18/08/14.
//  Copyright (c) 2014 MH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGGeometry.h>

#define N M_PI*19

@interface GalacticSpiral : NSObject
CGPoint galacticPoint(float s);
@end
