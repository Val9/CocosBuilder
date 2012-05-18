//
//  CCScrollViewExporter.m
//  CCBAndEngineXml
//
//  Created by Nicolas Gramlich on 5/18/12.
//  Copyright (c) 2012 Zynga. All rights reserved.
//

#import "CCScrollViewExporter.h"

@implementation CCScrollViewExporter

- (void) exportNodeProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    [super exportNodeProperties:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];

    [self exportCCScrollViewProperties:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
}

- (void) exportCCScrollViewProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml 
{
    [self exportCCScrollViewContainer:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
    [self exportCCScrollViewDirection:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
    [self exportCCScrollViewClipToBounds:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
    [self exportCCScrollViewBounces:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
}

- (void) exportCCNodeScale:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml{
    float scale = [[self findProperty:CCB_CCNODE_PROPERTY_SCALE withProperties:pProperties] floatValue];
    
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCSCROLLVIEW_ATTRIBUTE_SCALE value:[[NSNumber numberWithFloat:scale] stringValue]];
}

- (void) exportCCScrollViewContainer:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    NSString* container = [self findProperty:CCB_CCSCROLLVIEW_PROPERTY_CONTAINER withProperties:pProperties];
    
    NSString * ccbFileName = [container stringByReplacingOccurrencesOfString:[@"." stringByAppendingString:CCB_FILE_EXTENSION] withString:[@"." stringByAppendingString:CCBAEX_FILE_EXTENSION]];

    [pXMLWriter writeAttribute:CCBAEX_TAG_CCSCROLLVIEW_ATTRIBUTE_CCBFILENAME value:ccbFileName];
}

- (void) exportCCScrollViewDirection:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    int direction = [[self findProperty:CCB_CCSCROLLVIEW_PROPERTY_DIRECTION withProperties:pProperties] intValue];

    switch (direction) {
        case CCB_CCSCROLLVIEW_PROPERTY_DIRECTION_HORIZONTAL:
            [pXMLWriter writeAttribute:CCBAEX_TAG_CCSCROLLVIEW_ATTRIBUTE_DIRECTION value:CCBAEX_TAG_CCSCROLLVIEW_ATTRIBUTE_DIRECTION_HORIZONTAL];
            break;
        case CCB_CCSCROLLVIEW_PROPERTY_DIRECTION_VERTCAL:
            [pXMLWriter writeAttribute:CCBAEX_TAG_CCSCROLLVIEW_ATTRIBUTE_DIRECTION value:CCBAEX_TAG_CCSCROLLVIEW_ATTRIBUTE_DIRECTION_VERTICAL];
            break;
        case CCB_CCSCROLLVIEW_PROPERTY_DIRECTION_BOTH:
            [pXMLWriter writeAttribute:CCBAEX_TAG_CCSCROLLVIEW_ATTRIBUTE_DIRECTION value:CCBAEX_TAG_CCSCROLLVIEW_ATTRIBUTE_DIRECTION_BOTH];
            break;
        default:
            [NSException raise:NSInternalInconsistencyException format:@"Illegal parameter: '%d'!", direction];
            break;
    }
}

- (void) exportCCScrollViewClipToBounds:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    bool clipsToBounds = [[self findProperty:CCB_CCSCROLLVIEW_PROPERTY_CLIPS_TO_BOUNDS withProperties:pProperties] boolValue];

    [pXMLWriter writeAttribute:CCBAEX_TAG_CCSCROLLVIEW_ATTRIBUTE_CLIP_TO_BOUNDS value:(clipsToBounds) ? @"true" : @"false"];
}

- (void)exportCCScrollViewBounces:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    bool bounces = [[self findProperty:CCB_CCSCROLLVIEW_PROPERTY_BOUNCES withProperties:pProperties] boolValue];

    [pXMLWriter writeAttribute:CCBAEX_TAG_CCSCROLLVIEW_ATTRIBUTE_BOUNCES value:(bounces) ? @"true" : @"false"];   
}

@end
