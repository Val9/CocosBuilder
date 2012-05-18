//
//  CCScrollViewExporter.h
//  CCBAndEngineXml
//
//  Created by Nicolas Gramlich on 5/18/12.
//  Copyright (c) 2012 Zynga. All rights reserved.
//

#import "CCLayerExporter.h"

#define CCB_CCSCROLLVIEW_CLASS_NAME @"CCScrollView"

#define CCB_CCSCROLLVIEW_PROPERTY_CONTAINER @"container"
#define CCB_CCSCROLLVIEW_PROPERTY_DIRECTION @"direction"
#define CCB_CCSCROLLVIEW_PROPERTY_DIRECTION_HORIZONTAL 0
#define CCB_CCSCROLLVIEW_PROPERTY_DIRECTION_VERTCAL 1
#define CCB_CCSCROLLVIEW_PROPERTY_DIRECTION_BOTH 2
#define CCB_CCSCROLLVIEW_PROPERTY_CLIPS_TO_BOUNDS @"clipsToBounds"
#define CCB_CCSCROLLVIEW_PROPERTY_BOUNCES @"bounces"

#define CCBAEX_TAG_CCSCROLLVIEW_ATTRIBUTE_SCALE @"scale"

#define CCBAEX_TAG_CCSCROLLVIEW_ATTRIBUTE_CCBFILENAME @"ccbFileName"
#define CCBAEX_TAG_CCSCROLLVIEW_ATTRIBUTE_DIRECTION @"direction"
#define CCBAEX_TAG_CCSCROLLVIEW_ATTRIBUTE_DIRECTION_HORIZONTAL @"horizontal"
#define CCBAEX_TAG_CCSCROLLVIEW_ATTRIBUTE_DIRECTION_VERTICAL @"vertical"
#define CCBAEX_TAG_CCSCROLLVIEW_ATTRIBUTE_DIRECTION_BOTH @"both"
#define CCBAEX_TAG_CCSCROLLVIEW_ATTRIBUTE_CLIP_TO_BOUNDS @"clipToBounds"
#define CCBAEX_TAG_CCSCROLLVIEW_ATTRIBUTE_BOUNCES @"bounces"


@interface CCScrollViewExporter : CCLayerExporter

- (void) exportCCScrollViewProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;

- (void) exportCCScrollViewContainer:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;
- (void) exportCCScrollViewDirection:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;
- (void) exportCCScrollViewClipToBounds:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;
- (void) exportCCScrollViewBounces:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;

@end
