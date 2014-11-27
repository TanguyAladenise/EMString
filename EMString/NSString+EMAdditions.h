//
//  NSString+EMAdditions.h
//  EMString
//
//  Created by Tanguy Aladenise on 2014-11-27.
//  Copyright (c) 2014 Tanguy Aladenise. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (EMAdditions)

@property (readonly, copy) NSAttributedString *attributedString;

@property (nonatomic, copy) UIFont *strongFont;
@property (strong, nonatomic) UIFont *emphasisFont;


@end
