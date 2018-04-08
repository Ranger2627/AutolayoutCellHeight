//
//  AutoLayoutHeightCell.h
//  AutoLayoutCellHeightDemo
//
//  Created by Jack Xue on 2018/4/4.
//  Copyright © 2018年 Jack Xue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoLayoutHeightCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIView *tagBaseView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tagHeight;
-(void)sendValueForCellWith:(NSDictionary*)model;
@end
