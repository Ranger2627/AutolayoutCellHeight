//
//  CHDisclosureIndicatorView.m
//  ServiceManager
//
//  Created by Wu on 17/5/16.
//  Copyright © 2017年 wangzhi. All rights reserved.
//

#import "CHDisclosureIndicatorView.h"

@interface CHDisclosureIndicatorView()
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *indicatorLabel;
@end


@implementation CHDisclosureIndicatorView

- (IBAction)didSelectedAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(didSelectedDisclosureIndicatorView: indexPath:)]) {
        [self.delegate didSelectedDisclosureIndicatorView:self indexPath:self.indexPath];
    }
}

- (void) setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = _title;
}

- (void) setIndicator:(NSString *)indicator {
    _indicator = indicator;
    self.indicatorLabel.text = _indicator;
}

- (void) setAttributedIndicator:(NSAttributedString *)attributedIndicator {
    _attributedIndicator = attributedIndicator;
    self.indicatorLabel.attributedText = _attributedIndicator;
}

@end


@implementation CHIndexPath

- (id) initWitSection:(NSInteger)section row:(NSInteger)row {
    self = [super init];
    if (self) {
        _section = section;
        _row = row;
    }
    return self;
}

@end
