//
//  ResultViewController.m
//  TrainingMemory
//
//  Created by z on 2013/10/12.
//  Copyright (c) 2013 FoceSystemSolution. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()

@end

@implementation ResultViewController


- (void)viewWillAppear:(BOOL)animated
{
  self.view.layer.contents = (id)[UIImage imageNamed:@"bg01.png"].CGImage;
  
//  UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//  startBtn.frame = CGRectMake(64, 340, 191, 52);
//  [startBtn setImage:[UIImage imageNamed:@"startBtn.png"] forState:UIControlStateNormal];
//  [startBtn addTarget:self action:@selector(showPlayView) forControlEvents:UIControlEventTouchUpInside];
//  [self.view addSubview:startBtn];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
