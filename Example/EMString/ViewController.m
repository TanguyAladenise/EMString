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

@property (nonatomic) NSString *text;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSArray *fontFamilies = [UIFont familyNames];
    
    for (int i = 0; i < [fontFamilies count]; i++)
    {
        NSString *fontFamily = [fontFamilies objectAtIndex:i];
        NSArray *fontNames = [UIFont fontNamesForFamilyName:[fontFamilies objectAtIndex:i]];
        NSLog (@"%@: %@", fontFamily, fontNames);
    }
    
    self.textView.textContainerInset = UIEdgeInsetsMake(20, 10, 20, 10);


    // Setup my styling for the app.
    // This should not be in a specific view controller, but a more general object like where you setup configuration for your app. If you don't have any maybe the AppDelegate can be useful.
    [EMStringStylingConfiguration sharedInstance].defaultFont  = [UIFont fontWithName:@"Avenir-Light" size:15];
    [EMStringStylingConfiguration sharedInstance].strongFont   = [UIFont fontWithName:@"Avenir" size:15];
    [EMStringStylingConfiguration sharedInstance].emphasisFont = [UIFont fontWithName:@"Avenir-LightOblique" size:15];


    self.text = @"<h4>About EMString</h4>\n<p><strong>EMString</strong> stands for <em><strong>E</strong>asy <strong>M</strong>arkup <strong>S</strong>tring</em>. I hesitated to call it SONSAString : Sick Of NSAttributedString...</p>\n<p>Most of the time if you need to display a text with different styling in it, like \"<strong>This text is bold</strong> but then <em>italic.</em>\", you would use an <code>NSAttributedString</code> and its API. Same thing if suddenly your text is <green><strong>GREEN</strong></green> and then <red><strong>RED</strong></red>...</p><p>Personnaly I don't like it! It clusters my classes with a lot of boilerplate code to find range and apply style, etc...</p>\n<p>This is what <strong>EMString</strong> is about. Use the efficient <u>HTML markup</u> system we all know and get an iOS string stylized in one line of code and behave like you would expect it to.</p>\n<h1>h1 header</h1><h2>h2 header</h2><h3>h3 header</h3><stroke>Stroke text</stroke>\n<strong>strong</strong>\n<em>emphasis</em>\n<u>underline</u>\n<s>strikethrough</s>\n<code>and pretty much whatever you think of...</code>";
    

    
    EMStylingClass *aStylingClass = [[EMStylingClass alloc] initWithMarkup:@"<code>"];
    aStylingClass.color           = [UIColor colorWithWhite:0.151 alpha:1.000];
    aStylingClass.font            = [UIFont fontWithName:@"Courier" size:14];
    aStylingClass.attributes      = @{NSBackgroundColorAttributeName : [UIColor colorWithWhite:0.901 alpha:1.000]};
    [[EMStringStylingConfiguration sharedInstance] addNewStylingClass:aStylingClass];
    
    aStylingClass       = [[EMStylingClass alloc] initWithMarkup:@"<red>"];
    aStylingClass.color = [UIColor colorWithRed:0.773 green:0.000 blue:0.263 alpha:1.000];
    [[EMStringStylingConfiguration sharedInstance] addNewStylingClass:aStylingClass];
    
    aStylingClass       = [[EMStylingClass alloc] initWithMarkup:@"<green>"];
    aStylingClass.color = [UIColor colorWithRed:0.269 green:0.828 blue:0.392 alpha:1.000];
    [[EMStringStylingConfiguration sharedInstance] addNewStylingClass:aStylingClass];

    aStylingClass            = [[EMStylingClass alloc] initWithMarkup:@"<stroke>"];
    aStylingClass.font       = [UIFont fontWithName:@"Avenir-Black" size:26];
    aStylingClass.color      = [UIColor whiteColor];
    aStylingClass.attributes = @{NSStrokeWidthAttributeName: @-6,
                                 NSStrokeColorAttributeName:[UIColor colorWithRed:0.111 green:0.568 blue:0.764 alpha:1.000]};
    [[EMStringStylingConfiguration sharedInstance] addNewStylingClass:aStylingClass];
    
    self.topLabel.attributedText = @"<stroke>EMSString's magic</stroke>".attributedString;
    
    self.textView.attributedText = self.text.attributedString;
    
}


- (IBAction)switchButtonPressed:(UIButton *)sender {
    if (!sender.selected) {
        self.textView.text = self.text;
        self.textView.font = [UIFont systemFontOfSize:16];
    } else {
        self.textView.attributedText = self.text.attributedString;
    }
    sender.selected = !sender.selected;
}

@end
