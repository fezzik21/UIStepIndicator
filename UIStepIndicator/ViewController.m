//
//  ViewController.m
//  UIStepIndicator
//
//  Created by Adam Hunter on 11/13/14.
//  Copyright (c) 2014 Adam Hunter. All rights reserved.
//

#import "ViewController.h"
#import "UIStepIndicator.h"

@interface ViewController ()

@property (nonatomic, strong) UIStepIndicator *stepIndicator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _stepIndicator = [UIStepIndicator stepIndicatorWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 40, 80)
                                                    andCount:14
                              andCurrentHighestStepCompleted:9
                                                andStepWidth:32
                                          andSeperationWidth:5
                                           andCompletedImage:[UIImage imageNamed:@"completed_circle.png"]
                                              andUpNextImage:[UIImage imageNamed:@"up_next_circle.png"]
                                              andFutureImage:[UIImage imageNamed:@"not_completed_circle.png"]
                                                     andFont:[UIFont fontWithName:@"Avenir-Book" size:14.f]
                                                andTextColor:[UIColor darkGrayColor]
                                              allowScrolling:YES];
    _stepIndicator.center = self.view.center;
    [self.view addSubview:_stepIndicator];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
