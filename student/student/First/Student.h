//
//  Student.h
//  student
//
//  Created by 房彤 on 2020/7/28.
//  Copyright © 2020 房彤. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject
//学生信息  姓名 班级 学号 总分
@property NSString *nameStr;
@property NSString *classStr;
@property NSString *numStr;
@property NSString *scoreStr;


@end

NS_ASSUME_NONNULL_END
