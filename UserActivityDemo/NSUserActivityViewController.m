//
//  NSUserActivityViewController.m
//  UserActivityDemo
//
//  Created by 胡奇 on 2018/6/26.
//  Copyright © 2018年 胡奇. All rights reserved.
//

#import "NSUserActivityViewController.h"
#import "UserActivityCellViewController.h"

@interface NSUserActivityViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tablview;
@property (nonatomic, strong) NSArray <NSString *>*dataArray;
@end

@implementation NSUserActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataArray = @[@"ViewController", @"Movie", @"Music", @"PDF", ];
    self.tablview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tablview.delegate = self;
    self.tablview.dataSource = self;
    [self.view addSubview:self.tablview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UserActivityCellViewController *vc = [[UserActivityCellViewController alloc] init];
    vc.title = self.dataArray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
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
