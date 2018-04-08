//
//  CHDisclosureIndicatorView.h
//  ServiceManager
//
//  Created by Wu on 17/5/16.
//  Copyright © 2017年 wangzhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CHDisclosureIndicatorView;
@class CHIndexPath;
@protocol CHDisclosureIndicatorViewDelegate <NSObject>
- (void) didSelectedDisclosureIndicatorView:(CHDisclosureIndicatorView *)disclosureIndicatorView indexPath:(CHIndexPath *)indexPath;
@end


@interface CHDisclosureIndicatorView : UIView
@property (nonatomic , weak) id<CHDisclosureIndicatorViewDelegate> delegate;
@property (nonatomic , assign) CHIndexPath *indexPath;
@property (nonatomic , copy) NSString *title;
@property (nonatomic , copy) NSAttributedString *attributedIndicator;/**< 如果要显示属性字符串，用这个 */
@property (nonatomic , copy) NSString *indicator;
@end


@interface CHIndexPath : NSObject
@property (nonatomic , assign) NSInteger section;
@property (nonatomic , assign) NSInteger row;

- (id) initWitSection:(NSInteger)section row:(NSInteger)row;
@end
