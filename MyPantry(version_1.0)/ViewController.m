//
//  ViewController.m
//  MyPantry(version_1.0)
//
//  Created by Stephanie Frey on 2/19/19.
//  Copyright © 2019 Stephanie Frey. All rights reserved.
//

#import "ViewController.h"
#import <UNIRest.h>

id value;
id value2;
NSString *strData;
NSString *ingredients;
NSString *ingredients2;
NSMutableArray *json;
NSString *result = @"";
NSString *result2 = @"";
NSString *result3 = @"";
NSString *result4 = @"";

NSString *result5 = @"";
NSString *result6 = @"";

NSString *fullString = @"";


unsigned long count;

NSString *url = @"https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/findByIngredients?number=10&ranking=1&ignorePantry=false&ingredients=";

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
   instructions =  [[NSMutableArray alloc] init];
   
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

            NSString *string3 = [NSString stringWithFormat: @"\n%@", [[json objectAtIndex: i] objectForKey: @"image"]];
            result3 = [result3 stringByAppendingString:string3];
            
            
            NSString *string4 = [NSString stringWithFormat: @"\n%@", [[json objectAtIndex: i] objectForKey: @"missedIngredientCount"]];
            result5 = [result5 stringByAppendingString:string4];
            
            NSString *string5 = [NSString stringWithFormat: @"\n%@", [[json objectAtIndex: i] objectForKey: @"usedIngredientCount"]];
            result6 = [result6 stringByAppendingString:string5];
        }

        ID = [result2 componentsSeparatedByString:@"\n"];
        ID = [ID subarrayWithRange:NSMakeRange(1, ID.count - 1)];

        recipes = [result componentsSeparatedByString:@"\n"];
        recipes = [recipes subarrayWithRange:NSMakeRange(1, recipes.count - 1)];

        images = [result3 componentsSeparatedByString:@"\n"];
        images = [images subarrayWithRange:NSMakeRange(1, images.count - 1)];
        
        
        missed = [result5 componentsSeparatedByString:@"\n"];
        missed = [missed subarrayWithRange:NSMakeRange(1, missed.count - 1)];
        
        used = [result6 componentsSeparatedByString:@"\n"];
        used = [used subarrayWithRange:NSMakeRange(1, used.count - 1)];

        NSLog (@"%@",ID);
        NSLog(@"%@", recipes);
        NSLog(@"%@", images);
        NSLog(@"%@", missed);
        NSLog(@"%@", used);
    }];

}

+ (void) start2{

    for (int i = 0; i < count; i++)
    {
        [instructions addObject:@"start value"];
    }

    for (int i = 0; i < count; i++)
    {
        NSString *url1 = @"https://rapidapi.p.rapidapi.com/recipes/";
        NSString *url2 = ID[i];
        url1 = [url1 stringByAppendingString:url2];
        url1 = [url1 stringByAppendingString:@"/information"];

        //NSLog(@"%@",url1);

        NSDictionary *headers = @{@"X-RapidAPI-Host": @"spoonacular-recipe-food-nutrition-v1.https://rapidapi.p.rapidapi.com", @"X-RapidAPI-Key": @"efbde06e0cmsha6e8ba1faaf4994p18315cjsn2533676bc3b9"};
        UNIUrlConnection *asyncConnection = [[UNIRest get:^(UNISimpleRequest *request) {
            [request setUrl:url1];
            [request setHeaders:headers];
        }] asJsonAsync:^(UNIHTTPJsonResponse *response, NSError *error) {
            NSInteger code = response.code;
            NSDictionary *responseHeaders = response.headers;
            UNIJsonNode *body = response.body;
            NSData *rawBody = response.rawBody;

            NSString *strData;

            //NSData *rawBody = response.rawBody;

            strData = [[NSString alloc]initWithData:rawBody encoding:NSUTF8StringEncoding];

            NSMutableArray *json2 = [NSJSONSerialization JSONObjectWithData:rawBody options:kNilOptions error:&error];


            value = [json2 valueForKey:@"instructions"];
            value2 = [json2 valueForKey:@"sourceUrl"];
            //allIngredients = [[json2 valueForKey:@"extendedIngredients"] valueForKey:@"originalString"];

            //[allIngredients2 replaceObjectAtIndex:i withObject:allIngredients];
            
            if (value != [NSNull null] && value != nil)
            {
                instructionsProvided = 1;
                [instructions replaceObjectAtIndex:i withObject:value];
                
            }
            else
            {
                instructionsProvided = 0;
                [instructions replaceObjectAtIndex:i withObject:value2];
            }

            allIngredients = [[json2 valueForKey:@"extendedIngredients"] valueForKey:@"originalString"];
            
            for (int j = 0; j < allIngredients.count; j++)
            {
                fullString = [NSString stringWithFormat: @"-%@\n", allIngredients[j]];
                
                //fullString = allIngredients[j];
                //fullString = [fullString stringByAppendingString:@"\n"];
                
                if (j == (allIngredients.count - 1))
                {
                    fullString = [fullString stringByAppendingString:@"*"];
                }
                
                result4 = [result4 stringByAppendingString:fullString];
            }
            
            //NSLog(@"%@",result4);
            allIngredients2 = [result4 componentsSeparatedByString:@"*"];

            NSLog(@"%@",allIngredients2);
             }];

    }
  
}

@end


