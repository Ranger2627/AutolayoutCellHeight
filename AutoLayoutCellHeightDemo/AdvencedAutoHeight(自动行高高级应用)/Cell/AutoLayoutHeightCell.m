//
//  AutoLayoutHeightCell.m
//  AutoLayoutCellHeightDemo
//
//  Created by Jack Xue on 2018/4/4.
//  Copyright © 2018年 Jack Xue. All rights reserved.
//

#import "AutoLayoutHeightCell.h"
#define mainWidth [UIScreen mainScreen].bounds.size.width

@implementation AutoLayoutHeightCell{
    CGFloat baseViewHeight;
}

- (void)awakeFromNib {
    //1.cell出现最先调用
    [super awakeFromNib];
}

-(void)sendValueForCellWith:(NSDictionary *)model{
    //2.赋值第二个调用
    //给标题赋值
    self.titleLabel.text = model[@"Title"];
    //给价格赋值
    self.priceLabel.text = model[@"Price"];
    //动态生成标签(tags)
    baseViewHeight = 0; //默认tagBaseView的高度是0
    NSLog(@"宽度%f",self.tagBaseView.frame.size.width);
    if (![model[@"Tags"] isEqualToString:@""]) {
        //tags不为空的情况下执行
        //适配不同屏幕
        NSArray *tagArray = [model[@"Tags"] componentsSeparatedByString:@","];
        for (NSInteger i = 0; i < tagArray.count; i++) {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake((i%5)*((345/375.0*mainWidth-40)/5+10), i/5*25, (345/375.0*mainWidth-40)/5, 20)];
            //下面是一些常规属性
            label.text = tagArray[i];
            label.backgroundColor = [UIColor grayColor];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor whiteColor];
            [self.tagBaseView addSubview:label];
            if (i == tagArray.count-1) {
                //最后一次循环，求出此时tagBaseView应有的高度
                //实际上就是最后一个label底部到tagBaseView顶部的距离
                baseViewHeight = label.frame.origin.y + label.frame.size.height;
            }
        }//for循环结束
    }
}

-(void)updateConstraints{
    //3.重新计算cell高度
    [self.tagHeight setConstant:baseViewHeight];
    NSLog(@"得到高度%f",baseViewHeight);
    //这个父类updateConstraints方法要在最后调用
    [super updateConstraints];
}

-(void)prepareForReuse{
    //4.准备重用是删除自己添加的label
    for (UIView * view in [self.tagBaseView subviews]) {
        [view removeFromSuperview];
    }
    [super prepareForReuse];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
