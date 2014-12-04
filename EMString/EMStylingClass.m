//
//  EMStylingClass.m
//  EMString
//
//  Created by Tanguy Aladenise on 2014-12-04.
//  Copyright (c) 2014 Tanguy Aladenise. All rights reserved.
//

#import "EMStylingClass.h"

@implementation EMStylingClass

- (NSString *)closeMarkup
{
    return [self.markup stringByReplacingOccurrencesOfString:@"<" withString:@"</"];
}

@end
