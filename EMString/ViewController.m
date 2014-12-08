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
    
//    [EMStringStylingConfiguration sharedInstance].defaultFont = [UIFont systemFontOfSize:20];
//    [EMStringStylingConfiguration sharedInstance].h1Color = [UIColor redColor];


    EMStylingClass *aStylingClass = [[EMStylingClass alloc] initWithMarkup:@"<blue>"];
    [aStylingClass setColor:[UIColor blueColor]];
    [[EMStringStylingConfiguration sharedInstance] addNewStylingClass:aStylingClass];
    
    aStylingClass = [[EMStylingClass alloc] initWithMarkup:@"<purple>"];
    [aStylingClass setColor:[UIColor purpleColor]];
    [[EMStringStylingConfiguration sharedInstance] addNewStylingClass:aStylingClass];
    
    aStylingClass = [[EMStylingClass alloc] initWithMarkup:@"<orange>"];
    [aStylingClass setColor:[UIColor orangeColor]];
    [[EMStringStylingConfiguration sharedInstance] addNewStylingClass:aStylingClass];

    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    label.numberOfLines = 0;
    label.attributedText = @"<purple><h1>EMString</h1><p>EMString stands for <em><strong>E</strong>asy <strong>M</strong>arkup <strong>S</strong>tring</em></p>\n<p>It's <u>beautiful</u> and <u>simple</u> way to use attributed string in iOS.</p><p>You know how painful it can be to change fonts, styles or colors in a label or any object using a string. Well this is over! EMString behave like you would expect in an HTML page:</p><h1>h1</h1><h2>h2</h2><h3>h3</h3><h4>h4</h4><h5>h5</h5><h6>h6</h6><p><blue>blue text</blue> <purple>purple text</purple> <orange>orange text</orange></p></purple>".attributedString;
    [self.view addSubview:label];
    
    
//    [EMStringStylingConfiguration sharedInstance].strongFont = [UIFont boldSystemFontOfSize:90];
//    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame) / 2, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) / 2)];
//    label2.numberOfLines = 0;
//    label2.attributedText = @"<p>Je suis une <strong>EMString</strong></p> <p>That can make <u>every</u> string easily <em>styled</em>.</p>".attributedString;
//    [self.view addSubview:label2];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
