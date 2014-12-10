//
//  ViewController.m
//  EMString
//
//  Created by Tanguy Aladenise on 2014-11-27.
//  Copyright (c) 2014 Tanguy Aladenise. All rights reserved.
//

#import "ViewController.h"
#import "NSString+EMAdditions.h"
#import "EMStringStylingConfiguration.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *topLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *fontFamilies = [UIFont familyNames];
    
    for (int i = 0; i < [fontFamilies count]; i++)
    {
        NSString *fontFamily = [fontFamilies objectAtIndex:i];
        NSArray *fontNames = [UIFont fontNamesForFamilyName:[fontFamilies objectAtIndex:i]];
        NSLog (@"%@: %@", fontFamily, fontNames);
    }

    // Setup my styling for the app.
    // This should not be in a specific view controller, but a more general object like where you setup configuration for your app. If you don't have any maybe the AppDelegate can be useful.
    [EMStringStylingConfiguration sharedInstance].defaultFont  = [UIFont fontWithName:@"HelveticaNeue-Light" size:16];
//    [EMStringStylingConfiguration sharedInstance].defaultColor = [UIColor whiteColor];
    [EMStringStylingConfiguration sharedInstance].h1Font       = [UIFont fontWithName:@"HelveticaNeue-bold" size:24];
    [EMStringStylingConfiguration sharedInstance].strongFont   = [UIFont fontWithName:@"HelveticaNeue-Bold" size:16];
    [EMStringStylingConfiguration sharedInstance].emphasisFont = [UIFont fontWithName:@"HelveticaNeue-Italic" size:16];

    

    EMStylingClass *aStylingClass = [[EMStylingClass alloc] initWithMarkup:@"<blue>"];
    [aStylingClass setColor:[UIColor blueColor]];
    [[EMStringStylingConfiguration sharedInstance] addNewStylingClass:aStylingClass];

    
    self.topLabel.attributedText = @"<h1>Welcome\n<em>to EMSString's magic</em> normal h1</h1>dsad".attributedString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
