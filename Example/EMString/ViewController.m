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
@property (weak, nonatomic) IBOutlet UITextView *textView;

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
    [EMStringStylingConfiguration sharedInstance].defaultFont  = [UIFont fontWithName:@"HelveticaNeue-Light" size:18];
//    [EMStringStylingConfiguration sharedInstance].defaultColor = [UIColor whiteColor];
//    [EMStringStylingConfiguration sharedInstance].h1Font       = [UIFont fontWithName:@"HelveticaNeue-Light" size:24];


    

    EMStylingClass *aStylingClass = [[EMStylingClass alloc] initWithMarkup:@"<description>"];
    [aStylingClass setColor:[UIColor whiteColor]];
    [[EMStringStylingConfiguration sharedInstance] addNewStylingClass:aStylingClass];
    
    aStylingClass = [[EMStylingClass alloc] initWithMarkup:@"<purple>"];
    aStylingClass.color = [UIColor purpleColor];
    aStylingClass.font = [UIFont boldSystemFontOfSize:40];
    [[EMStringStylingConfiguration sharedInstance] addNewStylingClass:aStylingClass];
    
    aStylingClass = [[EMStylingClass alloc] initWithMarkup:@"<red>"];
    aStylingClass.color = [UIColor redColor];
    [[EMStringStylingConfiguration sharedInstance] addNewStylingClass:aStylingClass];
    
    

    
    self.topLabel.attributedText = @"<h1>EMSString's magic</h1>".attributedString;
    
    self.textView.attributedText = @"<description><p>Simple as that:</p><strong>strong</strong>\n<em>em</em>\n<u>u</u>\n<s>s</s>\n<h1>h1</h1><h2>h2</h2><h3>h3</h3><h4>h4</h4><h5>h5</h5><h6>h6</h6></description>\n<purple>purple</purple> <red>red</red>".attributedString;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
