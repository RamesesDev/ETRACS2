package org.ui;

import com.rameses.rcp.ui.annotations.StyleSheet;
import com.rameses.rcp.ui.annotations.Template;
import templates.PopupTemplate;


/*
 * OrgPage.java
 *
 * Created on September 7, 2010, 11:12 AM
 * @author jaycverg
 */

@StyleSheet()
@Template(PopupTemplate.class)
public class SelectOrgListPage extends javax.swing.JPanel {
    
    public SelectOrgListPage() {
        initComponents();
    }
    
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        xDataTable1 = new com.rameses.rcp.control.XDataTable();

        setPreferredSize(new java.awt.Dimension(552, 349));
        xDataTable1.setHandler("listHandler");
        xDataTable1.setName("selection");

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(xDataTable1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 532, Short.MAX_VALUE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(xDataTable1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 327, Short.MAX_VALUE)
                .addContainerGap())
        );
    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.control.XDataTable xDataTable1;
    // End of variables declaration//GEN-END:variables
    
}
