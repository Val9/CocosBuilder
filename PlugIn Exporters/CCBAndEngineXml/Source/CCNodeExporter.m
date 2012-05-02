//
//  CCNodeExporter.m
//  CCBAndEngineXml
//
//  Created by Nicolas Gramlich on 4/30/12.
//  Copyright (c) 2012 Zynga. All rights reserved.
//

#import "CCNodeExporter.h"

@implementation CCNodeExporter

- (void) exportNodeProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    [self exportCCNodeProperties:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
}

- (void)exportCCNodeProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    [self exportCCNodeMemberVarAssignment:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
    [self exportCCNodePosition:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
    [self exportCCNodeContentSize:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
    [self exportCCNodeAnchorPoint:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
    [self exportCCNodeIsRelativeAnchorPoint:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
    [self exportCCNodeScale:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
    [self exportCCNodeRotation:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
    [self exportCCNodeVisible:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
    [self exportCCNodeTag:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
}

- (void) exportCCNodeMemberVarAssignment:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    NSString * memberVarAssignmentName = [self findDirectProperty:CCB_CCNODE_DIRECTPROPERTY_MEMBERVARASSIGNMENT_NAME withNode:pNode];
    int memberVarAssignmentTypeValue = [[self findDirectProperty:CCB_CCNODE_DIRECTPROPERTY_MEMBERVARASSIGNMENT_TYPE withNode:pNode] intValue];
    NSString * memberVarAssignmentType = [self convertMemberVarAssignmentTypeValueToMemberVariableAssignmentType:memberVarAssignmentTypeValue];
    
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_MEMBERVARIABLEASSIGNMENT_NAME value:memberVarAssignmentName];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_MEMBERVARIABLEASSIGNMENT_TYPE value:memberVarAssignmentType];
}

- (void) exportCCNodePosition:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    float x = [[self findProperty:CCB_CCNODE_PROPERTY_POSITION withProperties:pProperties withIndex:0] floatValue];
    float y = [[self findProperty:CCB_CCNODE_PROPERTY_POSITION withProperties:pProperties withIndex:1] floatValue];
    int positionTypeValue = [[self findProperty:CCB_CCNODE_PROPERTY_POSITION withProperties:pProperties withIndex:2] intValue];
    NSString * positionType = [self convertPositionTypeValueToPositionType:positionTypeValue];
    
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_POSITION_X value:[[NSNumber numberWithFloat:x] stringValue]];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_POSITION_Y value:[[NSNumber numberWithFloat:y] stringValue]];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_POSITION_TYPE value:positionType];
}

- (void) exportCCNodeContentSize:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    float width = [[self findProperty:CCB_CCNODE_PROPERTY_CONTENT_SIZE withProperties:pProperties withIndex:0] floatValue];
    float height = [[self findProperty:CCB_CCNODE_PROPERTY_CONTENT_SIZE withProperties:pProperties withIndex:1] floatValue];
    int sizeTypeValue = [[self findProperty:CCB_CCNODE_PROPERTY_CONTENT_SIZE withProperties:pProperties withIndex:2] intValue];
    NSString * sizeType = [self convertSizeTypeValueToSizeType:sizeTypeValue];

    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_SIZE_WIDTH value:[[NSNumber numberWithFloat:width] stringValue]];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_SIZE_HEIGHT value:[[NSNumber numberWithFloat:height] stringValue]];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_SIZE_TYPE value:sizeType];
}

- (void) exportCCNodeAnchorPoint:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    float anchorPointX = [[self findProperty:CCB_CCNODE_PROPERTY_ANCHORPOINT withProperties:pProperties withIndex:0] floatValue];
    float anchorPointY = [[self findProperty:CCB_CCNODE_PROPERTY_ANCHORPOINT withProperties:pProperties withIndex:1] floatValue];

    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_ANCHORPOINT_X value:[[NSNumber numberWithFloat:anchorPointX] stringValue]];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_ANCHORPOINT_Y value:[[NSNumber numberWithFloat:anchorPointY] stringValue]];
}

- (void) exportCCNodeIsRelativeAnchorPoint:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    BOOL isRelativeAnchorPoint = [[self findProperty:CCB_CCNODE_PROPERTY_IS_RELATIVE_ANCHORPOINT withProperties:pProperties] boolValue];

    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_ANCHORPOINT_IGNORE_FOR_OFFSET value:(isRelativeAnchorPoint) ? @"false" : @"true"];
}

- (void) exportCCNodeScale:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    float scaleX = [[self findProperty:CCB_CCNODE_PROPERTY_SCALE withProperties:pProperties withIndex:0] floatValue];
    float scaleY = [[self findProperty:CCB_CCNODE_PROPERTY_SCALE withProperties:pProperties withIndex:1] floatValue];

    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_SCALE_X value:[[NSNumber numberWithFloat:scaleX] stringValue]];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_SCALE_Y value:[[NSNumber numberWithFloat:scaleY] stringValue]];
}

- (void) exportCCNodeRotation:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    float rotation = [[self findProperty:CCB_CCNODE_PROPERTY_ROTATION withProperties:pProperties] floatValue];

    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_ROTATION value:[[NSNumber numberWithFloat:rotation] stringValue]];
}

- (void) exportCCNodeVisible:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    BOOL visible = [[self findProperty:CCB_CCNODE_PROPERTY_VISIBLE withProperties:pProperties] boolValue];

    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_VISIBLE value:(visible) ? @"true" : @"false"];
}

- (void) exportCCNodeTag:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    int tag = [[self findProperty:CCB_CCNODE_PROPERTY_TAG withProperties:pProperties] intValue];

    [pXMLWriter writeAttribute:CCB_CCNODE_PROPERTY_TAG value:[[NSNumber numberWithInt:tag] stringValue]];
}

- (void) exportCCNodeBlendFunction:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    int blendFunctionSource = [[self findProperty:CCB_CCNODE_PROPERTY_BLENDFUNC withProperties:pProperties withIndex:0] intValue];
    int blendFunctionDestination = [[self findProperty:CCB_CCNODE_PROPERTY_BLENDFUNC withProperties:pProperties withIndex:1] intValue];

    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_BLENDFUNCTION_SOURCE value:[[NSNumber numberWithInt:blendFunctionSource] stringValue]];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_BLENDFUNCTION_DESTINATION value:[[NSNumber numberWithInt:blendFunctionDestination] stringValue]];
}

- (void) exportCCNodeColor:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    int red = [[self findProperty:CCB_CCNODE_PROPERTY_COLOR withProperties:pProperties withIndex:0] intValue];
    int green = [[self findProperty:CCB_CCNODE_PROPERTY_COLOR withProperties:pProperties withIndex:1] intValue];
    int blue = [[self findProperty:CCB_CCNODE_PROPERTY_COLOR withProperties:pProperties withIndex:2] intValue];
    int opacity = [[self findProperty:CCB_CCNODE_PROPERTY_OPACITY withProperties:pProperties] intValue];

    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_COLOR_RED value:[[NSNumber numberWithInt:red] stringValue]];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_COLOR_GREEN value:[[NSNumber numberWithInt:green] stringValue]];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_COLOR_BLUE value:[[NSNumber numberWithInt:blue] stringValue]];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCNODE_ATTRIBUTE_COLOR_ALPHA value:[[NSNumber numberWithInt:opacity] stringValue]];
}

- (NSString *)convertMemberVarAssignmentTypeValueToMemberVariableAssignmentType:(int)pMemberVarAssignmentType
{
    switch(pMemberVarAssignmentType) {
        case CCB_CCNODE_DIRECTPROPERTY_MEMBERVARASSIGNMENT_TYPE_NONE:
            return CCBAEX_TAG_CCNODE_ATTRIBUTE_MEMBERVARIABLEASSIGNMENT_TYPE_NONE;
        case CCB_CCNODE_DIRECTPROPERTY_MEMBERVARASSIGNMENT_TYPE_ROOT:
            return CCBAEX_TAG_CCNODE_ATTRIBUTE_MEMBERVARIABLEASSIGNMENT_TYPE_ROOT;
        case CCB_CCNODE_DIRECTPROPERTY_MEMBERVARASSIGNMENT_TYPE_OWNER:
            return CCBAEX_TAG_CCNODE_ATTRIBUTE_MEMBERVARIABLEASSIGNMENT_TYPE_OWNER;
        default:
            [NSException raise:NSInternalInconsistencyException format:@"Illegal parameter: '%d'!", pMemberVarAssignmentType];
            return nil;
    }
}

@end
