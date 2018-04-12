//
//  ViewController.m
//  demo
//
//  Created by 王充 on 2018/4/12.
//  Copyright © 2018年 王充. All rights reserved.
//

#import "ViewController.h"
#import "BrowseTableViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) UITableView *mainTableView;
@property (nonatomic, strong) NSMutableArray *dataList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self setupData];
}
#pragma mark - private method

/**
 设置数据
 */
- (void)setupData{
    NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:2];
    
    for (int i = 0; i < 189; i++) {
        [tmpArray addObject:[NSString stringWithFormat:@"%d",i + 1]];
        if (tmpArray.count == 2) {
            [self.dataList addObject:tmpArray.copy];
            [tmpArray removeAllObjects];
        }
    }
    
    if (tmpArray.count != 0) {
        [self.dataList addObject:tmpArray];
    }
}

- (void)initView{
    UITableView *mainTableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    mainTableView.delegate = self;
    mainTableView.dataSource = self;
    mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:mainTableView];
    self.mainTableView = mainTableView;
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BrowseTableViewCell *cell = [[BrowseTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    [cell setDataList:self.dataList[indexPath.row]];
    cell.superVC = self;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count / 2;
}
#pragma mark - 懒加载
- (NSMutableArray *)dataList{
    if (!_dataList) {
        NSMutableArray *dataList = [NSMutableArray array];
        _dataList = dataList;
    }
    return _dataList;
}


@end
