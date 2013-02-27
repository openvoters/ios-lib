/*
 *   This file is part of OpenVoters, the open library for mobile voting.
 *
 *   OpenVoters is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   OpenVoters is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with OpenVoters.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

#import "OVRemoteAPI.h"
#import "OVConfiguration.h"
#import "OVItem.h"
#import "AFHTTPClient.h"
#import "AFJSONRequestOperation.h"

@implementation OVRemoteAPI

+ (void)getList:(void (^)(NSArray *))successBlock error:(void (^)(NSError *))errorBlock {
  NSURL *baseURL = [OVConfiguration sharedInstance].baseURL;
  AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
  [httpClient setParameterEncoding:AFJSONParameterEncoding];
  NSMutableURLRequest *jsonRequest = [httpClient requestWithMethod:@"GET"
                                                              path:@"getlist"
                                                        parameters:nil];
  
  
  AFJSONRequestOperation *op = [AFJSONRequestOperation
                                JSONRequestOperationWithRequest:jsonRequest
                                success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                  NSMutableArray *result = [@[] mutableCopy];
                                  for (NSString *key in [JSON allKeys]) {
                                    NSDictionary *data = JSON[key];
                                    OVItem *item = [OVItem new];
                                    item.imageURL = data[@"imageUrl"];
                                    item.name = data[@"name"];
                                    item.ID = data[@"ID"];
                                    item.twitterId = data[@"twitterId"];
                                    
                                    [result addObject:item];
                                  }
                                  
                                  if (nil != successBlock)
                                    successBlock(result);
                                }
                                failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                  if (nil != errorBlock)
                                    errorBlock(error);
                                }];
  [op start];
}

+ (void)voteItem:(OVItem *)item uniqueID:(NSString *)uniqueID success:(void (^)())successBlock error:(void (^)(NSError *))errorBlock {
  NSURL *baseURL = [OVConfiguration sharedInstance].baseURL;
  AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
  [httpClient setParameterEncoding:AFJSONParameterEncoding];
  NSMutableURLRequest *jsonRequest = [httpClient requestWithMethod:@"POST"
                                                              path:@"vote"
                                                        parameters:@{
                                      @"ID" : uniqueID,
                                      @"candidate" : item.ID
                                      }];
  
  AFJSONRequestOperation *op = [AFJSONRequestOperation
                                JSONRequestOperationWithRequest:jsonRequest
                                success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                  if (nil != successBlock)
                                    successBlock();
                                }
                                failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                  if (nil != errorBlock)
                                    errorBlock(error);
                                }];
  [op start];
}

@end