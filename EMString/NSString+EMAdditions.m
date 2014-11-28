//
//  NSString+EMAdditions.m
//  EMString
//
//  Created by Tanguy Aladenise on 2014-11-27.
//  Copyright (c) 2014 Tanguy Aladenise. All rights reserved.
//


#import "NSString+EMAdditions.h"
#import "EMStringStyling.h"
//#import <objc/runtime.h>


@implementation NSString (EMAdditions)


- (NSAttributedString *)attributedString
{
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:[self styleParagraphForString:self]];
    string = [self styleStrongForString:string];
    string = [self styleEmphasisForString:string];
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


- (NSAttributedString *)styleStrongForString:(NSAttributedString *)attributedString
{
    return [self styleMarkup:kEMStrongMarkup closeMarkup:kEMStrongCloseMarkup withAttributes:@{NSFontAttributeName : [EMStringStyling sharedInstance].strongFont } forAttributedString:attributedString];
}


- (NSAttributedString *)styleEmphasisForString:(NSAttributedString *)attributedString
{
    return [self styleMarkup:kEMEmphasisMarkup closeMarkup:kEMEmphasisCloseMarkup withAttributes:@{NSFontAttributeName : [EMStringStyling sharedInstance].emphasisFont } forAttributedString:attributedString];
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
        // Apply styling
        [styleAttributedString addAttributes:attributes range:styleRange];
        
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
