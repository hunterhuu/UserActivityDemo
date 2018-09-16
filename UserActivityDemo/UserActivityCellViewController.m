//
//  UserActivityCellViewController.m
//  UserActivityDemo
//
//  Created by 胡奇 on 2018/6/27.
//  Copyright © 2018年 胡奇. All rights reserved.
//

#import "UserActivityCellViewController.h"
#import <CoreSpotlight/CoreSpotlight.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface UserActivityCellViewController () <NSUserActivityDelegate>

@property (nonatomic, strong)NSUserActivity *userActivity;

@end

@implementation UserActivityCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self textMethod];
}

- (void)textMethod {
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:@"UserActivityTypesID"];
    userActivity.title = self.title;
    userActivity.userInfo = @{@"title":self.title, @"content" : @"content"};
    userActivity.keywords = [NSSet setWithObjects:self.title, nil];
    userActivity.delegate = self;
    userActivity.eligibleForHandoff = NO;
    userActivity.eligibleForSearch = YES;
    self.userActivity = userActivity;
    //    userActivity.eligibleForPublicIndexing = YES;
    
    CSSearchableItemAttributeSet *attSet = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:(NSString *)kUTTypeContact];
    attSet.title = @"attSet.title";
    attSet.contentDescription = @"attSet.contentDescription";
    attSet.supportsPhoneCall = @1;
    attSet.phoneNumbers = @[@"1234567890123"];
//    attSet.emailAddresses = @[@"123@456.com"];
//    attSet.keywords = @[@"attSet"];
    
    userActivity.contentAttributeSet = attSet;
    
    
//    CSSearchableItem *item = [[CSSearchableItem alloc] initWithUniqueIdentifier:@"UniqueIdentifier" domainIdentifier:@"domainIdentifier" attributeSet:attSet];
    
    [userActivity becomeCurrent];
    NSLog(@"textMethod");
}

- (void)userActivityWillSave:(NSUserActivity *)userActivity {
    NSLog(@"userActivityWillSave");
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
