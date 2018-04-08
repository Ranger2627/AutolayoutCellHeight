//
//  ViewController.m
//  AutoLayoutCellHeightDemo
//
//  Created by Jack Xue on 2018/4/4.
//  Copyright © 2018年 Jack Xue. All rights reserved.
//

#import "ViewController.h"
#import "AutoRowHeightController.h"
#import "AdvencedAutoHeightController.h"
#import "HeaderView.h"
#import "CHDisclosureIndicatorView.h"


@interface ViewController ()
@property(strong,nonatomic)HeaderView*headerView;
@property (nonatomic , strong) CHDisclosureIndicatorView *diView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor darkGrayColor];
    NSArray *sendTitleArray = @[@"基础",@"高级"];
    [self creatTwoButton:sendTitleArray];
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.diView];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)creatTwoButton:(NSArray*)getTitleArray{
    
    for (NSInteger i = 0; i < getTitleArray.count ; i++) {
        //只是随意写出2个button的位置，看起来麻烦的话完全不用介意的:)
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 400+40*i, 100, 30)];
        [button setTitle:getTitleArray[i] forState:(UIControlStateNormal)];
        button.backgroundColor = [UIColor orangeColor];
        //点击事件中根据tag值来判断进入基础/高级
        button.tag = i;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:button];
    }
    
}

-(void)buttonAction:(UIButton*)sender{
    if (sender.tag == 0) {
        //基础应用
        AutoRowHeightController *new = [[AutoRowHeightController alloc]init];
        [self.navigationController pushViewController:new animated:YES];
    }else{
        //高级应用
        AdvencedAutoHeightController *new = [[AdvencedAutoHeightController alloc]init];
        [self.navigationController pushViewController:new animated:YES];
    }
}

-(HeaderView*)headerView{
    if (!_headerView) {
        _headerView = [[NSBundle mainBundle]loadNibNamed:@"HeaderView" owner:nil options:nil][0];
        _headerView.titleString = @"1234534567890-4567893456783456783456783456783456734567";
    }
    return _headerView;
}

- (CHDisclosureIndicatorView *) diView {
    if (_diView == nil) {
        _diView = [[[UINib nibWithNibName:@"CHDisclosureIndicatorView" bundle:nil] instantiateWithOwner:nil options:nil] lastObject];
        _diView.layer.cornerRadius = 5;
//        _diView.delegate = self;
        _diView.title = @"默默";
        _diView.indicator = @"123\n456\n789\n34343\n34343\n34343\n34343";
        //        _diView.indexPath.section = 0;
        //        _diView.indexPath.row = 0;
        _diView.frame = CGRectMake(0, 200, 375, _diView.frame.size.height);

    }
    return _diView;
}

@end
