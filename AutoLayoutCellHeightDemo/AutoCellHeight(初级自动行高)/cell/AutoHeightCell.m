//
//  AutoHeightCell.m
//  RunTimeButtonDemo
//
//  Created by Jack Xue on 2018/4/1.
//  Copyright © 2018年 Jack Xue. All rights reserved.
//

#import "AutoHeightCell.h"

@implementation AutoHeightCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)sendValueForCell:(NSDictionary *)model{
    self.topLabel.text = model[@"Title"];
    self.botLabel.text = model[@"Context"];
}
@end
