//
//  LoggingUtils.h
//  SuperGalaxy
//
//  Created by Maksym Hontar on 18/08/14.
//  Copyright (c) 2014 MH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoggingUtils : NSObject
void logError(NSString *message);
void logInfo(NSString *message);
@end
