//
//  ViewController.m
//  AVPlayerMovie
//
//  Created by 吴亚乾 on 16/1/20.
//  Copyright © 2016年 吴亚乾. All rights reserved.
//

#import "ViewController.h"
#import "PlayView.h"
#import "PlayControll.h"

@interface ViewController ()

@property (nonatomic,strong) PlayView *myPlayView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myPlayView = [[PlayView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 400)];
    [self.myPlayView setAudioWithName:@"abc"];
    [self.view addSubview:self.myPlayView];
    
    self.myPlayView.backgroundColor = [UIColor yellowColor];
    
    // 播放按钮点击
    [self.myPlayView.controll.PlayAndStopButton addTarget:self action:@selector(PlayAndStopButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    // 音量的控制
    self.myPlayView.player.volume = 0.5;
    [self.myPlayView.controll.volumeSlide addTarget:self action:@selector(volumeSlideChanged:) forControlEvents:UIControlEventValueChanged];
    // 进度控制
    [self.myPlayView.controll.ProgressSlide addTarget:self action:@selector(ProgressSlideChanged:) forControlEvents:UIControlEventValueChanged];
}

#pragma mark ----- 视频的播放和暂停
-(void)PlayAndStopButtonAction:(UIButton *)sender
{
    if (!sender.isSelected) {
        [sender setTitle:@"暂停" forState:UIControlStateNormal];
        [self.myPlayView.player play];
    }else{
        [sender setTitle:@"播放" forState:UIControlStateNormal];
        [self.myPlayView.player pause];
    }
    sender.selected = !sender.selected;
}

#pragma mark ----- 音量的进度
-(void)volumeSlideChanged:(UISlider *)sender
{
    self.myPlayView.player.volume = sender.value;
}

#pragma mark ----- 进度的控制
-(void)ProgressSlideChanged:(UISlider *)sender
{
    // 获取视频播放资源的总时间 (* 1.0f 把计算结果变成浮点数)
    CGFloat seconds = self.myPlayView.player.currentItem.duration.value * 1.0f/self.myPlayView.player.currentItem.duration.timescale;
    // 计算滑动滑竿以后应该播放的时间
    seconds = seconds * sender.value;
    
    // 设置播放器播放的具体位置(跳到某个时间播放)
    [self.myPlayView.player pause];
    [self.myPlayView.player seekToTime:CMTimeMakeWithSeconds(seconds, self.myPlayView.player.currentTime.timescale) completionHandler:^(BOOL finished) {
        // 继续播放
        [self.myPlayView.player play];
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
