//
//  ViewController.m
//  cocoaPodsDemo
//
//  Created by 王岩 on 16/5/5.
//  Copyright © 2016年 OneYear. All rights reserved.
//

#import "ViewController.h"
#import "Post.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [Post getNewPosts];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
