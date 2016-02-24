//
//  PlayControll.h
//  AVPlayerMovie
//
//  Created by 吴亚乾 on 16/1/20.
//  Copyright © 2016年 吴亚乾. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayControll : UIView
@property (weak, nonatomic) IBOutlet UIButton *PlayAndStopButton;

@property (weak, nonatomic) IBOutlet UISlider *ProgressSlide;
@property (weak, nonatomic) IBOutlet UISlider *volumeSlide;

@end
