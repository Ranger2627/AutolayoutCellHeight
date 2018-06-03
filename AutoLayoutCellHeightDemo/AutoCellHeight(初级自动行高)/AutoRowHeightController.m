//
//  AutoRowHeightController.m
//  RunTimeButtonDemo
//
//  Created by Jack Xue on 2018/4/1.
//  Copyright © 2018年 Jack Xue. All rights reserved.
//

#import "AutoRowHeightController.h"
#import "AutoHeightCell.h"
#import "HeaderView.h"
#define MainWidth [UIScreen mainScreen].bounds.size.width
#define MainHeight [UIScreen mainScreen].bounds.size.height

@interface AutoRowHeightController ()<UITableViewDelegate,UITableViewDataSource>
@property(copy,nonatomic)NSArray *dataArray;
@property(strong,nonatomic)UITableView *baseTableView;
@end

@implementation AutoRowHeightController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self fakeData];
    [self.view addSubview:self.baseTableView];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"AutoRowHeight";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - tableView代理
-(UITableView *)baseTableView{
    if (!_baseTableView) {
        _baseTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, MainWidth, MainHeight-64) style:(UITableViewStylePlain)];
        _baseTableView.delegate = self;
        _baseTableView.dataSource = self;
        _baseTableView.estimatedRowHeight = 100;
        _baseTableView.rowHeight = UITableViewAutomaticDimension;
        //此处为注册xib创建的cell的实现代码，不写这个会崩溃哦:)
        [_baseTableView registerNib:[UINib nibWithNibName:@"AutoHeightCell" bundle:nil] forCellReuseIdentifier:@"AutoHeightCell"];
//        HeaderView *jackHeaderView = [HeaderView creatHeaterView];
//        [_baseTableView beginUpdates];
//        [_baseTableView setTableHeaderView:jackHeaderView];
//        [_baseTableView endUpdates];
    }
    return _baseTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AutoHeightCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AutoHeightCell" forIndexPath:indexPath];
    //给cell传递数据
    NSDictionary *sendDict = self.dataArray[indexPath.row];
    [cell sendValueForCell:sendDict];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - 假数据
-(void)fakeData{
    self.dataArray = @[
                       @{@"Title":@"iOS系统",@"Context":@"iOS 以非同寻常的个性化方式和强大功能，为 iPhone 和 iPad 注入强劲的生命力。它拥有优雅易用的界面，可应你所需即时提供智能建议，更采用多项先进技术保护你的隐私和安全。当你亲身体验过 iOS 的精彩之后，你就会明白，为什么 iPhone 和 iPad 会让这么多人爱不释手。"},
                       @{@"Title":@"一点、一扫、一拉",@"Context":@"拿起设备的那一刻，即可上手使用。一直以来，iOS 都为多点触控互动功能而设计。因此，轻点喜爱的 app，你就能马上投入工作或开心玩乐。向右轻扫，看看今天有哪些最新动态。滚动浏览数千张照片，一气呵成。iOS 的一切都经过用心设计，只为看起来赏心悦目，用起来得心应手。"},
                       @{@"Title":@"超强能力",@"Context":@"iOS 11 为 iPhone 和 iPad 注入前所未有的活力，让各种体验更强大、更个性化。众多新特性和新功能，从根本上改进了你处理各种事务的方式。文件 app 可将你的所有文件汇集在一起。借助 iPad 上的全新程序坞，你可以毫不费力地找到常用和最近用过的 app。拖放功能让你在 iPad 上轻松移动文字、照片和文件，而多任务处理让同时操作多个 app 的体验更加顺畅。当软硬件搭配如天作之合，一切都是如此得心应手，默契得超乎想象。例如， A11 仿生这款配备神经网络引擎的芯片等强大的硬件，能让各类 app 得以充分发挥。而 iOS 11 则可以充分利用面容 ID 和触控 ID 的安全性优势。此外，iPad Pro 显示屏拥有更高的刷新频率，让 Apple Pencil 响应更迅捷。"},
                       @{@"Title":@"软硬件协同设计，造就非同一般的体验",@"Context":@"相机"},
                       @{@"Title":@"有了面容 ID 和触控 ID 等先进的认证技术，以及一个专用芯片来保护你的交易安全，你可以方便、安心地尽情购物。",@"Context":@"Apple Pay"},
                       @{@"Title":@"Apple Pencil",@"Context":@"与支持 ProMotion 自适应刷新率技术的新款 iPad Pro 配对使用时，Apple Pencil 比以往更灵敏、更流畅。从你下笔到内容呈现在屏幕上，两者之间的延迟几乎令人难以察觉"},
                       @{@"Title":@"有了 iOS 11,iPad 更加多才多艺",@"Context":@"iOS 是一个庞大的增强现实平台。各类游戏和 app 现可超越屏幕限制，带来超乎想象的浸入式流畅体验。对于新一代增强现实技术的利用，让你能以虚拟的方式重新装饰家居、无需拆解就能探索物体的内部结构，甚至还能带着恐龙并肩散步。种种可能，只待你去发现。"},
                       @{@"Title":@"一个全新的世界，就在你身边",@"Context":@"增强现实"},
                       @{@"Title":@"iOS 内置一系列由 Apple 设计的核心 app，常用的比如照片、地图、信息、健康等，每款 app 都采用十分直观的设计，同时非常重视细节。除此之外，你还可以为自己想做的事，在 App Store 的数百万款 app 中找找合适的选择。App Store 为便于你搜索而精心设计，来帮你轻松找到下一个令自己爱不释手的 app。",@"Context":@"看着用着都漂亮"},
                       @{@"Title":@"Siri",@"Context":@"直接跟 Siri 开口能让你更便捷地搞定大小事务。iOS 让 Siri 更聪明更好用。得益于先进的机器学习技术，你只需简单地像日常说话那样让 Siri 来帮忙。Siri 的表达方式变得更加丰富生动，同时也有了更自然的声音。"},
                       ];
}


@end
