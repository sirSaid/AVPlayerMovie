//
//  PlayView.h
//  AVPlayerMovie
//
//  Created by 吴亚乾 on 16/1/20.
//  Copyright © 2016年 吴亚乾. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@class PlayControll;
@interface PlayView : UIView

// 播放视频的player
@property (nonatomic,strong) AVPlayer *player;
// 控制条
@property (nonatomic,strong) PlayControll *controll;
#pragma mark ----- 给播放器设置URL 以及播放的方法
-(void)setAudioWithName:(NSString *)name;


@end
