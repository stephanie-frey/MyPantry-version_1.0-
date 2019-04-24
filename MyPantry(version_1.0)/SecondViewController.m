//
//  SecondViewController.m
//  MyPantry(version_1.0)
//
//  Created by Stephanie Frey on 4/10/19.
//  Copyright © 2019 Stephanie Frey. All rights reserved.
//
#import "ViewController.h"
#import "TableViewController.h"
#import "SecondViewController.h"
#import <UNIRest.h>

NSArray *instructions;

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *recipeTitle;
@property (weak, nonatomic) IBOutlet UILabel *directions;


@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [SecondViewController start];
    _recipeTitle.text = recipes[myIndex];
    _directions.text = instructions[myIndex];
}

+ (void) start{

    NSString *url1 = @"https://rapidapi.p.rapidapi.com/recipes/";

    NSString *url2 = ID[myIndex];

    url1 = [url1 stringByAppendingString:url2];
    url1 = [url1 stringByAppendingString:@"/information"];

    NSLog(@"%@", url1);

    NSDictionary *headers = @{@"X-RapidAPI-Host": @"spoonacular-recipe-food-nutrition-v1.https://rapidapi.p.rapidapi.com", @"X-RapidAPI-Key": @"efbde06e0cmsha6e8ba1faaf4994p18315cjsn2533676bc3b9"};
    UNIUrlConnection *asyncConnection = [[UNIRest get:^(UNISimpleRequest *request) {
        [request setUrl:url1];
        [request setHeaders:headers];
    }] asJsonAsync:^(UNIHTTPJsonResponse *response, NSError *error) {
        NSInteger code = response.code;
        NSDictionary *responseHeaders = response.headers;
        UNIJsonNode *body = response.body;
        //NSData *rawBody = response.rawBody;

        NSString *strData;

        NSData *rawBody = response.rawBody;

        strData = [[NSString alloc]initWithData:rawBody encoding:NSUTF8StringEncoding];

        NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:rawBody options:kNilOptions error:&error];

        NSLog(@"%@",json);
        unsigned long count = [json count];

        //NSLog(@"%@",strData);
        NSString *result;

    }];
}

    
@end
