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
  
  
  /*** タイトル文字列の表示 ここから ***/
  UILabel *title1 =  [[UILabel alloc] initWithFrame:CGRectMake(30,100,100,30)]; // x y w h
//  title1.textColor = [UIColor colorWithRed:0.0 green:0.5 blue:1.0 alpha:1.0]; // 薄い青
//  title1.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:24.0f];
//  title1.textAlignment = NSTextAlignmentCenter;
//  title1.text = @"Simple";
  
  NSDictionary *stringAttributes1 = @{ NSForegroundColorAttributeName : [UIColor colorWithRed:0.0 green:0.5 blue:1.0 alpha:1.0],// 薄い青
                                     //NSFontAttributeName : [UIFont systemFontOfSize:24.0f],
                                       NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:24.0f],
                                       NSStrokeColorAttributeName : [UIColor whiteColor],
                                       NSStrokeWidthAttributeName : @-4.0f };
  NSAttributedString *string1 = [[NSAttributedString alloc] initWithString:@"Simple"
                                                                attributes:stringAttributes1];
  
  
//  NSDictionary *stringAttributes2 = @{ NSForegroundColorAttributeName : [UIColor redColor],
//                                       NSFontAttributeName : [UIFont boldSystemFontOfSize:24.0f] };
//  NSAttributedString *string2 = [[NSAttributedString alloc] initWithString:@"能力向上トレーニング"
//                                                                attributes:stringAttributes2];
  
//  NSDictionary *stringAttributes3 = @{ NSForegroundColorAttributeName : [UIColor greenColor],
//                                       NSFontAttributeName : [UIFont systemFontOfSize:14.0f] };
//  NSAttributedString *string3 = [[NSAttributedString alloc] initWithString:@"789"
//                                                                attributes:stringAttributes3];
  
  NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] init];
  [mutableAttributedString appendAttributedString:string1];
//  [mutableAttributedString appendAttributedString:string2];
//  [mutableAttributedString appendAttributedString:string3];
  
  title1.attributedText = mutableAttributedString;
  
  [self.view addSubview:title1];
  
  
  
  
  
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
- (int)arignCenter:(int)btnW
{
  //画面情報(横幅)取得
  UIScreen *sc = [UIScreen mainScreen];
  CGRect rect = sc.bounds;
  
//  NSLog(@"%f",rect.size.width);
  
  return ( rect.size.width - btnW ) / 2;
}

// ラベル文字列に縁取りする
- (void)drawTextInRect:(id)fromLabel
{
  UILabel *label = fromLabel;
  UIColor *OutlineColor = [[UIColor alloc]init];
  CGFloat OutlineWidth = 0;
  
  CGSize shadowOffset = label.shadowOffset;
  UIColor *txtColor = label.textColor;
  
  CGContextRef contextRef = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(contextRef, OutlineWidth);
  CGContextSetLineJoin(contextRef, kCGLineJoinRound);
  
  CGContextSetTextDrawingMode(contextRef, kCGTextStroke);
  label.textColor = OutlineColor;
//  drawTextInRect:CGRectInset([UIColor whiteColor], OutlineWidth, OutlineWidth)];
  
  CGContextSetTextDrawingMode(contextRef, kCGTextFill);
  label.textColor = txtColor;
//  [super drawTextInRect:CGRectInset(rect, OutlineWidth, OutlineWidth)];
  
  label.shadowOffset = shadowOffset;
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
