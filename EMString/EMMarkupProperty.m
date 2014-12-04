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

NSString * const kEMDefaultMarkup      = @"<defaultEM>";
NSString * const kEMDefaultCloseMarkup = @"</defaultEM>";

NSString * const kEMParagraphMarkup      = @"<p>";
NSString * const kEMParagraphCloseMarkup = @"</p>";

NSString * const kEMStrongMarkup         = @"<strong>";
NSString * const kEMStrongCloseMarkup    = @"</strong>";

NSString * const kEMEmphasisMarkup       = @"<em>";
NSString * const kEMEmphasisCloseMarkup  = @"</em>";

NSString * const kEMUnderlineMarkup      = @"<u>";
NSString * const kEMUnderlineCloseMarkup = @"</u>";

NSString * const kEMStrikethroughMarkup      = @"<s>";
NSString * const kEMStrikethroughCloseMarkup = @"</s>";


NSString * const kEMH1Markup      = @"<h1>";
NSString * const kEMH1CloseMarkup = @"</h1>";

NSString * const kEMH2Markup      = @"<h2>";
NSString * const kEMH2CloseMarkup = @"</h2>";

NSString * const kEMH3Markup      = @"<h3>";
NSString * const kEMH3CloseMarkup = @"</h3>";

NSString * const kEMH4Markup      = @"<h4>";
NSString * const kEMH4CloseMarkup = @"</h4>";

NSString * const kEMH5Markup      = @"<h5>";
NSString * const kEMH5CloseMarkup = @"</h5>";

NSString * const kEMH6Markup      = @"<h6>";
NSString * const kEMH6CloseMarkup = @"</h6>";

//NSString * const kEMStrongFontKey   = @"StrongFontKey";
//NSString * const kEMEmphasisFontKey = @"EmphasisFontKey";

@end
