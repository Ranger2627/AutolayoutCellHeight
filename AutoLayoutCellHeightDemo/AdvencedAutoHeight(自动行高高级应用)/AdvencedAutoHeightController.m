//
//  AdvencedAutoHeightController.m
//  AutoLayoutCellHeightDemo
//
//  Created by Jack Xue on 2018/4/6.
//  Copyright © 2018年 Jack Xue. All rights reserved.
//

#import "AdvencedAutoHeightController.h"
#import "AutoLayoutHeightCell.h"

#define mainHeight [UIScreen mainScreen].bounds.size.height
#define mainWidth [UIScreen mainScreen].bounds.size.width
@interface AdvencedAutoHeightController ()<UITableViewDelegate,UITableViewDataSource>
@property(copy,nonatomic)NSArray *localDataArray;       //写在本地的数据
@property(strong,nonatomic)UITableView *jackTableView;  //用于显示数据的tableview
@end

@implementation AdvencedAutoHeightController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.jackTableView];
    //模拟网络请求在tableView添加后取得数据
    [self creatFakeData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 懒加载tableView&代理
-(UITableView*)jackTableView{
    if (!_jackTableView) {
        _jackTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, mainWidth, mainHeight) style:(UITableViewStylePlain)];
        _jackTableView.delegate = self;
        _jackTableView.dataSource = self;
        _jackTableView.estimatedRowHeight = 100;
        _jackTableView.rowHeight = UITableViewAutomaticDimension;
        //不要忘记注册cell的xib，不然会崩溃，不信你注释一下试试
        [_jackTableView registerNib:[UINib nibWithNibName:@"AutoLayoutHeightCell" bundle:nil] forCellReuseIdentifier:@"AutoLayoutHeightCell"];
    }
    return _jackTableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.localDataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //cell的Identifier直接用的cell文件的名字，方便tableview注册cell的xib
    AutoLayoutHeightCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AutoLayoutHeightCell" forIndexPath:indexPath];
    //传model给cell用来赋值，正常可以传自己的model，这里为了方便传了NSDictionary
    NSDictionary *model = self.localDataArray[indexPath.row];
    [cell sendValueForCellWith:model];
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - 写入假数据
-(void)creatFakeData{
    //为了能够看出来cell内底部柚子色的UIView重用问题，多录入一些数据源
    self.localDataArray = @[
                            @{
                                @"Title":@"专业人士对 iMac 情有独钟。因此，我们特意为他们打造了这款 Mac。它配备了 Mac 史上最强的中央处理器和图形处理器，还有着尤为先进的存储设备、内存和 I/O 端口。这一切都藏身于令人惊叹的视网膜 5K 显示屏之后，融入到精致简洁的一体式设计之中。无论是摄影师、视频剪辑师、3D 动画师、音乐人、软件开发者还是科研人员，每个人都能以从未想象的方式，各展所长。",
                                @"Price":@"$399",
                                @"Tags":@"4核心,6核心,8核心,12核心,16核心"
                                },
                            @{
                                @"Title":@"iMac Pro 让你能轻松构建和渲染各种静态或动态的 2D 或 3D 粒子系统",
                                @"Price":@"$667",
                                @"Tags":@"麦田,大雨,烟雾"
                                },
                            @{
                                @"Title":@"Vega 图形处理器，华丽视觉背后的凶猛利器。",
                                @"Price":@"$12",
                                @"Tags":@"Radeon,iMac,Pro,VR,浮点算,22亿,单精度,半精度,矩阵"
                                },
                            @{
                                @"Title":@"iMac Pro 配备四通道内存，可容纳最高达 128GB 的容量。因此，你可以视觉化呈现、模拟和渲染大型 3D 模型，搭建多个测试环境进行跨平台开发，还能让大量 app 同时保持开启。各种强大，只为让你从容应对各种任务。",
                                @"Price":@"$6",
                                @"Tags":@"4TB,128Bit"
                                },
                            @{
                                @"Title":@"雷雳 3 端口可连接两台 5K 监视器，让多达 4400 万颗像素呈现在你眼前，还能以 40Gb/s 的惊人速度传输数据。",
                                @"Price":@"$234",
                                @"Tags":@"10GB,I/O,Gb/s,5K,两台"
                                },
                            @{
                                @"Title":@"将两个 RAID 系统和两台 5K 显示屏连接至四个雷雳 3 端口，打造一套强大的工作站，然后在 4400 万颗像素构成的画面上欣赏你的作品。",
                                @"Price":@"$5K",
                                @"Tags":@"A10,64,iPad,晶体管,非常快,密集,多任务,FaceTime,AR"
                                },
                            @{
                                @"Title":@"一切都来自一系列值得深思的问题，现在的电脑是否反而局限了人们的做事方法？电脑究竟应该是什么样子？在今天，越来越多的人喜欢直接在 iOS 设备上",
                                @"Price":@"$456",
                                @"Tags":@"照相机,Pencil,Apple,出色,蓝牙,连接"
                                },
                            @{
                                @"Title":@"需要坐下来专心完成研究报告，写封邮件，或是推敲推敲剧本？iPad 有着直观的屏幕键盘，但同时也支持各种蓝牙键盘，输入很方便。",
                                @"Price":@"$1",
                                @"Tags":@""
                                },
                            @{
                                @"Title":@"各款强大内置 App，满载其中",
                                @"Price":@"$999",
                                @"Tags":@"iMovie,Key"
                                }
                            ];
    
    [self.jackTableView reloadData];
}

@end
