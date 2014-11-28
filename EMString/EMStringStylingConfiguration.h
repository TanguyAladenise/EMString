//
//  EMStringStyling.h
//  EMString
//
//  Created by Tanguy Aladenise on 2014-11-27.
//  Copyright (c) 2014 Tanguy Aladenise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface EMStringStylingConfiguration : NSObject


/**
 *  Singleton instance of EMStringStyleConfiguration. Use this class to setup the styling you need for your strings.
 *
 *  @return An singleton instance of EMStringStylingConfiguration
 */
+ (EMStringStylingConfiguration *)sharedInstance;


/**
 *  The font for strong markup.
 */
@property (strong, nonatomic) UIFont *strongFont;


/**
 *  The font for emphasis markup.
 */
@property (strong, nonatomic) UIFont *emphasisFont;

@end
