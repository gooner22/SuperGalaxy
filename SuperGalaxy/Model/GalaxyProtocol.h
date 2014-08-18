//
//  GalaxyProtocol.h
//  SuperGalaxy
//
//  Created by Maksym Hontar on 18/08/14.
//  Copyright (c) 2014 MH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGGeometry.h>

@protocol GalaxyProtocol <NSObject>
@required
- (NSUInteger)getNumberOfStarsInGalaxy;
- (CGPoint)getStarLocationAtIndex:(int)indexOfStar;
@end
