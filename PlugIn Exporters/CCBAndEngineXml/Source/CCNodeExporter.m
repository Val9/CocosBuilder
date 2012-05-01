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
    /* Position. */
    float x = [[self findProperty:CCB_CCNODE_PROPERTY_POSITION withProperties:pProperties withIndex:0] floatValue];
    float y = [[self findProperty:CCB_CCNODE_PROPERTY_POSITION withProperties:pProperties withIndex:1] floatValue];
    int positionTypeValue = [[self findProperty:CCB_CCNODE_PROPERTY_POSITION withProperties:pProperties withIndex:2] intValue];
    NSString * positionType = [self convertPositionTypeValueToPositionType:positionTypeValue];

    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_POSITION_X value:[[NSNumber numberWithFloat:x] stringValue]];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_POSITION_Y value:[[NSNumber numberWithFloat:y] stringValue]];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_POSITION_TYPE value:positionType];

    /* ContentSize. */
    float width = [[self findProperty:CCB_CCNODE_PROPERTY_CONTENT_SIZE withProperties:pProperties withIndex:0] floatValue];
    float height = [[self findProperty:CCB_CCNODE_PROPERTY_CONTENT_SIZE withProperties:pProperties withIndex:1] floatValue];
    int sizeTypeValue = [[self findProperty:CCB_CCNODE_PROPERTY_CONTENT_SIZE withProperties:pProperties withIndex:2] intValue];
    NSString * sizeType = [self convertSizeTypeValueToSizeType:sizeTypeValue];

    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_SIZE_WIDTH value:[[NSNumber numberWithFloat:width] stringValue]];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_SIZE_HEIGHT value:[[NSNumber numberWithFloat:height] stringValue]];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_SIZE_TYPE value:sizeType];

    /* AnchorPoint. */
    float anchorPointX = [[self findProperty:CCB_CCNODE_PROPERTY_ANCHORPOINT withProperties:pProperties withIndex:0] floatValue];
    float anchorPointY = [[self findProperty:CCB_CCNODE_PROPERTY_ANCHORPOINT withProperties:pProperties withIndex:1] floatValue];

    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_ANCHORPOINT_X value:[[NSNumber numberWithFloat:anchorPointX] stringValue]];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_ANCHORPOINT_Y value:[[NSNumber numberWithFloat:anchorPointY] stringValue]];

    /* RelativeAnchorPoint. */
    BOOL isRelativeAnchorPoint = [[self findProperty:CCB_CCNODE_PROPERTY_IS_RELATIVE_ANCHORPOINT withProperties:pProperties] boolValue];

    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_ANCHORPOINT_IGNORE_FOR_OFFSET value:(isRelativeAnchorPoint) ? @"true" : @"false"];

    /* Scale. */
    float scaleX = [[self findProperty:CCB_CCNODE_PROPERTY_SCALE withProperties:pProperties withIndex:0] floatValue];
    float scaleY = [[self findProperty:CCB_CCNODE_PROPERTY_SCALE withProperties:pProperties withIndex:1] floatValue];
    
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_SCALE_X value:[[NSNumber numberWithFloat:scaleX] stringValue]];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_SCALE_Y value:[[NSNumber numberWithFloat:scaleY] stringValue]];

    /* Rotation. */
    float rotation = [[self findProperty:CCB_CCNODE_PROPERTY_ROTATION withProperties:pProperties] floatValue];

    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_ROTATION value:[[NSNumber numberWithFloat:rotation] stringValue]];

    /* Visible. */
    BOOL visible = [[self findProperty:CCB_CCNODE_PROPERTY_VISIBLE withProperties:pProperties] boolValue];

    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_VISIBLE value:(visible) ? @"true" : @"false"];

    /* Tag. */
    int tag = [[self findProperty:CCB_CCNODE_PROPERTY_TAG withProperties:pProperties] intValue];

    [pXMLWriter writeAttribute:CCB_CCNODE_PROPERTY_TAG value:[[NSNumber numberWithInt:tag] stringValue]];
}
@end
