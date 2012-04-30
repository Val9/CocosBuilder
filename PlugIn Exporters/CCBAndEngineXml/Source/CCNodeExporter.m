//
//  CCNodeExporter.m
//  CCBAndEngineXml
//
//  Created by Nicolas Gramlich on 4/30/12.
//  Copyright (c) 2012 Zynga. All rights reserved.
//

#import "CCNodeExporter.h"

@implementation CCNodeExporter

- (id) init
{
    return [super initWithNodeName:CCBAEX_TAG_CCNODE];
}

- (id) initWithNodeName:(NSString*)pNodeName 
{
    return [super initWithNodeName:pNodeName];
}

- (void)exportNodeProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    [self exportCCNodeProperties:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
}

- (void)exportCCNodeProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    float x = [[self findProperty:CCB_CCNODE_PROPERTY_POSITION withProperties:pProperties withIndex:0] floatValue];
    float y = [[self findProperty:CCB_CCNODE_PROPERTY_POSITION withProperties:pProperties withIndex:1] floatValue];
    int positionTypeValue = [[self findProperty:CCB_CCNODE_PROPERTY_POSITION withProperties:pProperties withIndex:2] intValue];
    NSString * positionType = [self convertPositionTypeValueToPositionType:positionTypeValue];
    
    float width = [[self findProperty:CCB_CCNODE_PROPERTY_CONTENT_SIZE withProperties:pProperties withIndex:0] floatValue];
    float height = [[self findProperty:CCB_CCNODE_PROPERTY_CONTENT_SIZE withProperties:pProperties withIndex:1] floatValue];
    int sizeTypeValue = [[self findProperty:CCB_CCNODE_PROPERTY_CONTENT_SIZE withProperties:pProperties withIndex:2] intValue];
    NSString * sizeType = [self convertSizeTypeValueToSizeType:sizeTypeValue];
    
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_POSITION_X value:[[NSNumber numberWithFloat:x] stringValue]];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_POSITION_Y value:[[NSNumber numberWithFloat:y] stringValue]];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_POSITION_TYPE value:positionType];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_SIZE_WIDTH value:[[NSNumber numberWithFloat:width] stringValue]];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_SIZE_HEIGHT value:[[NSNumber numberWithFloat:height] stringValue]];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_SIZE_TYPE value:sizeType];
}
@end
