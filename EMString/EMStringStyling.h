//
//  EMStringStyling.h
//  EMString
//
//  Created by Tanguy Aladenise on 2014-11-27.
//  Copyright (c) 2014 Tanguy Aladenise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface EMStringStyling : NSObject

+ (EMStringStyling *)sharedInstance;

@property (strong, nonatomic) UIFont *strongFont;
@property (strong, nonatomic) UIFont *emphasisFont;

@end
