//
//  PlayView.m
//  AVPlayerMovie
//
//  Created by 吴亚乾 on 16/1/20.
//  Copyright © 2016年 吴亚乾. All rights reserved.
//

#import "PlayView.h"
#import <Masonry.h>
#import "PlayControll.h"

@implementation PlayView

#pragma mark ----- 给播放器设置URL 以及播放的方法
-(void)setAudioWithName:(NSString *)name
{
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:path];
    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:url];
    self.player = [AVPlayer playerWithPlayerItem:item];
    
    // 如果要播放视频，AVPlayer 需要加载到 AVPlayerLayer 上面
    AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    
    // 设置播放界面大小
    CGRect frameCGRect = self.bounds;
    frameCGRect.size.height = self.bounds.size.height - 50;
    layer.frame = frameCGRect;
    
    // 设置AVPlayerLayer的适应方式（）
    layer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    
    // 把AVPlayerLayer 加载到view的layer上
    [self.layer addSublayer:layer];
    
    if (_controll == nil) {
        self.controll = [[NSBundle mainBundle] loadNibNamed:@"PlayControll" owner:self options:nil].firstObject;
        // 代码添加约束 谁去调用这个方法 make 就是给谁加约束 equalTo(对象) mas_equalTo(具体数值)
        // Masonry 设置约束前提(尤其是子视图需要依赖父视图的时候)，必须在设置约束之前，加到父视图上；
        [self addSubview:self.controll];
        [self.controll mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.bottom.equalTo(self.mas_bottom);
            make.height.mas_equalTo(50);
        }];
    }
}

@end
