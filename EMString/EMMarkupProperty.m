//
//  EMMarkupProperty.m
//  EMString
//
//  Created by Tanguy Aladenise on 2014-11-28.
//  Copyright (c) 2014 Tanguy Aladenise. All rights reserved.
//

#import "EMMarkupProperty.h"

@implementation EMMarkupProperty

#pragma mark - Static

NSString * const kEMParagraphMarkup      = @"<p>";
NSString * const kEMParagraphCloseMarkup = @"</p>";

NSString * const kEMStrongMarkup         = @"<strong>";
NSString * const kEMStrongCloseMarkup    = @"</strong>";

NSString * const kEMEmphasisMarkup       = @"<em>";
NSString * const kEMEmphasisCloseMarkup  = @"</em>";

NSString * const kEMUnderlineMarkup      = @"<u>";
NSString * const kEMUnderlineCloseMarkup = @"</u>";



NSString * const kEMStrongFontKey   = @"StrongFontKey";
NSString * const kEMEmphasisFontKey = @"EmphasisFontKey";

@end
