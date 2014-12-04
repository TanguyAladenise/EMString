//
//  EMStylingClass.h
//  EMString
//
//  Created by Tanguy Aladenise on 2014-12-04.
//  Copyright (c) 2014 Tanguy Aladenise. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMStylingClass : NSObject


@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *markup;

@property (nonatomic, strong, readonly) NSString *closeMarkup;

@property (nonatomic, strong) NSDictionary *attributes;


@end
