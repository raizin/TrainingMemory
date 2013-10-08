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
  
  //２枚選択中なら処理しない(戻さない)
  if (selectedLayer2 != nil) {
    return;
  }
  
  
  
  UITouch *touch = [touches anyObject];
  CGPoint pos = [touch locationInView:self.view];
  
  CALayer *layer = [self.view.layer hitTest:pos];
  CALayer *containerLayer = layer.superlayer;
  if ([containerLayer.name hasPrefix:@"card"]) {
    
    [soundFlip play];
    
    containerLayer.zPosition = 10;
    [self flipLayer:containerLayer];
    
    //カードの選択
    if (selectedLayer1 == nil) {
      selectedLayer1 = containerLayer;
    } else {
      selectedLayer2 = containerLayer;
      [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(judgeErase) userInfo:nil repeats:NO];
    }
    
    
  }
}

// カードの整合性判定からカードレイヤー削除へ (※自作)
- (void)judgeErase
{
  if ([selectedLayer1.name isEqualToString:selectedLayer2.name]) {
    
    [soundOK play];
    
    [CATransaction begin];
    [CATransaction setAnimationDuration:1.0];
    selectedLayer1.transform = CATransform3DMakeScale(2.0, 2.0, 1.0);
    selectedLayer2.transform = CATransform3DMakeScale(2.0, 2.0, 1.0);
    selectedLayer1.opacity = 0.0;
    selectedLayer2.opacity = 0.0;
    [CATransaction commit];
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(eraseCards) userInfo:nil repeats:NO];
  } else {
    
    [soundNG play];
    
    [self flipLayer:selectedLayer1];
    [self flipLayer:selectedLayer2];
    selectedLayer1.zPosition = 0;
    selectedLayer2.zPosition = 0;
    selectedLayer1 = nil;
    selectedLayer2 = nil;
  }
}

// カードレイヤの消去処理
-(void)eraseCards
{
  [selectedLayer1 removeFromSuperlayer]; // レイヤーを親レイヤーから削除
  [selectedLayer2 removeFromSuperlayer];
  selectedLayer1 = nil;
  selectedLayer2 = nil;
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
  
  srand((unsigned int)time(NULL)); // 乱数の初期化
  
  self.view.layer.contents = (id)[UIImage imageNamed:@"bg01.png"].CGImage; // 背景
  
  NSMutableArray *cardNames = [NSMutableArray array];
  for (int i = 0; i < 6; i++) {
    [cardNames addObject:[NSString stringWithFormat:@"card%d", i+1]];
    [cardNames addObject:[NSString stringWithFormat:@"card%d", i+1]];
  }
  
  for (int y = 0; y < 4; y++) {
    for (int x = 0; x < 3; x++) {
      int cardIndex = rand() % [cardNames count];
      NSString *cardName = [cardNames objectAtIndex:cardIndex];
      [cardNames removeObjectAtIndex:cardIndex];
      CALayer *layer = [self makeCardLayerAtPos:CGPointMake(x*100+50+10, y*100+50+70) name:cardName];
      [self.view.layer addSublayer:layer];
    }
  }
  
  
//  CALayer *layer1 = [self makeCardLayerAtPos:CGPointMake(100, 100) name:@"card1"];
//  CALayer *layer2 = [self makeCardLayerAtPos:CGPointMake(200, 200) name:@"card1"];
//  
//  [self.view.layer addSublayer:layer1];
//  [self.view.layer addSublayer:layer2];

  
  // サウンド再生 (プレイ中 BGM)
  NSURL *bgmURLPlay = [[NSBundle mainBundle] URLForResource:@"291" withExtension:@"mp3"];
  bgmPlay = [[AVAudioPlayer alloc] initWithContentsOfURL:bgmURLPlay error:NULL];
  [bgmPlay prepareToPlay];
  bgmPlay.volume = 0.4;
  bgmPlay.numberOfLoops = -1; // 再生回数 -1:ループ再生
  
  [bgmPlay play]; // 再生開始
  
  
  // サウンド再生 (クリア時のBGM)
  NSURL *bgmURLClear = [[NSBundle mainBundle] URLForResource:@"bgmClear" withExtension:@"mp3"];
  bgmClear = [[AVAudioPlayer alloc] initWithContentsOfURL:bgmURLClear error:NULL];
  [bgmClear prepareToPlay];
  bgmClear.volume = 0.5;
  
  
  // サウンド再生 (カードめくり 効果音)
  NSURL *soundURLFlip = [[NSBundle mainBundle] URLForResource:@"soundFlip" withExtension:@"mp3"];
  soundFlip = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURLFlip error:NULL];
  [soundFlip prepareToPlay];
  
  // サウンド再生 (正解 効果音)
  NSURL *soundURLOK = [[NSBundle mainBundle] URLForResource:@"soundOK" withExtension:@"mp3"];
  soundOK = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURLOK error:NULL];
  [soundOK prepareToPlay];
  
  
  // サウンド再生 (NG 効果音)
  NSURL *soundURLNG = [[NSBundle mainBundle] URLForResource:@"soundNG" withExtension:@"mp3"];
  soundNG = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURLNG error:NULL];
  [soundNG prepareToPlay];

  
}





// アプリ終了時に呼ばれる(*既存関数)
- (void)viewDidDisappear:(BOOL)animated
{
//  [bgmPlay release];
//  [bgmClear release];
//  [soundFlip release];
//  [soundOK release];
//  [soundNG release];
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
