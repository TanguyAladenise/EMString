//
//  EMStringStyling.h
//  EMString
//
//  Created by Tanguy Aladenise on 2014-11-27.
//  Copyright (c) 2014 Tanguy Aladenise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "EMStylingClass.h"


@interface EMStringStylingConfiguration : NSObject


/**
 *  Singleton instance of EMStringStyleConfiguration. Use this class to setup the styling you need for your strings.
 *
 *  @return An singleton instance of EMStringStylingConfiguration
 */
+ (EMStringStylingConfiguration *)sharedInstance;


- (void)addNewStylingClass:(EMStylingClass *)stylingClass;


@property (nonatomic, strong, readonly) NSArray *stylingClasses;


// Fonts

/**
 *  The font for strong markup.
 */
@property (strong, nonatomic) UIFont *defaultFont;

/**
 *  The font for strong markup.
 */
@property (strong, nonatomic) UIFont *strongFont;


/**
 *  The font for emphasis markup.
 */
@property (strong, nonatomic) UIFont *emphasisFont;


/**
 *  The font for emphasis markup.
 */
@property (strong, nonatomic) UIFont *h1Font;


/**
 *  The font for emphasis markup.
 */
@property (strong, nonatomic) UIFont *h2Font;


/**
 *  The font for emphasis markup.
 */
@property (strong, nonatomic) UIFont *h3Font;


/**
 *  The font for emphasis markup.
 */
@property (strong, nonatomic) UIFont *h4Font;


/**
 *  The font for emphasis markup.
 */
@property (strong, nonatomic) UIFont *h5Font;


/**
 *  The font for emphasis markup.
 */
@property (strong, nonatomic) UIFont *h6Font;



// Options


/**
 *  NSUnderlineStyle for underlining text
 */
@property (nonatomic) NSUnderlineStyle underlineStyle;


/**
 *  NSUnderlineStyle for striketrough text
 */
@property (nonatomic) NSUnderlineStyle striketroughStyle;


@end
