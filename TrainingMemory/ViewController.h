//
//  ViewController.h
//  TrainingMemory
//
//  Created by z on 2013/09/29.
//  Copyright (c) 2013 FoceSystemSolution. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController {
  CALayer *selectedLayer1;
  CALayer *selectedLayer2;
  
  
  // オーディオ再生用定義
  AVAudioPlayer *bgmPlay; // プレイ中 BGM
  AVAudioPlayer *bgmClear; // クリア時のBGM
  AVAudioPlayer *soundFlip; // カードめくり 効果音
  AVAudioPlayer *soundOK; // 正解 効果音
  AVAudioPlayer *soundNG; // NG 効果音
  
}

@end
