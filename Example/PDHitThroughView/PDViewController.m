//
//  PDViewController.m
//  PDHitThroughView
//
//  Created by liang on 03/03/2021.
//  Copyright (c) 2021 liang. All rights reserved.
//

#import "PDViewController.h"
#import <PDHitThroughView.h>

@interface PDViewController ()

@property (weak, nonatomic) IBOutlet PDHitThroughView *maskView;

@end

@implementation PDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // self.maskView.enableHitThrough = NO;
}

- (IBAction)didClickTopButton:(id)sender {
    NSLog(@"Did click top button!");
}

- (IBAction)didClickBelowButton:(id)sender {
    NSLog(@"Did click below button!");
}

@end
