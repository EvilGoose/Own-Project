//
//  EGOrderOptionsTableViewCell.m
//  EGProject
//
//  Created by Fangweiyi on 26/07/2017.
//  Copyright © 2017 EGMade. All rights reserved.
//

#import "EGOrderOptionsTableViewCell.h"
#import "EGCustomButton.h"

@interface EGOrderOptionsTableViewCell ()

/**images*/
@property (strong, nonatomic)NSArray<NSString *> *images;

@end

@implementation EGOrderOptionsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initOptionButtons];
    }
    return self;
}


- (void)initOptionButtons {
    CGFloat width = SCREEN_WIDTH / self.images.count;
    [self.images enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        EGCustomButton *button = [EGCustomButton buttonWithType:UIButtonTypeCustom];
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [button setTitle:obj forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"homepage_home_platform_16x16_"] forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, - button.imageView.width, - button.imageView.height - 30, 0);
        button.imageEdgeInsets = UIEdgeInsetsMake(-button.titleLabel.height - 20, 40, 0, - button.titleLabel.width);
        button.tag = idx;
        button.frame = CGRectMake(width * idx, 0, width, self.height);
        [button addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:button];
    }];
}

- (void)buttonClickAction:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(orderOptionsTableViewCell:didSelected:)]) {
        [self.delegate orderOptionsTableViewCell:self didSelected:sender.tag];
    }

    self.selected = YES;
}


- (NSArray *)images {
    if (!_images) {
        _images  = @[@"name1", @"name2", @"name3", @"name4", @"name5"];
    }
    return _images;
}

@end
