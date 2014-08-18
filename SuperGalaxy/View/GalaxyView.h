//
//  GalaxyView.h
//  SuperGalaxy
//
//  Created by Maksym Hontar on 18/08/14.
//  Copyright (c) 2014 MH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScalableView.h"
#import "GalaxyProtocol.h"

@interface GalaxyView : ScalableView
@property (weak) id<GalaxyProtocol> galaxyDelegate;
@end
