//
//  HomeViewController.m
//  MobileProject
//
//  Created by wujunyang on 16/1/14.
//  Copyright © 2016年 wujunyang. All rights reserved.
//

#import "HomeViewController.h"
#import "SDCycleScrollView.h"
#import "HomeCell.h"

static NSString *const dataUrl = @"http://www.qinto.com/wap/index.php?ctl=article_cate&act=api_app_getarticle_cate&num=1&p=7";

@interface HomeViewController ()<SDCycleScrollViewDelegate>
@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;
@end

@implementation HomeViewController{
    NSString *_identify;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发现";
    self.tableVIew.tableHeaderView = self.cycleScrollView;
    self.tableVIew.rowHeight = 200;
    _identify = @"HomeCell";
    [self.tableVIew registerNib:[UINib nibWithNibName:@"HomeCell" bundle:nil] forCellReuseIdentifier:_identify];
    [self requestData];
    // Do any additional setup after loading the view.
}

- (void)requestData {
    NSString *url = dataUrl;
    [PPNetworkHelper GET:url parameters:nil success:^(id responseObject) {
        
        DLog(@"%@",responseObject);
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
        
    }];


}

- (SDCycleScrollView*)cycleScrollView {
    if (!_cycleScrollView) {
        _cycleScrollView = [[SDCycleScrollView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 140)];
        _cycleScrollView.delegate = self;
        _cycleScrollView.autoScrollTimeInterval = 4;
        _cycleScrollView.backgroundColor = [UIColor whiteColor];
    }
    return _cycleScrollView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:_identify forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 40)];
    headerView.backgroundColor = [UIColor whiteColor];
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 100, headerView.height)];
    titleLabel.font = [UIFont systemFontOfSize:14];
    switch (section) {
        case 0:
            titleLabel.text = @"推荐班级";
            break;
        case 1:
            titleLabel.text = @"推荐课程";
            break;
        case 2:
            titleLabel.text = @"推荐功能";
            break;
        default:
            break;
    }
    UIButton *moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    moreButton.frame = CGRectMake(Main_Screen_Width-100-10, 0, 100, headerView.height);
    [moreButton setTitle:@"更多>" forState:UIControlStateNormal];
    moreButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [moreButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    moreButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    moreButton.tag = section;
    [moreButton addTarget:self action:@selector(clickMore:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:titleLabel];
    [headerView addSubview:moreButton];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 2) {
        return 0.1;
    }
    return 10;
}

//点击更多
- (void)clickMore:(UIButton*)button {
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
