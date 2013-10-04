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


// カードの回転のための関数(※自作)
- (void)flipLayer:(CALayer *)layer
{
  [CATransaction begin];
  [CATransaction setAnimationDuration:1.0];
  CATransform3D transform = CATransform3DIdentity;
  transform.m34 = -1 / 150.0;
  if ([layer.name hasSuffix:@"flipped"]) {
    transform = CATransform3DRotate(transform, 0.0, 0.0, 1.0, 0.0);
    layer.name = [layer.name stringByDeletingPathExtension];
  }else{
    transform = CATransform3DRotate(transform, -M_PI, 0.0, 1.0, 0.0);
    layer.name = [layer.name stringByAppendingPathExtension:@"flipped"];
  }
  layer.sublayerTransform = transform;
  [CATransaction commit];
}

// タッチ処理のための関数(※既存)
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  UITouch *touch = [touches anyObject];
  CGPoint pos = [touch locationInView:self.view];
  
  CALayer *layer = [self.view.layer hitTest:pos];
  CALayer *containerLayer = layer.superlayer;
  if ([containerLayer.name hasPrefix:@"card"]) {
    containerLayer.zPosition = 10;
    [self flipLayer:containerLayer];
  }
}



// カードレイヤー(※自作)
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
