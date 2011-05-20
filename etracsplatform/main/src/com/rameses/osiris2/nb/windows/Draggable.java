/*
 * Draggable.java
 *
 * Created on December 15, 2010, 10:25 AM
 * @author jaycverg
 */

package com.rameses.osiris2.nb.windows;

import java.awt.Point;
import java.awt.Rectangle;


public interface Draggable {
    
    boolean isDraggable();
    Rectangle getHandleBounds();
    Point getAnchorPoint();
    void setAnchorPoint(Point p);
    
}
