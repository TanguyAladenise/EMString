//
//  NSString+EMAdditions.m
//  EMString
//
//  Created by Tanguy Aladenise on 2014-11-27.
//  Copyright (c) 2014 Tanguy Aladenise. All rights reserved.
//


#import "NSString+EMAdditions.h"
#import "EMStringStylingConfiguration.h"
//#import <objc/runtime.h>


@implementation NSString (EMAdditions)


- (NSAttributedString *)attributedString
{
    // Default styling first by appending default markup    
    NSString *mutableString = [self stringByAppendingString:kEMDefaultCloseMarkup];
    mutableString = [kEMDefaultMarkup stringByAppendingString:mutableString];
    
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:[self styleParagraphForString:mutableString]];
    // Default style need to be applied first
    string = [self defaultStyling:string];
    string = [self styleStrongForString:string];
    string = [self styleEmphasisForString:string];
    string = [self styleUnderlineForString:string];
    string = [self styleStrikethroughForString:string];
    string = [self styleHeaders:string];

    // For overide purpose this we MUST apply custom class styling in last.
    if ([EMStringStylingConfiguration sharedInstance].stylingClasses.count > 0) {
        for (EMStylingClass *aStylingClass in [EMStringStylingConfiguration sharedInstance].stylingClasses) {
            string = [self styleCustomStylingClass:aStylingClass forString:string];
        }
    }


    return string;
}


#pragma mark - Styling strin


- (NSString *)styleParagraphForString:(NSString *)string
{
    string = [self clearMarkup:kEMParagraphMarkup forString:string];
    string = [string stringByReplacingOccurrencesOfString:kEMParagraphCloseMarkup withString:@"\n"];
    string = [string stringByReplacingOccurrencesOfString:@"\n " withString:@"\n"];
    
    return string;
}


- (NSAttributedString *)defaultStyling:(NSAttributedString *)attributedString
{
    return [self styleMarkup:kEMDefaultMarkup closeMarkup:kEMDefaultCloseMarkup withAttributes:@{NSFontAttributeName : [EMStringStylingConfiguration sharedInstance].defaultFont, NSForegroundColorAttributeName : [EMStringStylingConfiguration sharedInstance].defaultColor } forAttributedString:attributedString];
}


- (NSAttributedString *)styleStrongForString:(NSAttributedString *)attributedString
{
    return [self styleMarkup:kEMStrongMarkup closeMarkup:kEMStrongCloseMarkup withAttributes:@{NSFontAttributeName : [EMStringStylingConfiguration sharedInstance].strongFont, NSForegroundColorAttributeName : [EMStringStylingConfiguration sharedInstance].strongColor } forAttributedString:attributedString];
}


- (NSAttributedString *)styleEmphasisForString:(NSAttributedString *)attributedString
{
    return [self styleMarkup:kEMEmphasisMarkup closeMarkup:kEMEmphasisCloseMarkup withAttributes:@{NSFontAttributeName : [EMStringStylingConfiguration sharedInstance].emphasisFont, NSForegroundColorAttributeName : [EMStringStylingConfiguration sharedInstance].emphasisColor } forAttributedString:attributedString];
}


- (NSAttributedString *)styleUnderlineForString:(NSAttributedString *)attributedString
{
    return [self styleMarkup:kEMUnderlineMarkup closeMarkup:kEMUnderlineCloseMarkup withAttributes:@{NSUnderlineStyleAttributeName : @([EMStringStylingConfiguration sharedInstance].underlineStyle) } forAttributedString:attributedString];
}


- (NSAttributedString *)styleStrikethroughForString:(NSAttributedString *)attributedString
{
    return [self styleMarkup:kEMStrikethroughMarkup closeMarkup:kEMStrikethroughCloseMarkup withAttributes:@{NSStrikethroughStyleAttributeName : @([EMStringStylingConfiguration sharedInstance].striketroughStyle) } forAttributedString:attributedString];
}


- (NSAttributedString *)styleHeaders:(NSAttributedString *)attributedString
{
    attributedString = [self styleMarkup:kEMH1Markup closeMarkup:kEMH1CloseMarkup withAttributes:@{NSFontAttributeName : [EMStringStylingConfiguration sharedInstance].h1Font, NSForegroundColorAttributeName : [EMStringStylingConfiguration sharedInstance].h1Color } forAttributedString:attributedString];
    attributedString = [self styleMarkup:kEMH2Markup closeMarkup:kEMH2CloseMarkup withAttributes:@{NSFontAttributeName : [EMStringStylingConfiguration sharedInstance].h2Font, NSForegroundColorAttributeName : [EMStringStylingConfiguration sharedInstance].h2Color } forAttributedString:attributedString];
    attributedString = [self styleMarkup:kEMH3Markup closeMarkup:kEMH3CloseMarkup withAttributes:@{NSFontAttributeName : [EMStringStylingConfiguration sharedInstance].h3Font, NSForegroundColorAttributeName : [EMStringStylingConfiguration sharedInstance].h3Color } forAttributedString:attributedString];
    attributedString = [self styleMarkup:kEMH4Markup closeMarkup:kEMH4CloseMarkup withAttributes:@{NSFontAttributeName : [EMStringStylingConfiguration sharedInstance].h4Font, NSForegroundColorAttributeName : [EMStringStylingConfiguration sharedInstance].h4Color } forAttributedString:attributedString];
    attributedString = [self styleMarkup:kEMH5Markup closeMarkup:kEMH5CloseMarkup withAttributes:@{NSFontAttributeName : [EMStringStylingConfiguration sharedInstance].h5Font, NSForegroundColorAttributeName : [EMStringStylingConfiguration sharedInstance].h5Color } forAttributedString:attributedString];
    attributedString = [self styleMarkup:kEMH6Markup closeMarkup:kEMH6CloseMarkup withAttributes:@{NSFontAttributeName : [EMStringStylingConfiguration sharedInstance].h6Font, NSForegroundColorAttributeName : [EMStringStylingConfiguration sharedInstance].h6Color } forAttributedString:attributedString];

    
    return attributedString;
}


- (NSAttributedString *)styleCustomStylingClass:(EMStylingClass *)aStylingClass forString:(NSAttributedString *)attributedString
{
    return [self styleMarkup:aStylingClass.markup closeMarkup:aStylingClass.closeMarkup withAttributes:aStylingClass.attributes forAttributedString:attributedString];
}

#pragma mark - Utils


- (NSString *)clearMarkup:(NSString *)markup forString:(NSString *)string
{
    return [string stringByReplacingOccurrencesOfString:markup withString:@""];
}


- (NSAttributedString *)styleMarkup:(NSString *)markup closeMarkup:(NSString *)closeMarkup withAttributes:(NSDictionary *)attributes forAttributedString:(NSAttributedString *)attributedString
{
    // Use a mutable attributed string to apply styling by occurence of markup
    NSMutableAttributedString *styleAttributedString = [[NSMutableAttributedString alloc] initWithAttributedString:attributedString];
    
    NSRange openMarkupRange;
    
    // Find range of open markup
    while((openMarkupRange = [styleAttributedString.mutableString rangeOfString:markup]).location != NSNotFound) {
        
        NSLog(@"debut markup range %lu - %lu", (unsigned long)openMarkupRange.location, (unsigned long)openMarkupRange.length);
        
        // Find range of close markup
        NSRange closeMarkupRange = [styleAttributedString.mutableString rangeOfString:closeMarkup];
        
        NSLog(@"debut markup range %lu - %lu", (unsigned long)closeMarkupRange.location, (unsigned long)closeMarkupRange.length);
        
        // Calculate the style range that represent the string between the open and close markups
        NSRange styleRange = NSMakeRange(openMarkupRange.location, closeMarkupRange.location + closeMarkupRange.length - openMarkupRange.location);
        
        // Before applying style to the markup, make sure there is "sub" style that have been applied before.
        __block NSMutableArray *restoreStyle = [[NSMutableArray alloc] init];
        
        [styleAttributedString enumerateAttributesInRange:styleRange options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired usingBlock:^(NSDictionary *attrs, NSRange range, BOOL *stop) {
            if (attrs.count > 0) {
                if (range.length < styleRange.length) {
                    [restoreStyle addObject:@{ @"range" : [NSValue valueWithRange:range], @"attrs" : attrs}];
                }
            }
        }];
        
        
        BOOL overrideMarkup = NO;
        
        // Apply style to markup
        
        // Check if one of the custom class is not overriding a default markup with a more complex styling
        for (EMStylingClass *aStylingClass in [EMStringStylingConfiguration sharedInstance].stylingClasses) {
            if ([aStylingClass.markup isEqualToString:markup]) {
                overrideMarkup = YES;
                [styleAttributedString addAttributes:aStylingClass.attributes range:styleRange];
            }
        }
        
        if (!overrideMarkup) {
            [styleAttributedString addAttributes:attributes range:styleRange];
        }

        // Restore "sub" style if necessary
        for (NSDictionary *style in restoreStyle) {
            [styleAttributedString addAttributes:style[@"attrs"] range:[style[@"range"] rangeValue]];
            if ([attributes valueForKey:NSForegroundColorAttributeName]) {
                [styleAttributedString addAttribute:NSForegroundColorAttributeName value:[attributes valueForKey:NSForegroundColorAttributeName] range:[style[@"range"] rangeValue]];

                NSLog(@"%@",[attributes valueForKey:NSForegroundColorAttributeName]);
            }
        }
        
        // Remove opening markup in string
        [styleAttributedString.mutableString replaceCharactersInRange:NSMakeRange(openMarkupRange.location, openMarkupRange.length) withString:@""];
        
        // Refind range of closing markup because it moved since we removed opening markup
        closeMarkupRange = [styleAttributedString.mutableString rangeOfString:closeMarkup];
        
        // Remove closing markup in string
        [styleAttributedString.mutableString replaceCharactersInRange:NSMakeRange(closeMarkupRange.location, closeMarkupRange.length) withString:@""];
    }
    
    return styleAttributedString;
}


//- (void)setStrongFont:(UIFont *)strongFont
//{
//    objc_setAssociatedObject(self, (__bridge const void *)(emStrongFontKey), strongFont, OBJC_ASSOCIATION_COPY);
//}
//
//- (UIFont *)strongFont
//{
//    return objc_getAssociatedObject(self, (__bridge const void *)(emStrongFontKey));
//}

@end
