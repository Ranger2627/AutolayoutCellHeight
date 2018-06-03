//
//  HeaderView.h
//  AutoLayoutCellHeightDemo
//
//  Created by Jack Xue on 2018/4/8.
//  Copyright © 2018年 Jack Xue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderView : UIView
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (copy, nonatomic) NSString *titleString;
+(instancetype)creatHeaterView;
@end
