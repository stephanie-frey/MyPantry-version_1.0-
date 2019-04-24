//
//  ViewController.m
//  MyPantry(version_1.0)
//
//  Created by Stephanie Frey on 2/19/19.
//  Copyright © 2019 Stephanie Frey. All rights reserved.
//

#import "ViewController.h"
#import <UNIRest.h>


NSString *strData;
NSString *ingredients;
NSString *ingredients2;
NSMutableArray *json;
NSString *result = @"";
NSString *result2 = @"";
unsigned long count;

NSString *url = @"https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/findByIngredients?number=10&ranking=2&ingredients=";

NSDictionary *headers;
UNIUrlConnection *asyncConnection;

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textEntered;


@property (weak, nonatomic) IBOutlet UILabel *textOutput;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
}

- (IBAction)buttonPressed:(UIButton *)sender {
    ingredients = _textEntered.text;
    ingredients2 = [ingredients stringByReplacingOccurrencesOfString:@", " withString:@"\n"];
     [ViewController start];
    _textOutput.text = ingredients2;
    _textEntered.text = @"";
    };

+ (void)start{
    
    headers = @{@"X-RapidAPI-Key": @"efbde06e0cmsha6e8ba1faaf4994p18315cjsn2533676bc3b9"};
    
    
    
    ingredients = [ingredients stringByReplacingOccurrencesOfString:@"," withString:@"%2C"];
    ingredients = [ingredients stringByReplacingOccurrencesOfString:@" " withString:@""];
    url = [url stringByAppendingString:ingredients];
    
    asyncConnection = [[UNIRest get:^(UNISimpleRequest *request) {
        [request setUrl:url];
        [request setHeaders:headers];
    }] asJsonAsync:^(UNIHTTPJsonResponse *response, NSError *error) {
  

        NSData *rawBody = response.rawBody;
        
        strData = [[NSString alloc]initWithData:rawBody encoding:NSUTF8StringEncoding];
        
        //NSLog(@"%@",strData);
        
        json = [NSJSONSerialization JSONObjectWithData:rawBody options:kNilOptions error:&error];
        
        NSLog(@"json: %@", json);
        
        //NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, count)];
        count = [json count];
        for(int i = 0; i < count; i++)
        {
            NSString *string = [NSString stringWithFormat: @"\n%@", [[json objectAtIndex: i] objectForKey: @"title"]];
            result = [result stringByAppendingString:string];
            
            NSString *string2 = [NSString stringWithFormat: @"\n%@", [[json objectAtIndex: i] objectForKey: @"id"]];
            
            result2 = [result2 stringByAppendingString:string2];
        }
        
        ID = [result2 componentsSeparatedByString:@"\n"];
        ID = [ID subarrayWithRange:NSMakeRange(1, ID.count - 1)];

        recipes = [result componentsSeparatedByString:@"\n"];
        recipes = [recipes subarrayWithRange:NSMakeRange(1, recipes.count - 1)];
        
        NSLog (@"%@",ID);
        NSLog(@"%@", recipes);
       
        
    }];
    
    
}


@end


