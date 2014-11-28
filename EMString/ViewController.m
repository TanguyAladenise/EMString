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
    
    [EMStringStylingConfiguration sharedInstance].strongFont = [UIFont boldSystemFontOfSize:20];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(40, 40, 300, 200)];
    label.numberOfLines = 0;
    label.attributedText = @"<p>je suis une <strong>EMString</strong></p>retour a <strong>la</strong> <em>ligne</em>".attributedString;
    [self.view addSubview:label];
    
    
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(40, 150, 300, 200)];
    label2.numberOfLines = 0;
    label2.attributedText = @"<p>je suis une <strong>EMString</strong></p>retour a <strong>la</strong> <em>ligne</em>".attributedString;
    [self.view addSubview:label2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
