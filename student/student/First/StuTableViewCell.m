//
//  StuTableViewCell.m
//  student
//
//  Created by 房彤 on 2020/7/29.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "StuTableViewCell.h"

@implementation StuTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if([self.reuseIdentifier isEqualToString:@"ft"]) {
        

    self.nameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.nameLabel];
    
    self.classLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.classLabel];
    
    self.numLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.numLabel];
    
    self.scoreLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.scoreLabel];
    
//    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    self.nameLabel.frame = CGRectMake(20, 5, 60, 30);
    self.classLabel.frame = CGRectMake(110, 5, 50, 30);
    self.numLabel.frame = CGRectMake(205, 5, 70, 30);
    self.scoreLabel.frame = CGRectMake(315, 5, 70, 30);
    
    self.nameLabel.font = [UIFont systemFontOfSize:18];
    self.classLabel.font = [UIFont systemFontOfSize:17];
    self.numLabel.font = [UIFont systemFontOfSize:17];
    self.scoreLabel.font = [UIFont systemFontOfSize:17];
    
    self.nameLabel.textColor = [UIColor whiteColor];
    self.classLabel.textColor = [UIColor whiteColor];
    self.numLabel.textColor = [UIColor whiteColor];
    self.scoreLabel.textColor = [UIColor whiteColor];
    
}
@end
