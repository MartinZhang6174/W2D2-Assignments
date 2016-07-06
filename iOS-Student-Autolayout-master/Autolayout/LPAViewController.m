//
//  LPAViewController.m
//  Autolayout
//
//  Created by Steven Masuch on 2014-07-20.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPAViewController.h"

@interface LPAViewController ()

@property (nonatomic, weak) UIButton *  squareButton;
@property (nonatomic, weak) UIButton *  portraitButton;
@property (nonatomic, weak) UIButton *  landscapeButton;

@property (nonatomic, weak) UIView *                framingView;
@property (nonatomic, weak) NSLayoutConstraint *    framingViewHeight;
@property (nonatomic, weak) NSLayoutConstraint *    framingViewWidth;

@end

@implementation LPAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *squareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [squareButton setTitle:@"Square" forState:UIControlStateNormal];
    [squareButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:squareButton];
    squareButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.squareButton = squareButton;
    
    UIButton *portraitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [portraitButton setTitle:@"Portrait" forState:UIControlStateNormal];
    [portraitButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:portraitButton];
    portraitButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.portraitButton = portraitButton;
    
    UIButton *landscapeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [landscapeButton setTitle:@"Landscape" forState:UIControlStateNormal];
    [landscapeButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landscapeButton];
    landscapeButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.landscapeButton = landscapeButton;
    
    UIView *framingView = [[UIView alloc] initWithFrame:CGRectZero];
    framingView.translatesAutoresizingMaskIntoConstraints = NO;
    framingView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:framingView];
    self.framingView = framingView;
    
    NSString *buttonsHorizontalConstraints = @"|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|";
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:buttonsHorizontalConstraints
                                                                      options:NSLayoutFormatAlignAllCenterY
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(squareButton, portraitButton, landscapeButton)]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:squareButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-50.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:framingView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:framingView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:-50.0]];
    
    NSLayoutConstraint *framingViewHeight = [NSLayoutConstraint constraintWithItem:framingView
                                                                         attribute:NSLayoutAttributeHeight
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:nil
                                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                                        multiplier:1.0
                                                                          constant:500.0];
    
    NSLayoutConstraint *framingViewWidth = [NSLayoutConstraint constraintWithItem:framingView
                                                                        attribute:NSLayoutAttributeWidth
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:500.0];
    
    [framingView addConstraint:framingViewHeight];
    [framingView addConstraint:framingViewWidth];
    
    self.framingViewHeight = framingViewHeight;
    self.framingViewWidth = framingViewWidth;
    
    
    // Set up your views and constraints here
    
    // CGRectZero equivalent to CGRectMake(0, 0, 0, 0)
    
    // Setting up views
    
    UIView *purpleBoxView = [[UIView alloc]initWithFrame:CGRectZero];
    purpleBoxView.translatesAutoresizingMaskIntoConstraints = NO;
    purpleBoxView.backgroundColor = [UIColor purpleColor];
    [framingView addSubview:purpleBoxView];
    
    UIView *blueBox1 = [[UIView alloc]initWithFrame:CGRectZero];
    blueBox1.translatesAutoresizingMaskIntoConstraints = NO;
    blueBox1.backgroundColor = [UIColor blueColor];
    [framingView addSubview:blueBox1];

    UIView *blueBox2 = [[UIView alloc]initWithFrame:CGRectZero];
    blueBox2.translatesAutoresizingMaskIntoConstraints = NO;
    blueBox2.backgroundColor = [UIColor blueColor];
    [framingView addSubview:blueBox2];
    
    UIView *blueBox3 = [[UIView alloc]initWithFrame:CGRectZero];
    blueBox3.translatesAutoresizingMaskIntoConstraints = NO;
    blueBox3.backgroundColor = [UIColor blueColor];
    [framingView addSubview:blueBox3];
    
    UIView *redBox = [[UIView alloc]initWithFrame:CGRectZero];
    redBox.translatesAutoresizingMaskIntoConstraints = NO;
    redBox.backgroundColor = [UIColor redColor];
    [framingView addSubview:redBox];
    
    UIView *orangeBox1 = [[UIView alloc]initWithFrame:CGRectZero];
    orangeBox1.translatesAutoresizingMaskIntoConstraints = NO;
    orangeBox1.backgroundColor = [UIColor orangeColor];
    [redBox addSubview:orangeBox1];
    
    UIView *orangeBox2 = [[UIView alloc]initWithFrame:CGRectZero];
    orangeBox2.translatesAutoresizingMaskIntoConstraints = NO;
    orangeBox2.backgroundColor = [UIColor orangeColor];
    [redBox addSubview:orangeBox2];
    
    // Constraints for boxes(views)
    
    NSLayoutConstraint *purpleRightConstraint = [NSLayoutConstraint constraintWithItem:purpleBoxView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-20.0];
    
    NSLayoutConstraint *purpleBottomConstraint = [NSLayoutConstraint constraintWithItem:purpleBoxView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-20.0];
    
    NSLayoutConstraint *purpleWidthConstraint = [NSLayoutConstraint constraintWithItem:purpleBoxView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeWidth multiplier:305.0/500.0 constant:0.0];
    
    NSLayoutConstraint *purpleHeightConstraint = [NSLayoutConstraint constraintWithItem:purpleBoxView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:50.0];
//
    NSLayoutConstraint *blue1WidthConstraint = [NSLayoutConstraint constraintWithItem:blueBox1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:50.0];
//
    NSLayoutConstraint *blue1HeightConstraint = [NSLayoutConstraint constraintWithItem:blueBox1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:50.0];
//
    NSLayoutConstraint *blue2WidthConstraint = [NSLayoutConstraint constraintWithItem:blueBox2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:50.0];
//
    NSLayoutConstraint *blue2HeightConstraint = [NSLayoutConstraint constraintWithItem:blueBox2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:50.0];

    NSLayoutConstraint *blue3WidthConstraint = [NSLayoutConstraint constraintWithItem:blueBox3 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:50.0];

    NSLayoutConstraint *blue3HeightConstraint = [NSLayoutConstraint constraintWithItem:blueBox3 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:50.0];
    
    NSLayoutConstraint *blue1CenterXConstraint = [NSLayoutConstraint constraintWithItem:blueBox1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *blue1YConstraint = [NSLayoutConstraint constraintWithItem:blueBox1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:blueBox2 attribute:NSLayoutAttributeTop multiplier:0.5 constant:-20.0];
    
    NSLayoutConstraint *blue2CenterXConstraint = [NSLayoutConstraint constraintWithItem:blueBox2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *blue2CenterYConstraint = [NSLayoutConstraint constraintWithItem:blueBox2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *blue3CenterXConstraint = [NSLayoutConstraint constraintWithItem:blueBox3 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *blue3YConstraint = [NSLayoutConstraint constraintWithItem:blueBox3 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:blueBox2 attribute:NSLayoutAttributeBottom multiplier:1.5 constant:0.0];
    
    NSLayoutConstraint *redBoxHeight = [NSLayoutConstraint constraintWithItem:redBox attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:46.0];
    
    NSLayoutConstraint *redBoxWidth = [NSLayoutConstraint constraintWithItem:redBox attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:144.0];
    
    NSLayoutConstraint *orange1Height = [NSLayoutConstraint constraintWithItem:orangeBox1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:30.0];
    
    NSLayoutConstraint *orange2Height = [NSLayoutConstraint constraintWithItem:orangeBox2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:30.0];
    
    NSLayoutConstraint *orange1Width = [NSLayoutConstraint constraintWithItem:orangeBox1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:70.0];
    
    NSLayoutConstraint *orange2Width = [NSLayoutConstraint constraintWithItem:orangeBox2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:50.0];

    NSLayoutConstraint *orange1Top = [NSLayoutConstraint constraintWithItem:orangeBox1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:redBox attribute:NSLayoutAttributeTop multiplier:1.0 constant:8.0];
    
    NSLayoutConstraint *orange1Left = [NSLayoutConstraint constraintWithItem:orangeBox1 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:redBox attribute:NSLayoutAttributeLeft multiplier:1.0 constant:8.0];
    
//    NSLayoutConstraint *orange1Bottom = [NSLayoutConstraint constraintWithItem:orangeBox1 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:redBox attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-8.0];
    
//    NSLayoutConstraint *orange2Top = [NSLayoutConstraint constraintWithItem:orangeBox2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:redBox attribute:NSLayoutAttributeTop multiplier:1.0 constant:8.0];

    NSLayoutConstraint *orange2Right = [NSLayoutConstraint constraintWithItem:orangeBox2 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:redBox attribute:NSLayoutAttributeRight multiplier:1.0 constant:-8.0];

    NSLayoutConstraint *orange2Bottom = [NSLayoutConstraint constraintWithItem:orangeBox2 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:redBox attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-8.0];
    
//    NSLayoutConstraint *orange2LeftToOrange1 = [NSLayoutConstraint constraintWithItem:orangeBox2 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:orangeBox1 attribute:NSLayoutAttributeLeft multiplier:1.0 constant:8.0];
    
    NSLayoutConstraint *redBoxTopConstraint = [NSLayoutConstraint constraintWithItem:redBox attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeTop multiplier:1.0 constant:20.0];
    
    NSLayoutConstraint *redBoxRightConstraint = [NSLayoutConstraint constraintWithItem:redBox attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-20.0];
    
    [self.view addConstraints:@[purpleRightConstraint, purpleBottomConstraint, purpleHeightConstraint, purpleWidthConstraint, blue1WidthConstraint, blue2WidthConstraint, blue3WidthConstraint,blue1HeightConstraint, blue2HeightConstraint, blue3HeightConstraint, blue1CenterXConstraint, blue2CenterXConstraint, blue3CenterXConstraint, blue2CenterYConstraint, redBoxTopConstraint, redBoxRightConstraint, orange1Width, orange1Height, orange2Width, orange2Height, orange1Top, orange1Left, orange2Right, orange2Bottom, redBoxWidth, redBoxHeight]];
    [framingView addConstraints:@[blue1YConstraint, blue3YConstraint]];
    
}

- (void)resizeFramingView:(id)sender
{
    CGFloat newWidth = 0.0;
    CGFloat newHeight = 0.0;
    
    if (sender == self.squareButton) {
        newWidth = 500.0;
        newHeight = 500.0;
    } else if (sender == self.portraitButton) {
        newWidth = 350.0;
        newHeight = 550.0;
    } else if (sender == self.landscapeButton) {
        newWidth = 900.0;
        newHeight = 300.0;
    }
    
    [UIView animateWithDuration:2.0 animations:^(){
        self.framingViewHeight.constant = newHeight;
        self.framingViewWidth.constant = newWidth;
        [self.view layoutIfNeeded];
    }];
}

@end
