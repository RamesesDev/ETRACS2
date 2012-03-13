/*
 * UserListQryPanel.java
 *
 * Created on December 27, 2010, 5:36 PM
 */

package org.ui;

import com.rameses.rcp.ui.annotations.StyleSheet;

/**
 *
 * @author  ms
 */
@StyleSheet
public class UserListPage extends javax.swing.JPanel {
    
    /** Creates new form UserListQryPanel */
    public UserListPage() {
        initComponents();
    }
    
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        jPanel4 = new javax.swing.JPanel();
        xLabel1 = new com.rameses.rcp.control.XLabel();
        jSplitPane1 = new javax.swing.JSplitPane();
        xSubFormPanel1 = new com.rameses.rcp.control.XSubFormPanel();
        jPanel1 = new javax.swing.JPanel();
        xDataTable1 = new com.rameses.rcp.control.XDataTable();
        xActionTextField1 = new com.rameses.rcp.control.XActionTextField();

        setPreferredSize(new java.awt.Dimension(826, 351));
        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setPadding(new java.awt.Insets(1, 1, 1, 1));
        xTitledBorder1.setTitle("Info");
        jPanel4.setBorder(xTitledBorder1);
        xLabel1.setHorizontalAlignment(javax.swing.SwingConstants.LEFT);
        xLabel1.setExpression("Group Code: #{parent.code}  Entity Type: #{parent.type}");
        xLabel1.setFont(new java.awt.Font("Arial", 1, 12));

        jSplitPane1.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(204, 204, 204)));
        jSplitPane1.setDividerLocation(300);
        jSplitPane1.setOneTouchExpandable(true);
        xSubFormPanel1.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xSubFormPanel1.setHandler("formOpener");
        org.jdesktop.layout.GroupLayout xSubFormPanel1Layout = new org.jdesktop.layout.GroupLayout(xSubFormPanel1);
        xSubFormPanel1.setLayout(xSubFormPanel1Layout);
        xSubFormPanel1Layout.setHorizontalGroup(
            xSubFormPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 661, Short.MAX_VALUE)
        );
        xSubFormPanel1Layout.setVerticalGroup(
            xSubFormPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 250, Short.MAX_VALUE)
        );
        jSplitPane1.setRightComponent(xSubFormPanel1);

        xDataTable1.setHandler("listHandler");
        xDataTable1.setName("selection");

        xActionTextField1.setActionName("listHandler.load");
        xActionTextField1.setHint("Type your search text here.");
        xActionTextField1.setName("searchtext");

        org.jdesktop.layout.GroupLayout jPanel1Layout = new org.jdesktop.layout.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(xActionTextField1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 260, Short.MAX_VALUE)
            .add(xDataTable1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 260, Short.MAX_VALUE)
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel1Layout.createSequentialGroup()
                .add(xActionTextField1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 26, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(xDataTable1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 220, Short.MAX_VALUE))
        );
        jSplitPane1.setLeftComponent(jPanel1);

        org.jdesktop.layout.GroupLayout jPanel4Layout = new org.jdesktop.layout.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(org.jdesktop.layout.GroupLayout.TRAILING, jPanel4Layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel4Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING)
                    .add(org.jdesktop.layout.GroupLayout.LEADING, xLabel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 776, Short.MAX_VALUE)
                    .add(org.jdesktop.layout.GroupLayout.LEADING, jSplitPane1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 776, Short.MAX_VALUE))
                .addContainerGap())
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel4Layout.createSequentialGroup()
                .add(21, 21, 21)
                .add(xLabel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 32, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(jSplitPane1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 254, Short.MAX_VALUE)
                .addContainerGap())
        );

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel4, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel4, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );
    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JSplitPane jSplitPane1;
    private com.rameses.rcp.control.XActionTextField xActionTextField1;
    private com.rameses.rcp.control.XDataTable xDataTable1;
    private com.rameses.rcp.control.XLabel xLabel1;
    private com.rameses.rcp.control.XSubFormPanel xSubFormPanel1;
    // End of variables declaration//GEN-END:variables
    
}
