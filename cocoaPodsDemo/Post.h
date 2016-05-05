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

@property (copy,nonatomic) NSString *title; //文章标题
@property (copy,nonatomic) NSString *postDate; //文章发表时间
@property (copy,nonatomic) NSString *postUrl; //文章正文内容的 Url

+ (NSArray *)getNewPosts; //获取所有文章
+ (instancetype)postWithHtmlStr:(ONOXMLElement *)element; //用HTML数据创建Post类

@end
