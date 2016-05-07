//
//  Post.m
//  cocoaPodsDemo
//
//  Created by 王岩 on 16/5/5.
//  Copyright © 2016年 OneYear. All rights reserved.
//

#import "Post.h"
#import <Ono.h>

static NSString *const licenseUrlStr = @"http://ris.szpl.gov.cn/bol/";

@implementation Post

+ (NSMutableArray *)getNewPosts
{
    NSMutableArray *array = [NSMutableArray array];
    
    NSData *gbkData = [NSData dataWithContentsOfURL:[NSURL URLWithString:licenseUrlStr]];//下载网页数据
    NSError *error;
    //NSLog(@"%@第一次",gbkData);
    
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSString *utf8Str = [[NSString alloc] initWithData:gbkData encoding:enc];
    NSData *data = [utf8Str dataUsingEncoding:NSUTF8StringEncoding];
    //NSLog(@"%@第二次",data);
    
    ONOXMLDocument *doc = [ONOXMLDocument HTMLDocumentWithData:data error:&error];
    //NSLog(@"%@",doc);
    
    ONOXMLElement *postsParentElement = [doc firstChildWithXPath:@"//table[@width='100%']/tr/td/table"]; //寻找该 XPath 代表的 HTML 节点
    //NSLog(@"%@",postsParentElement);
    
    //遍历其子节点
    [postsParentElement.children enumerateObjectsUsingBlock:^(ONOXMLElement *element, NSUInteger idx, BOOL *_Nonnull stop) {
        
        NSLog(@"%@",element);
        
        Post *post = [Post postWithHtmlStr:element];
        if (post.name) {
            [array addObject:post];
        }
    }];
    
    return array;
}

+ (instancetype)postWithHtmlStr:(ONOXMLElement *)element
{
    Post *p = [Post new];
    
    ONOXMLElement *nameElement = [element firstChildWithXPath:@"td[3]/a"];// 根据 XPath 获取含有文章标题的 a 标签
    p.licenseUrl = [nameElement valueForAttribute:@"href"];//获取 a 标签的 href 属性
    p.name = [nameElement stringValue];
    
    ONOXMLElement *companyElement = [element firstChildWithXPath:@"td[4]"];//根据 XPath 获取文章发布时间 公司 标签
    p.company = [companyElement stringValue];
    
    ONOXMLElement *districtElement = [element firstChildWithXPath:@"td[5]"];//根据 XPath 获取文章发布时间 span 标签
    p.district = [districtElement stringValue];
    
    ONOXMLElement *dateElement = [element firstChildWithXPath:@"td[6]"];//根据 XPath 获取文章发布时间 span 标签
    p.date = [dateElement stringValue];
    
    return p;
}


- (void)setLicenseUrl:(NSString *)licenseUrl
{
    _licenseUrl = [NSString stringWithFormat:@"%@%@",licenseUrlStr,licenseUrl];
}

@end
