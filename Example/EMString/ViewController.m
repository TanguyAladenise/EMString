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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [EMStringStylingConfiguration sharedInstance].defaultColor = [UIColor yellowColor];
//    [EMStringStylingConfiguration sharedInstance].h1Color = [UIColor redColor];


    EMStylingClass *aStylingClass = [[EMStylingClass alloc] initWithMarkup:@"<blue>"];
    [aStylingClass setColor:[UIColor blueColor]];
    [[EMStringStylingConfiguration sharedInstance] addNewStylingClass:aStylingClass];
    
   
    
    aStylingClass = [[EMStylingClass alloc] initWithMarkup:@"<orange>"];
    aStylingClass.attributes = @{};
    [aStylingClass setColor:[UIColor orangeColor]];
    [[EMStringStylingConfiguration sharedInstance] addNewStylingClass:aStylingClass];
    aStylingClass = [[EMStylingClass alloc] initWithMarkup:@"<purple>"];
    [aStylingClass setColor:[UIColor purpleColor]];
    [[EMStringStylingConfiguration sharedInstance] addNewStylingClass:aStylingClass];
    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, CGRectGetWidth(self.view.frame) - 20, CGRectGetHeight(self.view.frame))];
//    label.numberOfLines = 0;
//    label.attributedText = @"<h1>EMString</h1>\n<p>EMString stands for <em><strong>E</strong>asy <strong>M</strong>arkup <strong>S</strong>tring</em></p>\n<p>Apple's NSAttributedString API nightmare is over.</p><p>Create your string, use markup to apply different styles and user @\"My String\".attributedString <u>magic</u> to see your text come to life.</p><p>EMString behave like you would expect in an HTML page:</p><h1>h1</h1><h2>h2</h2><h3>h3</h3><h4>h4</h4><h5>h5</h5><h6>h6</h6><p><blue>blue text</blue> <purple>purple text</purple> <orange>orange text</orange></p>".attributedString;
//    [self.view addSubview:label];
    
    
    NSString *myString = @"This text is bold but then italic.";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:myString];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:16] range:[myString rangeOfString:@"This text is bold"]];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont italicSystemFontOfSize:16] range:[myString rangeOfString:@"italic."]];

    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame) / 2, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) / 2)];
    label2.numberOfLines = 0;
    label2.attributedText = @"<strong>This text <u>is</u> bold</strong> but then <em>italic.</em>".attributedString;
    [self.view addSubview:label2];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
