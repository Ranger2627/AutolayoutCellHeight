//
//  AutoHeightCell.h
//  RunTimeButtonDemo
//
//  Created by Jack Xue on 2018/4/1.
//  Copyright © 2018年 Jack Xue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoHeightCell : UITableViewCell
//以下两行在你没有拖动过来之前是不会出现的
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *botLabel;
//自定义的赋值给cell的方法
-(void)sendValueForCell:(NSDictionary*)model;
@end
