//
//  CoreSpotlightViewController.m
//  UserActivityDemo
//
//  Created by 胡奇 on 2018/6/26.
//  Copyright © 2018年 胡奇. All rights reserved.
//

#import "CoreSpotlightViewController.h"
#import <CoreSpotlight/CoreSpotlight.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface CoreSpotlightViewController ()

@end

@implementation CoreSpotlightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(10, 30, 50, 20)];
    button1.backgroundColor = [UIColor blueColor];
    [button1 addTarget:self action:@selector(createIndex) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(10, 70, 50, 20)];
    button2.backgroundColor = [UIColor redColor];
    [button2 addTarget:self action:@selector(deleteIndex) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createIndex {
    //创建索引
    NSInteger index = 10;
    NSMutableArray *itemsArray = [[NSMutableArray alloc] initWithCapacity:index];
    for (NSInteger i = 0; i < index; i++) {
        CSSearchableItemAttributeSet *searchSet = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:(NSString *)kUTTypeText];
        searchSet.title = [NSString stringWithFormat:@"searchSet.title_%ld", i];//标题
        searchSet.contentDescription = [NSString stringWithFormat:@"searchSet.contentDescription_%ld", i];//描述
        searchSet.keywords = @[[NSString stringWithFormat:@"hq%ld", i]];//keyword
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld", i + 1]];
        searchSet.thumbnailData = UIImagePNGRepresentation(image);//图片
        CSSearchableItem *item = [[CSSearchableItem alloc] initWithUniqueIdentifier:[NSString stringWithFormat:@"UniqueIdentifier_%ld", i] domainIdentifier:@"domainIdentifier" attributeSet:searchSet];
        
        [itemsArray addObject:item];
    }
    
    [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems:itemsArray completionHandler:^(NSError * error) {
        if (error) {
            NSLog(@"buildSearchableItem Error:%@",error.localizedDescription);
            
        } else {
            NSLog(@"buildSearchableItem OK");
        }
        
    }];
}

- (void)deleteIndex {
    [[CSSearchableIndex defaultSearchableIndex] deleteAllSearchableItemsWithCompletionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"deleteAllSearchableItems Error:%@",error.localizedDescription);
        } else {
            NSLog(@"deleteAllSearchableItems OK");
        }
    }];
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
