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
    
//    
//    NSArray *fontFamilies = [UIFont familyNames];
//    
//    for (int i = 0; i < [fontFamilies count]; i++)
//    {
//        NSString *fontFamily = [fontFamilies objectAtIndex:i];
//        NSArray *fontNames = [UIFont fontNamesForFamilyName:[fontFamilies objectAtIndex:i]];
//        NSLog (@"%@: %@", fontFamily, fontNames);
//    }

    // Setup my styling for the app.
    // This should not be in a specific view controller, but a more general object like where you setup configuration for your app. If you don't have any maybe the AppDelegate can be useful.
    [EMStringStylingConfiguration sharedInstance].defaultFont  = [UIFont fontWithName:@"Papyrus" size:14];
//    [EMStringStylingConfiguration sharedInstance].emphasisFont  = [UIFont fontWithName:@"Papyrus" size:14];

//    [EMStringStylingConfiguration sharedInstance].defaultColor = [UIColor whiteColor];
//    [EMStringStylingConfiguration sharedInstance].h1Font       = [UIFont fontWithName:@"HelveticaNeue-Light" size:24];


    NSString *text = @"<h2>About EMString</h2>\n<p><strong>EMString</strong> stands for <em><strong>E</strong>asy <strong>M</strong>arkup <strong>S</strong>tring</em>. I hesitated to call it SONSAString : Sick Of NSAttributedString...</p>\n<p>Even if Apple tried to make it easier for us to work with custom fonts and text styling, it still isn't as convenient as it should be. Most of the time if you need to display a text with different styling in it, like \"\n<strong>This text is bold</strong>\nThis text is bold but then <em>italic.</em>\", you would use an <code>NSAttributedString</code> and its API.</p><p>Personnaly I don't like it! It clusters my classes with a lot of boilerplate code to find range and apply style, etc... Or even worse you would use two labels but then struggle to make their frame aligned with dymamic text...</p>\n<p>This should be an easier task. Like right now when I'm typing this <strong>README</strong> file. I just naturally wrote :</p><p>```<strong>This text is bold</strong> but then <em>italic.</em>```</p>\n<p>This is what <strong>EMString</strong> is about. Use the efficient <ins>HTML markup</ins> system we all know and get an iOS string stylized in one line of code and behave like you would expect it to.</p>";
    

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
    
    self.textView.attributedText = text.attributedString;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
