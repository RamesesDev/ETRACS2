/*
 * FloatingWindowBorder.java
 *
 * Created on December 20, 2010, 10:11 AM
 * @author jaycverg
 */

package com.rameses.osiris2.nb.windows;

import java.awt.Color;
import java.awt.Component;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Insets;
import java.awt.RenderingHints;
import javax.swing.border.AbstractBorder;


public class FloatingWindowBorder extends AbstractBorder {
    
    private Color outline;
    private Color dropShadow;
    private Insets insets = new Insets(1,1,5,5);
    
    public FloatingWindowBorder() {
        Color black = Color.BLACK;
        
        outline = Color.LIGHT_GRAY;
        dropShadow = new Color(black.getRed(), black.getGreen(), black.getBlue(), 30);
    }
    
    public void paintBorder(Component c, Graphics g, int x, int y, int width, int height) {
        Graphics2D g2 = (Graphics2D) g.create();
        g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

        g2.setColor(dropShadow);
        g2.fillRect(x+4, y+4, width-1, height-1);
        
        g2.setColor(outline);
        g2.drawRoundRect(x, y, width-5, height-5, 5, 5);
        
        g2.dispose();
    }
    
    public Insets getBorderInsets(Component c) {
        return insets;
    }
    
    public Insets getBorderInsets(Component c, Insets insets) {
        return insets;
    }
    
}
