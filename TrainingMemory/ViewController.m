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


// カードレイヤー(※自作関数)
- (CALayer *)makeCardLayerAtPos: (CGPoint)pos name:(NSString *)name
{
  CATransform3D perspective = CATransform3DIdentity;
  perspective.m34 = -1 / 150.0;
  
  CALayer *cardLayer = [CALayer layer];
  cardLayer.bounds = CGRectMake(0, 0, 100, 100);
  cardLayer.position = pos;
  cardLayer.sublayerTransform = perspective;
  cardLayer.name = name;
  
  CALayer *topLayer = [CALayer layer];
  topLayer.bounds = CGRectMake(0, 0, 100, 100);
  topLayer.position = CGPointMake(50, 50);
  topLayer.contents = (id)[UIImage imageNamed:@"card_top.png"].CGImage;
  topLayer.zPosition = 1;
  
  CALayer *backLayer = [CALayer layer];
  backLayer.bounds = CGRectMake(0, 0, 100, 100);
  backLayer.position = CGPointMake(50, 50);
  backLayer.contents = (id)[UIImage imageNamed:[name stringByAppendingPathExtension:@"png"]].CGImage;
  backLayer.zPosition = 0;
  backLayer.transform = CATransform3DMakeRotation(M_PI, 0.0, 1.0, 0.0);
  
  [cardLayer addSublayer:topLayer];
  [cardLayer addSublayer:backLayer];
 
  return cardLayer;
}


// 画面が表示される直前に呼び出されるメソッド
- (void)viewWillAppear:(BOOL)animated
{
  self.view.layer.contents = (id)[UIImage imageNamed:@"bg01.png"].CGImage; // 背景
  
  CALayer *layer1 = [self makeCardLayerAtPos:CGPointMake(100, 100) name:@"card1"];
  CALayer *layer2 = [self makeCardLayerAtPos:CGPointMake(200, 200) name:@"card1"];
  
  [self.view.layer addSublayer:layer1];
  [self.view.layer addSublayer:layer2];
  
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
