//
//  LoggingUtils.m
//  SuperGalaxy
//
//  Created by Maksym Hontar on 18/08/14.
//  Copyright (c) 2014 MH. All rights reserved.
//

#import "LoggingUtils.h"

@implementation LoggingUtils

void logError(NSString *message, ...){
    va_list arguments;
    logMessage(@"ERROR", message, arguments);
}

void logInfo(NSString *message, ...){
    va_list arguments;
    logMessage(@"INFO", message, arguments);
}

void logMessage(NSString *level, NSString *message, ...){
    va_list arguments;

    va_start(arguments, message);
    NSString * str = [[NSString alloc] initWithFormat:message arguments:arguments];
    va_end(arguments);

    NSLog(@"[%@] %@", level, str);
}
@end
