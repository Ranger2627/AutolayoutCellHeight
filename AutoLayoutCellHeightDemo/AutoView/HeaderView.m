//
//  HeaderView.m
//  AutoLayoutCellHeightDemo
//
//  Created by Jack Xue on 2018/4/8.
//  Copyright © 2018年 Jack Xue. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView
-(void)setTitleString:(NSString *)titleString{
    _titleString = titleString;
    self.textLabel.text = _titleString;
}
-(void)updateConstraints{
    
    NSLog(@"输出View%f",self.frame.size.height);
    [super updateConstraints];
}
+(instancetype)creatHeaterView{
    return [[NSBundle mainBundle]loadNibNamed:@"HeaderView" owner:self options:nil][0];
}
@end
