//
//  Post.h
//  cocoaPodsDemo
//
//  Created by 王岩 on 16/5/5.
//  Copyright © 2016年 OneYear. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ONOXMLElement;

@interface Post : NSObject

@property (nonatomic, strong) NSMutableArray *licenses;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *district;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *company;

@property (nonatomic, copy) NSString *licenseUrl;

@property (nonatomic, assign) NSUInteger price;
@property (nonatomic, assign) NSUInteger quantity;

@property (nonatomic, strong) NSMutableArray *buildings;

+ (NSArray *)getNewPosts; //获取所有文章
+ (instancetype)postWithHtmlStr:(ONOXMLElement *)element; //用HTML数据创建Post类

@end
