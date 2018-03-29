//
//  MainViewController.m
//  RAC_demo
//
//  Created by 夏祥全 on 2018/3/28.
//  Copyright © 2018年 qwe. All rights reserved.
//

#import "MainViewController.h"
#import "XXQBasicViewController.h"

typedef NS_ENUM(NSInteger, XXQCellType) {
    XXQCell_dingyue,
};

@interface MainViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSArray *_dataArr;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MainViewController

- (void)dealloc {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTablViewUI];
    _dataArr = @[@{@"type":@(XXQCell_dingyue), @"title":@"基本用法"}];
}

- (void)setTablViewUI {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark -  UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIndentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    NSDictionary *dict = _dataArr[indexPath.row];
    cell.textLabel.text = dict[@"title"];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dict = _dataArr[indexPath.row];
    NSInteger type = [dict[@"type"] integerValue];
    switch (type) {
        case XXQCell_dingyue: {
            XXQBasicViewController *vc = [[XXQBasicViewController alloc] init];
            [self presentViewController:vc animated:YES completion:nil];
        }
            break;
            
        default:
            break;
    }
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
