//
//  Post.m
//  cocoaPodsDemo
//
//  Created by 王岩 on 16/5/5.
//  Copyright © 2016年 OneYear. All rights reserved.
//

#import "Post.h"
#import <Ono.h>

static NSString *const kUrlStr = @"http://BigPi.me";

@implementation Post

+ (NSArray *)getNewPosts
{
    NSMutableArray *array = [NSMutableArray array];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:kUrlStr]];//下载网页数据
    
    NSError *error;
    ONOXMLDocument *doc = [ONOXMLDocument HTMLDocumentWithData:data error:&error];
    ONOXMLElement *postsParentElement = [doc firstChildWithXPath:@"/html/body/div[2]"]; //寻找该 XPath 代表的 HTML 节点
    //遍历其子节点
    [postsParentElement.children enumerateObjectsUsingBlock:^(ONOXMLElement *element, NSUInteger idx, BOOL *_Nonnull stop) {
        NSLog(@"%@",element);
    }];
    return array;
}

+ (instancetype)postWithHtmlStr:(ONOXMLElement *)element
{
    Post *p = [Post new];
    ONOXMLElement *titleElement = [element firstChildWithXPath:@"h2/a"];// 根据 XPath 获取含有文章标题的 a 标签
    p.postUrl = [titleElement valueForAttribute:@"href"];//获取 a 标签的  href 属性
    p.title = [titleElement stringValue];
    ONOXMLElement *dateElement = [element firstChildWithXPath:@"div[2]/span[1]"];//根据 XPath 获取文章发布时间 span 标签
    p.postDate = [dateElement stringValue];
    return p;
    
}

@end
