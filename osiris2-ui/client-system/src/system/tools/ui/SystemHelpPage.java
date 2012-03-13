package system.tools.ui;

import com.rameses.rcp.ui.annotations.StyleSheet;
/*
 * SystemHelpPage.java
 *
 * Created on December 2, 2010, 11:23 AM
 * @author jaycverg
 */

@StyleSheet("system/tools/ui/SystemHelpPage.style")
public class SystemHelpPage extends javax.swing.JPanel {
    
    public SystemHelpPage() {
        initComponents();
    }
    
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        jSplitPane1 = new javax.swing.JSplitPane();
        jTabbedPane1 = new javax.swing.JTabbedPane();
        jPanel1 = new javax.swing.JPanel();
        formPanel1 = new com.rameses.rcp.util.FormPanel();
        xActionTextField1 = new com.rameses.rcp.control.XActionTextField();
        jScrollPane2 = new javax.swing.JScrollPane();
        xList1 = new com.rameses.rcp.control.XList();
        jScrollPane1 = new javax.swing.JScrollPane();
        xWebBrowser1 = new com.rameses.rcp.control.XWebBrowser();
        xActionBar1 = new com.rameses.rcp.control.XActionBar();

        jSplitPane1.setOneTouchExpandable(true);
        jTabbedPane1.setPreferredSize(new java.awt.Dimension(246, 367));

        formPanel1.setCaptionWidth(55);
        xActionTextField1.setActionName("doSearch");
        xActionTextField1.setCaption("Find");
        xActionTextField1.setHint("Type search keywords here");
        xActionTextField1.setName("searchTxt");
        xActionTextField1.setPreferredSize(new java.awt.Dimension(0, 20));
        xActionTextField1.setShowCaption(false);
        xActionTextField1.setTextCase(com.rameses.rcp.constant.TextCase.NONE);
        formPanel1.add(xActionTextField1);

        xList1.setDynamic(true);
        xList1.setExpression("#{title}");
        xList1.setItems("searchResult");
        xList1.setName("selectedResult");
        jScrollPane2.setViewportView(xList1);

        org.jdesktop.layout.GroupLayout jPanel1Layout = new org.jdesktop.layout.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(formPanel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 241, Short.MAX_VALUE)
            .add(jScrollPane2, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 241, Short.MAX_VALUE)
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel1Layout.createSequentialGroup()
                .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(jScrollPane2, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 400, Short.MAX_VALUE))
        );
        jTabbedPane1.addTab("Search", jPanel1);

        jSplitPane1.setLeftComponent(jTabbedPane1);

        xWebBrowser1.setName("htmlModel");
        jScrollPane1.setViewportView(xWebBrowser1);

        jSplitPane1.setRightComponent(jScrollPane1);

        xActionBar1.setDepends(new String[] {"htmlModel"});
        xActionBar1.setName("formActions");

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(xActionBar1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 755, Short.MAX_VALUE)
            .add(jSplitPane1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 755, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .add(xActionBar1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(jSplitPane1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 465, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JSplitPane jSplitPane1;
    private javax.swing.JTabbedPane jTabbedPane1;
    private com.rameses.rcp.control.XActionBar xActionBar1;
    private com.rameses.rcp.control.XActionTextField xActionTextField1;
    private com.rameses.rcp.control.XList xList1;
    private com.rameses.rcp.control.XWebBrowser xWebBrowser1;
    // End of variables declaration//GEN-END:variables
    
}
