//
//  EMStylingClass.h
//  EMString
//
//  Created by Tanguy Aladenise on 2014-12-04.
//  Copyright (c) 2014 Tanguy Aladenise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface EMStylingClass : NSObject


/**
 *  A given name for a styling class. Optional field.
 */
@property (nonatomic, strong) NSString *name;


/**
 *  The markup identifying the styling to apply in the string
 */
@property (nonatomic, strong) NSString *markup;


/**
 *  The display style for the markup to follow. By default element will be inline. If you want it to return to the line automatically pass this property to YES.
 */
@property (nonatomic, getter=isDisplayBlock) BOOL displayBlock;


/**
 *  The close markup for styling. Read-only property since close markup will be deducted from markup
 */
@property (nonatomic, strong, readonly) NSString *closeMarkup;


/**
 *  A dictionary containing the attributes to set. Attribute keys can be supplied by another framework or can be custom ones you define. For information about where to find the system-supplied attribute keys, see the overview section in NSAttributedString Class Reference.
    https://developer.apple.com/Library/ios/documentation/UIKit/Reference/NSAttributedString_UIKit_Additions/index.html#//apple_ref/doc/constant_group/Character_Attributes
 */
@property (nonatomic, strong) NSDictionary *attributes;


- (EMStylingClass *)initWithMarkup:(NSString *)markup;


/**
 *  The color to apply to the string. Convenient setter to populate attributes.
 */
@property (nonatomic, strong) UIColor *color;

/**
 *  The font to apply to the string. Convenient setter to populate attributes.
 */
@property (nonatomic, strong) UIFont *font;


@end
