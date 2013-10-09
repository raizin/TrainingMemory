//
//  TitleViewController.m
//  TrainingMemory
//
//  Created by z on 2013/10/09.
//  Copyright (c) 2013 FoceSystemSolution. All rights reserved.
//

#import "TitleViewController.h"
#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface TitleViewController ()

@end

@implementation TitleViewController


- (void)viewWillAppear:(BOOL)animated
{
  self.view.layer.contents = (id)[UIImage imageNamed:@"start_bg_img.png"].CGImage;
  
  UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
  startBtn.frame = CGRectMake(64, 340, 191, 52);
  [startBtn setImage:[UIImage imageNamed:@"startBtn.png"] forState:UIControlStateNormal];
  [startBtn addTarget:self action:@selector(showPlayView) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:startBtn];
}

- (void)showPlayView
{
  ViewController *playCtl = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
  playCtl.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
  //  [self presentModalViewController:playController animated:YES];
  [self presentViewController:playCtl animated:YES completion:nil];
//  [playCtl release];
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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
