package org.ui;

import com.rameses.rcp.framework.Binding;
import com.rameses.rcp.ui.annotations.StyleSheet;

/*
 * OrgPage.java
 *
 * Created on September 7, 2010, 11:12 AM
 * @author jaycverg
 */

@StyleSheet()
public class OrgFormPage extends javax.swing.JPanel {
    
    public OrgFormPage() {
        initComponents();
    }
    
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        formPanel1 = new com.rameses.rcp.util.FormPanel();
        xLabel1 = new com.rameses.rcp.control.XLabel();
        xTextField1 = new com.rameses.rcp.control.XTextField();
        xTextField2 = new com.rameses.rcp.control.XTextField();
        xActionBar1 = new com.rameses.rcp.control.XActionBar();

        formPanel1.setCaptionWidth(100);
        formPanel1.setDynamic(true);
        formPanel1.setViewType("input");
        xLabel1.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel1.setCaption("Parent Code");
        xLabel1.setName("entity.parentcode");
        xLabel1.setPreferredSize(new java.awt.Dimension(200, 20));
        formPanel1.add(xLabel1);

        xTextField1.setCaption("Code");
        xTextField1.setIndex(-1);
        xTextField1.setName("entity.code");
        xTextField1.setPreferredSize(new java.awt.Dimension(200, 19));
        xTextField1.setReplaceExpr(new String[] {"\\s+"});
        xTextField1.setReplaceString(new String[] {"_"});
        xTextField1.setRequired(true);
        formPanel1.add(xTextField1);

        xTextField2.setCaption("Name");
        xTextField2.setName("entity.name");
        xTextField2.setPreferredSize(new java.awt.Dimension(200, 19));
        xTextField2.setRequired(true);
        formPanel1.add(xTextField2);

        xActionBar1.setDynamic(true);
        xActionBar1.setName("formActions");

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(layout.createSequentialGroup()
                        .add(formPanel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 357, Short.MAX_VALUE)
                        .add(10, 10, 10))
                    .add(xActionBar1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 367, Short.MAX_VALUE)))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .add(xActionBar1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 31, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 266, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(118, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private com.rameses.rcp.control.XActionBar xActionBar1;
    private com.rameses.rcp.control.XLabel xLabel1;
    private com.rameses.rcp.control.XTextField xTextField1;
    private com.rameses.rcp.control.XTextField xTextField2;
    // End of variables declaration//GEN-END:variables
    
}
