//
//  EMStringStyling.m
//  EMString
//
//  Created by Tanguy Aladenise on 2014-11-27.
//  Copyright (c) 2014 Tanguy Aladenise. All rights reserved.
//


#import "EMStringStylingConfiguration.h"


@interface EMStringStylingConfiguration()


@property (nonatomic, strong) NSMutableArray *mutableStylingClasses;


@end


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


- (void)addNewStylingClass:(EMStylingClass *)stylingClass
{
    if ([self.stylingClasses containsObject:stylingClass]) {
        NSLog(@"Class already handled");
        return;
    }
    
    [self.mutableStylingClasses addObject:stylingClass];
}


#pragma mark - Getters

#pragma mark - Fonts

- (UIFont *)defaultFont
{
    return (_defaultFont) ?: [UIFont systemFontOfSize:12];
}

- (UIFont *)strongFont
{
    return (_strongFont) ?: [UIFont boldSystemFontOfSize:12];
}


- (UIFont *)emphasisFont
{
    return (_emphasisFont) ?: [UIFont italicSystemFontOfSize:12];
}


- (UIFont *)h1Font
{
    return (_h1Font) ?: [UIFont systemFontOfSize:24];
}


- (UIFont *)h2Font
{
    return (_h2Font) ?: [UIFont systemFontOfSize:22];
}


- (UIFont *)h3Font
{
    return (_h3Font) ?: [UIFont systemFontOfSize:20];
}


- (UIFont *)h4Font
{
    return (_h4Font) ?: [UIFont systemFontOfSize:18];
}


- (UIFont *)h5Font
{
    return (_h5Font) ?: [UIFont systemFontOfSize:16];
}


- (UIFont *)h6Font
{
    return (_h6Font) ?: [UIFont systemFontOfSize:14];
}


#pragma mark - Colors


- (UIColor *)defaultColor
{
    return (_defaultColor) ?: [UIColor blackColor];
}


- (UIColor *)strongColor
{
    return (_strongColor) ?: self.defaultColor;
}


- (UIColor *)emphasisColor
{
    return (_emphasisColor) ?: self.defaultColor;
}


- (UIColor *)h1Color
{
    return (_h1Color) ?: self.defaultColor;
}


- (UIColor *)h2Color
{
    return (_h2Color) ?: self.defaultColor;
}


- (UIColor *)h3Color
{
    return (_h3Color) ?: self.defaultColor;
}


- (UIColor *)h4Color
{
    return (_h4Color) ?: self.defaultColor;
}


- (UIColor *)h5Color
{
    return (_h5Color) ?: self.defaultColor;
}


- (UIColor *)h6Color
{
    return (_h6Color) ?: self.defaultColor;
}


#pragma mark - Options


- (NSUnderlineStyle)underlineStyle
{
    return (_underlineStyle == NSUnderlineStyleNone) ?: NSUnderlineStyleSingle;
}


- (NSUnderlineStyle)striketroughStyle
{
    return (_striketroughStyle == NSUnderlineStyleNone) ?: NSUnderlineStyleSingle;
}


#pragma mark - Lazy instantiation


- (NSMutableArray *)mutableStylingClasses
{
    if (!_mutableStylingClasses) {
        _mutableStylingClasses = [[NSMutableArray alloc] init];
    }
    
    return _mutableStylingClasses;
}


- (NSMutableArray *)stylingClasses
{
    return self.mutableStylingClasses.copy;
}

@end
