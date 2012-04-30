/*
 * CocosBuilder: http://www.cocosbuilder.com
 *
 * Copyright (c) 2012 Zynga Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#import "CCBXAndEngineXml.h"
#import "XMLWriter.h"

#define CCBX_VERSION 3

#define CCBAEX_VERSION 1

#define TAG_CCB @"CCB"
#define TAG_CCB_ATTRIBUTE_STAGE_HEIGHT @"stageHeight"
#define TAG_CCB_ATTRIBUTE_STAGE_WIDTH @"stageWidth"
#define TAG_CCB_ATTRIBUTE_CENTERED_ORIGIN @"centeredOrigin"
#define TAG_CCB_ATTRIBUTE_VERSION @"version"

@implementation CCBXAndEngineXml

- (NSString*) extension
{
    return @"ccbaex";
}

- (NSData*) exportDocument:(NSDictionary*)doc flattenPaths:(BOOL)flattenPaths
{
    /* Sanity check for correct document version. */
    int fileVersion = [[doc objectForKey:@"fileVersion"] intValue];
    if(fileVersion != CCBX_VERSION) {
        /* Get the XML result as a NSString. */
        NSString* error = [NSString stringWithFormat:@"<fail reason=\"Supplied document has unsupported version='%d'!\"/>", fileVersion];

        /* Return the error message as NSData. */
        return [error dataUsingEncoding:NSUTF8StringEncoding];
    }

    /* Allocate XMLWriter. */
    XMLWriter* xmlWriter = [[XMLWriter alloc]init];

    [xmlWriter write:@"<?xml version=\"1.0\" encoding=\"UTF-8\"?>"];

    /* Traverse SceneGraph. */
    [xmlWriter writeStartElement:TAG_CCB];
    [xmlWriter writeAttribute:TAG_CCB_ATTRIBUTE_STAGE_WIDTH value:[[doc objectForKey:@"stageWidth"] stringValue]];
    [xmlWriter writeAttribute:TAG_CCB_ATTRIBUTE_STAGE_HEIGHT value:[[doc objectForKey:@"stageHeight"] stringValue]];
    [xmlWriter writeAttribute:TAG_CCB_ATTRIBUTE_CENTERED_ORIGIN value:[[doc objectForKey:@"centeredOrigin"] boolValue] ? @"true" : @"false"];

    {
        /* 
        NSArray* nodeGraph = [doc objectForKey:@"nodeGraph"];
        if(nodeGraph) {
            parseNode(
        }
        */
    }
    [xmlWriter writeAttribute:TAG_CCB_ATTRIBUTE_VERSION value:[[NSNumber numberWithInt:CCBAEX_VERSION] stringValue]];

    [xmlWriter writeEndElement];

    /* Get the XML result as a NSString. */
    NSString* xml = [xmlWriter toString];

    /* Return is as NSData. */
    return [xml dataUsingEncoding:NSUTF8StringEncoding];
}

@end
