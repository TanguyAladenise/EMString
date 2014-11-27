//
//  NSString+EMAdditions.m
//  EMString
//
//  Created by Tanguy Aladenise on 2014-11-27.
//  Copyright (c) 2014 Tanguy Aladenise. All rights reserved.
//

#import "NSString+EMAdditions.h"
#import "EMStringStyling.h"
#import <objc/runtime.h>

static NSString * const emParagraphMarkup      = @"<p>";
static NSString * const emParagraphCloseMarkup = @"</p>";
static NSString * const emStrongMarkup         = @"<strong>";
static NSString * const emStrongCloseMarkup    = @"</strong>";
static NSString * const emEmphasisMarkup       = @"<em>";
static NSString * const emEmphasisCloseMarkup  = @"</em>";

static NSString * const emStrongFontKey   = @"StrongFontKey";
static NSString * const emEmphasisFontKey = @"EmphasisFontKey";


@implementation NSString (EMAdditions)


- (NSAttributedString *)attributedString
{
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:[self styleParagraphForString:self]];
    string = [self styleStrongForString:string];
    string = [self styleEmphasisForString:string];
    return string;
}


- (NSString *)styleParagraphForString:(NSString *)string
{
    string = [self clearMarkup:emParagraphMarkup forString:string];
    string = [string stringByReplacingOccurrencesOfString:emParagraphCloseMarkup withString:@"\n"];
    string = [string stringByReplacingOccurrencesOfString:@"\n " withString:@"\n"];
    
    return string;
}


- (NSAttributedString *)styleStrongForString:(NSAttributedString *)attributedString
{
    return [self styleMarkup:emStrongMarkup closeMarkup:emStrongCloseMarkup withAttributes:@{NSFontAttributeName : [EMStringStyling sharedInstance].strongFont } forAttributedString:attributedString];
}


- (NSAttributedString *)styleEmphasisForString:(NSAttributedString *)attributedString
{
    return [self styleMarkup:emEmphasisMarkup closeMarkup:emEmphasisCloseMarkup withAttributes:@{NSFontAttributeName : [EMStringStyling sharedInstance].emphasisFont } forAttributedString:attributedString];
}



#pragma mark - Utils

- (NSString *)clearMarkup:(NSString *)markup forString:(NSString *)string
{
    return [string stringByReplacingOccurrencesOfString:markup withString:@""];
}


- (NSAttributedString *)styleMarkup:(NSString *)markup closeMarkup:(NSString *)closeMarkup withAttributes:(NSDictionary *)attributes forAttributedString:(NSAttributedString *)attributedString
{
    NSMutableAttributedString *styleAttributedString = [[NSMutableAttributedString alloc] initWithAttributedString:attributedString];

    NSRange openMarkupRange = NSMakeRange(0, styleAttributedString.mutableString.length);
    
    while(openMarkupRange.location != NSNotFound) {
        
        openMarkupRange = [styleAttributedString.mutableString rangeOfString:markup];
        
        if(openMarkupRange.location != NSNotFound){
            
            
            NSLog(@"debut markup range %lu - %lu", (unsigned long)openMarkupRange.location, (unsigned long)openMarkupRange.length);
            
            NSRange closeMarkupRange = [styleAttributedString.mutableString rangeOfString:closeMarkup];
            
            NSLog(@"debut markup range %lu - %lu", (unsigned long)closeMarkupRange.location, (unsigned long)closeMarkupRange.length);
            
            NSRange styleRange = NSMakeRange(openMarkupRange.location, closeMarkupRange.location + closeMarkupRange.length - openMarkupRange.location);
            [styleAttributedString addAttributes:attributes range:styleRange];
    
            [styleAttributedString.mutableString replaceCharactersInRange:NSMakeRange(openMarkupRange.location, openMarkupRange.length) withString:@""];
            
            closeMarkupRange = [styleAttributedString.mutableString rangeOfString:closeMarkup];
            
            [styleAttributedString.mutableString replaceCharactersInRange:NSMakeRange(closeMarkupRange.location, closeMarkupRange.length) withString:@""];
        }
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
