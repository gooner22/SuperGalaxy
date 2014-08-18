//
//  LoggingUtils.m
//  SuperGalaxy
//
//  Created by Maksym Hontar on 18/08/14.
//  Copyright (c) 2014 MH. All rights reserved.
//

#import "LoggingUtils.h"

@implementation LoggingUtils

void logError(NSString *message){
    logMessage(@"ERROR", message);
}

void logInfo(NSString *message){
    logMessage(@"INFO", message);
}

void logMessage(NSString *level, NSString *message){
    NSLog(@"[%@] %@", level, message);
}
@end
