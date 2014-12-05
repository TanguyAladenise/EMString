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
    
    [EMStringStylingConfiguration sharedInstance].defaultColor = [UIColor grayColor];
    [EMStringStylingConfiguration sharedInstance].h1Color = [UIColor purpleColor];

//    [EMStringStylingConfiguration sharedInstance].strongFont = [UIFont boldSystemFontOfSize:20];
    EMStylingClass *aStylingClass = [[EMStylingClass alloc] init];
    aStylingClass.markup = @"<strong>";
    aStylingClass.attributes = @{ NSFontAttributeName : [UIFont systemFontOfSize:20], NSForegroundColorAttributeName : [UIColor redColor] };
    [[EMStringStylingConfiguration sharedInstance] addNewStylingClass:aStylingClass];
    
    aStylingClass = [[EMStylingClass alloc] init];
    aStylingClass.markup = @"<custom2>";
    aStylingClass.attributes = @{ NSFontAttributeName : [UIFont systemFontOfSize:20], NSForegroundColorAttributeName : [UIColor yellowColor] };
    [[EMStringStylingConfiguration sharedInstance] addNewStylingClass:aStylingClass];

    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) / 2)];
    label.numberOfLines = 0;
    label.attributedText = @"<p>Je suis une <h1><u>EMString</u></h1></p> <p>That can <custom>make</custom> <u>every</u> string <custom2>make</custom2> easily <em>styled</em>.</p>".attributedString;
    [self.view addSubview:label];
    
//    [EMStringStylingConfiguration sharedInstance].strongFont = [UIFont boldSystemFontOfSize:90];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame) / 2, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) / 2)];
    label2.numberOfLines = 0;
    label2.attributedText = @"<p>Je suis une <strong>EMString</strong></p> <p>That can make <u>every</u> string easily <em>styled</em>.</p>".attributedString;
    [self.view addSubview:label2];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
