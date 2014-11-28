//
//  EMStringStyling.m
//  EMString
//
//  Created by Tanguy Aladenise on 2014-11-27.
//  Copyright (c) 2014 Tanguy Aladenise. All rights reserved.
//

#import "EMStringStylingConfiguration.h"

@implementation EMStringStylingConfiguration


#pragma Init


+ (EMStringStylingConfiguration *)sharedInstance
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[EMStringStylingConfiguration alloc] init];
    });
    return sharedInstance;
}


#pragma mark - Getters

#pragma mark - Fonts

- (UIFont *)strongFont
{
    return (_strongFont) ?: [UIFont boldSystemFontOfSize:12];
}


- (UIFont *)emphasisFont
{
    return (_emphasisFont) ?: [UIFont italicSystemFontOfSize:12];
}

#pragma mark - Options


- (NSUnderlineStyle)underlineStyle
{
    return (_underlineStyle == NSUnderlineStyleNone) ?: NSUnderlineStyleSingle;
}

@end
