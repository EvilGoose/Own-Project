//
//  EGUserInfoCatalogueCell.m
//  EGProject
//
//  Created by EG on 2017/7/13.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGUserInfoCatalogueCell.h"

@interface EGUserInfoCatalogueCell()

/**头像*/
@property (strong, nonatomic)UIImageView *userIcon;

/**名称*/
@property (strong, nonatomic)UILabel *nameLabel;

/**等级*/
@property (strong, nonatomic)UIButton *stateButton;

/**二维码*/
@property (strong, nonatomic)UIImageView *codeImage;

/**订单*/
@property (strong, nonatomic)UILabel *listLable;

/**箭头*/
@property (strong, nonatomic)UIImageView *arrowImage;



@end

@implementation EGUserInfoCatalogueCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    [self.contentView addSubview:self.userIcon];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.stateButton];
    [self.contentView addSubview:self.codeImage];
    [self.contentView addSubview:self.listLable];
    [self.contentView addSubview:self.arrowImage];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
}

@end
