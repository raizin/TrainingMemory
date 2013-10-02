//
//  ViewController.m
//  TrainingMemory
//
//  Created by z on 2013/09/29.
//  Copyright (c) 2013 FoceSystemSolution. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
  self.view.layer.contents = (id)[UIImage imageNamed:@"bg01.png"].CGImage;

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
