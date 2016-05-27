//
// ViewController.m
// DM3CheckmarkView
//
// Created by Dmitry Beloborodov on 26/05/16.
// Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import "ViewController.h"
#import "DM3CheckmarkView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet DM3CheckmarkView *checkmarkView1;
@property (weak, nonatomic) IBOutlet DM3CheckmarkView *checkmarkView2;
@property (weak, nonatomic) IBOutlet DM3CheckmarkView *checkmarkView3;
@property (weak, nonatomic) IBOutlet DM3CheckmarkView *checkmarkView4;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.checkmarkView2.animationDuration = 0.5f;
    self.checkmarkView3.animationDuration = 2.5f;
    self.checkmarkView4.animationDuration = 0.8f;

    self.checkmarkView2.circleColor = [UIColor magentaColor];
    self.checkmarkView3.circleColor = [UIColor lightGrayColor];
    self.checkmarkView4.circleColor = [UIColor orangeColor];

    self.checkmarkView4.checkmarkColor = [UIColor blackColor];
}

- (IBAction)animateButtonPressed:(UIButton *)sender {
    [self.checkmarkView1 animateCheckmark];
    [self.checkmarkView2 animateCheckmark];
    [self.checkmarkView3 animateCheckmark];
    [self.checkmarkView4 animateCheckmark];
}

@end
