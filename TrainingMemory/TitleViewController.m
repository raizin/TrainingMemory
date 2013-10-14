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
  self.view.layer.contents = (id)[UIImage imageNamed:@"bg01.png"].CGImage;
  
  
  /*** タイトル文字列の表示 ここから ***/

  //画面情報(横幅)取得
  UIScreen *sc = [UIScreen mainScreen];
  CGRect rect = sc.bounds;
  int fullw = rect.size.width;


  // 影の定義
  NSShadow *shadow2 = [[NSShadow alloc] init];
  shadow2.shadowColor = [UIColor grayColor];
  shadow2.shadowBlurRadius = 0.0f;
  shadow2.shadowOffset = CGSizeMake(1.5f, 3.0f); // x y
  
  NSShadow *shadow3 = [[NSShadow alloc] init];
  shadow3.shadowColor = [UIColor grayColor];
  shadow3.shadowBlurRadius = 0.0f;
  shadow3.shadowOffset = CGSizeMake(1.0f, 2.0f); // x y
  
  
  //Title1(Simple)
//  UILabel *title1 =  [[UILabel alloc] initWithFrame:CGRectMake(30,100,100,30)]; // x y w h
//  NSDictionary *stringAttributes1 = @{ NSForegroundColorAttributeName : [UIColor colorWithRed:0.0 green:0.5 blue:1.0 alpha:1.0],// 薄い青
//                                       //NSFontAttributeName : [UIFont systemFontOfSize:24.0f],
//                                       NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:18.0f],
//                                       NSStrokeColorAttributeName : [UIColor whiteColor],
//                                       NSStrokeWidthAttributeName : @-4.0f };
//  NSAttributedString *string1 = [[NSAttributedString alloc] initWithString:@"Simple" attributes:stringAttributes1];
//  NSMutableAttributedString *mutableAttributedString1 = [[NSMutableAttributedString alloc] init];
//  [mutableAttributedString1 appendAttributedString:string1];
//  title1.attributedText = mutableAttributedString1;
//  [self.view addSubview:title1];
  
  
  //Title2
  UILabel *title2 =  [[UILabel alloc] initWithFrame:CGRectMake(0,150,fullw,30)]; // x y w h
  NSDictionary *stringAttributes2 = @{ NSForegroundColorAttributeName : [UIColor colorWithRed:0.6 green:0.3 blue:1.0 alpha:1.0],// 紫
                                       NSFontAttributeName : [UIFont fontWithName:@"Helvetica-Bold" size:24.0f],
                                       NSStrokeColorAttributeName : [UIColor whiteColor],
                                       NSStrokeWidthAttributeName : @-4.0f,
                                       NSKernAttributeName : @0.0f,
                                       NSShadowAttributeName : shadow2 // 影
                                       };
  NSAttributedString *string2 = [[NSAttributedString alloc] initWithString:@"能力向上トレーニング" attributes:stringAttributes2];
  NSMutableAttributedString *mutableAttributedString2 = [[NSMutableAttributedString alloc] init];
  [mutableAttributedString2 appendAttributedString:string2];
  title2.textAlignment = NSTextAlignmentCenter;
  title2.attributedText = mutableAttributedString2;
  [self.view addSubview:title2];
  
  
  //Title3
  UILabel *title3 =  [[UILabel alloc] initWithFrame:CGRectMake(0,200,fullw,30)]; // x y w h
  NSDictionary *stringAttributes3 = @{ NSForegroundColorAttributeName : [UIColor orangeColor],//
                                       NSFontAttributeName : [UIFont fontWithName:@"Helvetica-Bold" size:20.0f],
                                       NSStrokeColorAttributeName : [UIColor blackColor],
                                       NSStrokeWidthAttributeName : @-2.0f,
                                       NSKernAttributeName : @-0.5f,
                                       NSShadowAttributeName : shadow3 // 影
                                       };
//NSAttributedString *string3 = [[NSAttributedString alloc] initWithString:@"第一弾 記憶力訓練" attributes:stringAttributes3];
  NSAttributedString *string3 = [[NSAttributedString alloc] initWithString:@"Part I 画像記憶訓練" attributes:stringAttributes3];
  NSMutableAttributedString *mutableAttributedString3 = [[NSMutableAttributedString alloc] init];
  [mutableAttributedString3 appendAttributedString:string3];
  title3.textAlignment = NSTextAlignmentCenter;
  title3.attributedText = mutableAttributedString3;
//title3.backgroundColor = [UIColor brownColor]; // label background
  [self.view addSubview:title3];
  
  
  /*** タイトル文字列の表示 ここまで ***/
  
  
  
  /*** ボタンの表示 ここから ***/
  UIButton *easyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
  UIButton *normBtn = [UIButton buttonWithType:UIButtonTypeCustom];
  UIButton *hardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
  
  // button width
  int btnW = 100;

//startBtn.frame = CGRectMake(64, 340, 191, 52);// x y w h
  easyBtn.frame = CGRectMake([self arignCenter:btnW], 270, btnW, 26);// x y w h
  [easyBtn setImage:[UIImage imageNamed:@"startBtn.png"] forState:UIControlStateNormal];
  [easyBtn addTarget:self action:@selector(showPlayView:) forControlEvents:UIControlEventTouchUpInside];
  easyBtn.tag = 1;
  [self.view addSubview:easyBtn];

  normBtn.frame = CGRectMake([self arignCenter:btnW], 300, btnW, 26);// x y w h
  [normBtn setImage:[UIImage imageNamed:@"startBtn.png"] forState:UIControlStateNormal];
  [normBtn addTarget:self action:@selector(showPlayView:) forControlEvents:UIControlEventTouchUpInside];
  normBtn.tag = 2;
  [self.view addSubview:normBtn];
  
  hardBtn.frame = CGRectMake([self arignCenter:btnW], 330, btnW, 26);// x y w h
  hardBtn.tag = 3;
  [hardBtn setImage:[UIImage imageNamed:@"startBtn.png"] forState:UIControlStateNormal];
  [hardBtn addTarget:self action:@selector(showPlayView:) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:hardBtn];
  
}

- (void)showPlayView:(id)sender
{
  ViewController *playCtl = [[ViewController alloc]init];
  
  //sender経由でボタン情報を取得
  UIButton *btn = (UIButton *)sender;
  
  NSLog(@"%d", btn.tag);
    
  // 次のビューにボタン情報を送信
  [playCtl setBtnType:[NSString stringWithFormat:@"%d",btn.tag]];
  
  playCtl.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
  //  [self presentModalViewController:playController animated:YES];
  [self presentViewController:playCtl animated:YES completion:nil];
  //  [playCtl release];
}



// 中央寄せ用 X座標算出
- (int)arignCenter:(int)w
{
  //画面情報(横幅)取得
  UIScreen *sc = [UIScreen mainScreen];
  CGRect rect = sc.bounds;
  
//  NSLog(@"%f",rect.size.width);
  
  return ( rect.size.width - w ) / 2;
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
