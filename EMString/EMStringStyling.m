//
//  EMStringStyling.m
//  EMString
//
//  Created by Tanguy Aladenise on 2014-11-27.
//  Copyright (c) 2014 Tanguy Aladenise. All rights reserved.
//

#import "EMStringStyling.h"

@implementation EMStringStyling


+ (EMStringStyling *)sharedInstance
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[EMStringStyling alloc] init];
    });
    return sharedInstance;
}


- (UIFont *)strongFont
{
    return (_strongFont) ?: [UIFont boldSystemFontOfSize:12];
}


- (UIFont *)emphasisFont
{
    return (_emphasisFont) ?: [UIFont italicSystemFontOfSize:12];
}

@end
