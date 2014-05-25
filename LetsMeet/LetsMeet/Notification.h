//
//  Notification.h
//  LetsMeet
//
//  Created by Tsvetan Raikov on 8/11/13.
//  Copyright (c) 2013 HackTeam16. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    WeatherConditionSunny,
    WeatherConditionRainy,
    WeatherConditionSnow
} WeatherCondition;

typedef enum {
    WeekDayMonday = 1 >> 0,
    WeekDayTuesday = 1 >> 1,
    WeekDayWednesday = 1 >> 2,
    WeekDayThursday = 1 >> 3,
    WeekDayFriday = 1 >> 4,
    WeekDaySaturday = 1 >> 5,
    WeekDaySunday = 1 >> 6,
    WeekDayWorkDays = WeekDayMonday | WeekDayTuesday | WeekDayWednesday | WeekDayThursday | WeekDayFriday,
    WeekDayWeekend = WeekDaySaturday | WeekDaySunday
} WeekDay;

@interface Notification : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSMutableArray *conditions;
@property (nonatomic, strong) NSString *action;
@property (nonatomic, strong) NSMutableArray *icons;

@end
