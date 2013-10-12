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
  self.view.layer.contents = (id)[UIImage imageNamed:@"bgStart.png"].CGImage;
  
  UIButton *easyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
  UIButton *normBtn = [UIButton buttonWithType:UIButtonTypeCustom];
  UIButton *hardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
  
  // button width
  int btnW = 100;

//startBtn.frame = CGRectMake(64, 340, 191, 52);// x y w h
  easyBtn.frame = CGRectMake([self arignCenter:btnW], 270, btnW, 26);// x y w h
  [easyBtn setImage:[UIImage imageNamed:@"startBtn.png"] forState:UIControlStateNormal];
  [easyBtn addTarget:self action:@selector(showPlayView) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:easyBtn];

  normBtn.frame = CGRectMake([self arignCenter:btnW], 300, btnW, 26);// x y w h
  [normBtn setImage:[UIImage imageNamed:@"startBtn.png"] forState:UIControlStateNormal];
  [normBtn addTarget:self action:@selector(showPlayView) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:normBtn];
  
  hardBtn.frame = CGRectMake([self arignCenter:btnW], 330, btnW, 26);// x y w h
  [hardBtn setImage:[UIImage imageNamed:@"startBtn.png"] forState:UIControlStateNormal];
  [hardBtn addTarget:self action:@selector(showPlayView) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:hardBtn];
  
}

- (void)showPlayView
{
  ViewController *playCtl = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
  playCtl.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
  //  [self presentModalViewController:playController animated:YES];
  [self presentViewController:playCtl animated:YES completion:nil];
  //  [playCtl release];
}



// 中央寄せ用 X座標算出
- (int)arignCenter:(int)btnW
{
  //画面情報(横幅)取得
  UIScreen *sc = [UIScreen mainScreen];
  CGRect rect = sc.bounds;
  
//  NSLog(@"%f",rect.size.width);
  
  return ( rect.size.width - btnW ) / 2;
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
