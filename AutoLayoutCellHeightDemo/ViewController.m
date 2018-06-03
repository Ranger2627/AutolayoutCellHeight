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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor darkGrayColor];
    NSArray *sendTitleArray = @[@"基础",@"高级"];
    [self creatTwoButton:sendTitleArray];
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



@end
