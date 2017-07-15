//
//  EGCustomButton.m
//  EGProject
//
//  Created by EG on 2017/7/14.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGCustomButton.h"
#import <Masonry.h>

@interface EGCustomButton()

/**图片*/
@property (strong, nonatomic)UIImageView *customImageView;

/**标题*/
@property (strong, nonatomic)UILabel *mainTitleLable;

/**副标题*/
@property (strong, nonatomic)UILabel *subTitleLable;

@end

@implementation EGCustomButton

+ (EGCustomButton *)customButtonWithTitle:(NSString *)title subTitle:(NSString *)subTitle imageName:(NSString *)imageName {
    EGCustomButton *button = [EGCustomButton buttonWithType:UIButtonTypeCustom];
    button.mainTitle = title;
    button.subTitle = subTitle;
    button.imageName = imageName;
    [button setNeedsLayout];
    return button;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.imageName) {
        [self.customImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.centerX.equalTo(self);
        }];
    }
    
    if (self.mainTitle) {
        [self.mainTitleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.customImageView.mas_bottom);
            make.centerX.equalTo(self);
            make.height.equalTo(@12);
            make.bottom.equalTo(self);
        }];
    }
    
    if (self.subTitle) {
        [self.subTitleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mainTitleLable.mas_bottom);
            make.centerX.equalTo(self);
        }];
    }
}

#pragma mark - setter

- (void)setSubTitle:(NSString *)subTitle {
    _subTitle = subTitle;
    self.subTitleLable.text = subTitle;
    [self.subTitleLable sizeToFit];
    [self addSubview:self.subTitleLable];
    [self setNeedsLayout];
}

- (void)setMainTitle:(NSString *)mainTitle {
    mainTitle = _mainTitle;
    self.mainTitleLable.text = mainTitle;
    [self.mainTitleLable sizeToFit];
    [self addSubview:self.mainTitleLable];
    [self setNeedsLayout];
}

- (void)setImageName:(NSString *)imageName {
    _imageName = imageName;
    self.customImageView.image = [UIImage imageNamed:imageName];
    [self.customImageView sizeToFit];
    [self addSubview:self.customImageView];
    [self setNeedsLayout];
}

#pragma mark - lazy

- (UIImageView *)customImageView {
    if (!_customImageView) {
        _customImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    }
    return _customImageView;
}

- (UILabel *)mainTitleLable {
    if (!_mainTitleLable) {
        _mainTitleLable = [[UILabel alloc] initWithFrame:CGRectZero];
        _mainTitleLable.textAlignment = NSTextAlignmentCenter;
    }
    return _mainTitleLable;
}

- (UILabel *)subTitleLable {
    if (!_subTitleLable) {
        _subTitleLable = [[UILabel alloc] initWithFrame:CGRectZero];
        _subTitleLable.textAlignment = NSTextAlignmentCenter;
    }
    return _subTitleLable;
}

@end
